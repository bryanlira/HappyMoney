module Arithmetic
  # Multiplies the monetary amount with the given number and returns a new
  # object with this monetary value and the same currency.
  def *(value)
    value = get_value(value)
    if value.is_a? Numeric
      self.class.new(self.amount * value, self.currency)
    else
      raise TypeError, "Can't multiply a #{self.class.name} by a #{value.class.name}'s value"
    end
  end

  # Divides the monetary amount with the given number and returns a new
  # object with this monetary value and the same currency.
  def /(value)
    value = get_value(value)
    if value.is_a? Numeric
      self.class.new(self.amount / value, self.currency)
    else
      raise TypeError, "#{self.class.name} can't divide by #{value.class.name}'s value"
    end
  end

  # Adds the monetary amount with the given number and returns a new
  # object with this monetary value and the same currency.
  def +(value)
    value = get_value(value)
    if value.is_a? Numeric
      self.class.new(self.amount + value, self.currency)
    else
      raise TypeError, "#{self.class.name} couldn't be added by #{value.class.name}'s value"
    end
  end

  # Subtract the monetary amount with the given number and returns a new
  # object with this monetary value and the same currency.
  def -(value)
    value = get_value(value)
    if value.is_a? Numeric
      self.class.new(self.amount - value, self.currency)
    else
      raise TypeError, "#{self.class.name} couldn't be subtracted by #{value.class.name}'s value"
    end
  end

  # Compare if the monetary amount is bigger than the given number.
  def >(element)
    if element.instance_of?(HappyMoney::Money)
      if self.currency == element.currency
        self.amount > element.amount
      else
        self.amount > element.convert_to(self.currency).amount
      end
    else
      raise TypeError, "#{self.class.name} couldn't be compared with #{element.class.name}"
    end
  end

  # Compare if the monetary amount is smaller than the given number.
  def <(element)
    if element.instance_of?(HappyMoney::Money)
      if self.currency == element.currency
        self.amount < element.amount
      else
        self.amount < element.convert_to(self.currency).amount
      end
    elsif element.is_a? Numeric
      self.amount == element
    else
      raise TypeError, "#{self.class.name} couldn't be compared with #{element.class.name}"
    end
  end

  # Compare if the monetary amount is equal to the given number.
  def ==(element)
    if element.instance_of?(HappyMoney::Money)
      if self.currency == element.currency
        self.amount == element.amount
      else
        self.amount == element.convert_to(self.currency).amount
      end
    elsif element.is_a? Numeric
      self.amount == element
    else
      raise TypeError, "#{self.class.name} couldn't be compared with #{element.class.name}"
    end
  end

  # Check if the given value is an instance of the Happy :: Money class and if it is an instance, convert
  # the value to the same currency.
  def get_value(value)
    value.instance_of?(HappyMoney::Money) ? value.convert_to(self.currency).amount : value
  end
end