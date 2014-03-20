class SmsController < ApplicationController
  include Webhookable 
  after_filter :set_header
  
 
  # base URL of this application
  BASE_URL = "http://www.yourserver.com:3000/sms"
  TWILIO_PHONE_NUMBER = '9083005599'

  def index
  end

  def receive_text_message
    @client = Twilio::REST::Client.new TWILIO_SID, TWILIO_TOKEN

    @client.account.messages.list.each do |message|
    puts message.body
  end

  def send_text_message
    number_to_send_to = params[:number_to_send_to]
 
    @twilio_client = Twilio::REST::Client.new TWILIO_SID, TWILIO_TOKEN
 
    @message = @twilio_client.account.sms.messages.create(
      :from => "+1#{TWILIO_PHONE_NUMBER}",
      :to => number_to_send_to,
      :body => "This is an message. It gets sent to #{number_to_send_to}"
    )
  end
end