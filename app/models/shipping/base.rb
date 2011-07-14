require 'correios-frete'

class Shipping::Base < Calculator
  preference :zipcode, :string
  preference :default_weight, :float, :default => 1

  def self.register
    super
    ShippingMethod.register_calculator(self)
  end

  def compute(object)
    if object.is_a?(Array)
      order = object.first.order
    elsif object.is_a?(Shipment)
      order = object.order
    else
      order = object
    end

    total_price , total_weight , shipping  = 0 , 0 , 0 

    order.line_items.each do |item|
      total_weight += item.quantity * (item.variant.weight  || self.preferred_default_weight)
      total_price += item.price * item.quantity
    end

    return 0 if total_weight == 0
    
    frete = Correios::Frete.new :cep_origem => preferred_zipcode,
                                :cep_destino => order.ship_address.zipcode.to_s,
                                :peso => total_weight,
                                :comprimento => 30,
                                :largura => 15,
                                :altura => 2

    servico = frete.calcular self.tipo_servico
    servico.valor
  end

end
