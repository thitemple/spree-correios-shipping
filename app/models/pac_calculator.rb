class Correios::PacCalculator < Correios::Base
  def self.description
    'Pac'
  end

  def self.register
    super
    ShippingMethod.register_calculator(self)
  end

  def servico
    :pac
  end
end
