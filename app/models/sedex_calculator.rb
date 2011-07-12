require 'correios-frete'

class SedexCalculator < Calculator
  preference :zipcode, :string
  preference :default_weight, :float, :default => 1

  def self.description
    'Sedex'
  end

  def self.register
    super
    ShippingMethod.register_calculator(self)
  end

  def compute(order)

    total_price , total_weight , shipping  = 0 , 0 , 0 

    order.line_items.each do |item|
      total_weight += item.quantity * (item.variant.weight  || self.preferred_default_weight)
      total_price += item.price * item.quantity
    end

    return 0 if total_weight == 0
    
    logger.debug "------ Calculando sedex----------"
    logger.debug "Peso total: #{total_weight}"
    logger.debug "Cep origem: #{preferred_zipcode}"
    logger.debug "Cep destino: #{order.ship_address.zipcode.to_s}"
    frete = Correios::Frete.new :cep_origem => preferred_zipcode,
                                :cep_destino => order.ship_address.zipcode.to_s,
                                :peso => total_weight,
                                :comprimento => 30,
                                :largura => 15,
                                :altura => 2

    servico = frete.calcular :sedex
    servico.valor
  end

end
