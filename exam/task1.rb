# Клієнтський інтерфейс
class ClientInterface
  def request
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

# Клієнтський клас
class Client < ClientInterface
  def request
    'Client request'
  end
end

# Сервісний клас
class Service
  def specific_request
    'Service specific request'
  end
end

# Клас адаптеру
class Adapter < ClientInterface
  def initialize(service)
    @service = service
  end

  def request
    @service.specific_request
  end
end

service = Service.new
adapter = Adapter.new(service)
puts adapter.request