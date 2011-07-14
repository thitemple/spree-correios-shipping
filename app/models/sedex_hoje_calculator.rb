class Correios::SedexHojeCalculator < Correios::Base
  def self.description
    'Sedex Hoje'
  end

  def self.register
    super
    ShippingMethod.register_calculator(self)
  end

  def servico
    :sedex_hoje
  end
end
