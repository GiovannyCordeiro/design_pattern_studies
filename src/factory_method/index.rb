class Logistics
  def factory_method
    raise NotImplementedError, "#{self.class} has not implement method '#{__method__}'"
  end

  def some_operation
    product = factory_method
    "Logictica, A classe logictica esta usando a operacao do transporte #{product.deliver}"
  end
end

class RoadLogistics < Logistics
  def factory_method
    Truck.new
  end
end

class SeaLogistics < Logistics
  def factory_method
    Ship.new
  end
end

class Transport
  def deliver
    'operacao de transporte'
  end
end

class Truck < Transport
  def deliver
    'Transporte com o caminhao'
  end
end

class Ship < Transport
  def deliver
    'Transporte com o barco'
  end
end

def client_code(choiceLogistics)
  print "Executando codigo de logistica com o seguinte transporte #{choiceLogistics.some_operation}"
end

puts "UTILIZANDO PRIMEIRA LOGISTICA ESTRADA"
client_code(RoadLogistics.new)
puts "\n\n"
puts "UTILIZANDO SEGUNDA LOGISTICA MAR"
client_code(SeaLogistics.new)