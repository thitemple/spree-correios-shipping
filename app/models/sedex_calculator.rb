class SedexCalculator < Calculator
  def self.description
    'Sedex - Old'
  end

  def self.register
    super
    ShippingMethod.register_calculator(self)
  end

  def compute(obj)
    0.0
  end

  def servico
    :sedex
  end
end
