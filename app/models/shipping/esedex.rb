class Shipping::Esedex < Shipping::Base
  def self.description
    'E-Sedex'
  end
  def tipo_servico
    :e_sedex
  end
end
