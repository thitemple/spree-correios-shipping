class Shipping::SedexHoje < Shipping::Base
  def self.description
    'Sedex Hoje'
  end

  def tipo_servico
    :sedex_hoje
  end
end
