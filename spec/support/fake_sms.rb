module FakeSms
  Message = Struct.new(:number, :message, :status)

  def self.send_sms(number:, message:)
    @message = Message.new(number, message, "status")
  end

  def self.message
    @message
  end

  def self.message=(value)
    @message = value
  end
end