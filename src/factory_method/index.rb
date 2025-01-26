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

  def initialize(vehicle_type = :truck)
    @vehicle_type = vehicle_type
  end

  def factory_method
    case @vehicle_type
    when :truck
      Truck.new
    when :car
      Car.new
    else
      Raise "Type fail for Road Logistics: '#{@vehicle_type}' "
    end
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

class Car < Transport
  def deliver
    "Transporte com carro"
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

puts "UTILIZANDO PRIMEIRA LOGISTICA ESTRADA PADRAO"
client_code(RoadLogistics.new)
puts "\n\n"
puts "UTILIZANDO PRIMEIRA LOGISTICA ESTRADA CARRO"
client_code(RoadLogistics.new(:car))
puts "\n\n"
puts "UTILIZANDO SEGUNDA LOGISTICA MAR"
client_code(SeaLogistics.new)