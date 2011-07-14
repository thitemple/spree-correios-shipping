class Shipping::Sedex < Shipping::Base
  def self.description
    'Sedex'
  end

  def tipo_servico
    :sedex
  end
end
