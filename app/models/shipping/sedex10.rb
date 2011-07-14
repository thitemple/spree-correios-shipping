class Shipping::Sedex10 < Shipping::Base
  def self.description
    'Sedex 10'
  end

  def tipo_servico
    :sedex_10
  end
end
