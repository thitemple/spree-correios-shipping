class Correios::Sedex10Calculator < Correios::Base
  def self.description
    'Sedex 10'
  end

  def self.register
    super
    ShippingMethod.register_calculator(self)
  end

  def servico
    :sedex_10
  end
end
