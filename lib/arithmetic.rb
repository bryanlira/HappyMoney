module Arithmetic
  def *(value)
    if value.instance_of? HappyMoney::Money
      self.class.new(self.amount * value.convert_to(self.currency).amount, self.currency)
    else
      raise TypeError, "Can't multiply a #{self.class.name} by a #{value.class.name}'s value"
    end
  end

  def /(value)
    if value.instance_of? HappyMoney::Money
      self.class.new(self.amount / value.convert_to(self.currency).amount, self.currency)
    else
      raise TypeError, "#{self.class.name} can't divide by #{value.class.name}'s value"
    end
  end

  def +(value)
    if value.instance_of? HappyMoney::Money
      self.class.new(self.amount + value.convert_to(self.currency).amount, self.currency)
    else
      raise TypeError, "#{self.class.name} couldn't be added by #{value.class.name}'s value"
    end
  end

  def -(value)
    if value.instance_of? HappyMoney::Money
      self.class.new(self.amount - value.convert_to(self.currency).amount, self.currency)
    else
      raise TypeError, "#{self.class.name} couldn't be subtracted by #{value.class.name}'s value"
    end
  end

end