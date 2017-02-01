describe HappyMoney::Currency do
  it 'returns a currency table hash' do
    expect(HappyMoney::Currency.load_currencies).to be_a Hash
  end
end
