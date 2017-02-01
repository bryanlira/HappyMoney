describe HappyMoney::Money do
  describe '#*' do
    it 'allows multiple Money by Money instances' do
      expect(HappyMoney::Money.new(10, 'USD') * HappyMoney::Money.new(4, 'USD')).to eq HappyMoney::Money.new(40, 'USD')
    end
    it 'does not multiply Money by an object which is NOT a number' do
      expect { HappyMoney::Money.new(10, 'USD') *  String }.to raise_error(TypeError)
      expect { HappyMoney::Money.new(10, 'USD') *  Class }.to raise_error(TypeError)
      expect { HappyMoney::Money.new(10, 'USD') *  Array }.to raise_error(TypeError)
    end
  end
  describe '#/' do
    it 'divides Money by Money (same currency) and returns Float' do
      elements = [
          {a: HappyMoney::Money.new( 13, 'MEX'), b: HappyMoney::Money.new( 4, 'MEX'), c:  3.25},
          {a: HappyMoney::Money.new( 13, 'MEX'), b: HappyMoney::Money.new(-4, 'MEX'), c: -3.25},
          {a: HappyMoney::Money.new(-13, 'MEX'), b: HappyMoney::Money.new( 4, 'MEX'), c: -3.25},
          {a: HappyMoney::Money.new(-13, 'MEX'), b: HappyMoney::Money.new(-4, 'MEX'), c:  3.25},
      ]
      elements.each do |t|
        expect(t[:a] / t[:b]).to eq t[:c]
      end
    end
    it 'does not allow to divide Money by an object which is NOT a number' do
      expect { HappyMoney::Money.new(10, 'USD') /  String }.to raise_error(TypeError)
      expect { HappyMoney::Money.new(10, 'USD') /  Class }.to raise_error(TypeError)
      expect { HappyMoney::Money.new(10, 'USD') /  Array }.to raise_error(TypeError)
    end
  end
  describe '#+' do
    it 'adds other amount to current amount (same currency)' do
      expect(HappyMoney::Money.new(100, 'USD') + HappyMoney::Money.new(90, 'USD')).to eq HappyMoney::Money.new(190, 'USD')
    end
    it 'converts other object amount to current currency and adds other amount to current amount (different currency)' do
      other = HappyMoney::Money.new(90, 'EUR')
      expect(other.convert_to('USD')).to eq HappyMoney::Money.new(97.2, 'USD')
      expect(HappyMoney::Money.new(10, 'USD') + other).to eq HappyMoney::Money.new(107.2 , 'USD')
    end
  end
  describe '#-' do
    it 'subtracts other amount from current amount (same currency)' do
      expect(HappyMoney::Money.new(10, 'USD') - HappyMoney::Money.new(5, 'USD')).to eq HappyMoney::Money.new(5, 'USD')
    end
    it 'converts other object amount to current currency and subtracts other amount from current amount (different currency)' do
      other = HappyMoney::Money.new(5, 'EUR')
      expect(other.convert_to('USD')).to eq HappyMoney::Money.new(5.4 , 'USD')
      expect(HappyMoney::Money.new(50, 'USD') - other).to eq HappyMoney::Money.new(44.6, 'USD')
    end
  end
  describe '#>' do
    it 'compares the two object amounts (same currency)' do
      expect((HappyMoney::Money.new(50, 'USD') > HappyMoney::Money.new(20, 'USD'))).to be true
      expect((HappyMoney::Money.new(60, 'USD') > HappyMoney::Money.new(2, 'USD'))).to be true
      expect((HappyMoney::Money.new(4, 'USD') > HappyMoney::Money.new(60, 'USD'))).to be false
    end
  end
  describe '#>' do
  end
  describe '#==' do
    it 'should returns true if both amounts and currencies are equal' do
      expect(HappyMoney::Money.new(100, 'USD')).to eq HappyMoney::Money.new(100, 'USD')
      expect(HappyMoney::Money.new(40, 'USD')).not_to eq HappyMoney::Money.new(40, 'EUR')
      expect(HappyMoney::Money.new(40, 'USD')).not_to eq HappyMoney::Money.new(60, 'USD')
      expect(HappyMoney::Money.new(40, 'USD')).not_to eq HappyMoney::Money.new(80, 'EUR')
    end
    it 'should returns false if used to compare with an object that does not inherit from HappyMoney::Money' do
      expect { HappyMoney::Money.new(50, 'MEX') == Array }.to raise_error(TypeError)
      expect { HappyMoney::Money.new(50, 'MEX') == HappyMoney::Currency }.to raise_error(TypeError)
      expect { HappyMoney::Money.new(50, 'MEX') == Class }.to raise_error(TypeError)
    end
    it 'can be used to compare with an object that inherits from Money' do
      expect(HappyMoney::Money.new(10, 'USD')).to eq HappyMoney::Money.new(10, 'USD')
      expect(HappyMoney::Money.new(25, 'USD')).to eq HappyMoney::Money.new(25, 'USD')
      expect(HappyMoney::Money.new(25, 'USD')).not_to eq HappyMoney::Money.new(30, 'USD')
      expect(HappyMoney::Money.new(10, 'EUR')).not_to eq HappyMoney::Money.new(10, 'USD')
    end
    it 'allows comparison with any type of number' do
      expect(HappyMoney::Money.new(0, 'USD')).to eq 0
      expect(HappyMoney::Money.new(0, 'EUR')).to eq 0.0
      expect(HappyMoney::Money.new(5.0, 'EUR')).to eq 5.0
      expect(HappyMoney::Money.new(0, 'EUR')).to eq BigDecimal.new(0)
      expect(HappyMoney::Money.new(1, 'MEX')).to_not eq 0
    end
  end
end