require "twilio-ruby"

  class Messager
    def initialize
      @client = "Twilio"
    end
  
    def send_text(time)
      message = "Thank you, your order has been accepted, your delivery time will be #{time}"
    end
  end