class Shipping::Pac < Shipping::Base
  def self.description
    'Pac'
  end

  def tipo_servico
    :pac
  end
end
