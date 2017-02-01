module Arithmetic
  def *(value)
    value = get_value(value)
    if value.is_a? Numeric
      self.class.new(self.amount * value, self.currency)
    else
      raise TypeError, "Can't multiply a #{self.class.name} by a #{value.class.name}'s value"
    end
  end

  def /(value)
    value = get_value(value)
    if value.is_a? Numeric
      self.class.new(self.amount / value, self.currency)
    else
      raise TypeError, "#{self.class.name} can't divide by #{value.class.name}'s value"
    end
  end

  def +(value)
    value = get_value(value)
    if value.is_a? Numeric
      self.class.new(self.amount + value, self.currency)
    else
      raise TypeError, "#{self.class.name} couldn't be added by #{value.class.name}'s value"
    end
  end

  def -(value)
    value = get_value(value)
    if value.is_a? Numeric
      self.class.new(self.amount - value, self.currency)
    else
      raise TypeError, "#{self.class.name} couldn't be subtracted by #{value.class.name}'s value"
    end
  end

  def get_value(value)
    value.instance_of?(HappyMoney::Money) ? value.convert_to(self.currency).amount : value
  end
end