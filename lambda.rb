# require 'aws-sdk-s3'
require 'telebot'

def hello(event:, context:)
    token   = ENV["TELEGRAM_BOT_TOKEN"]
    chat_id = ENV["TELEGRAM_CHAT_ID"].to_i
    client  = Telebot::Client.new(token)
    client.send_message(chat_id: chat_id, text: "Hello from Scheduler!")
end
