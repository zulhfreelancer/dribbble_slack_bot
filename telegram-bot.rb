# Not required to run the Lambda function.
# Mainly for development purposes.

require 'telebot'

# =====================================================
# Run this to get the chat_id
# =====================================================
# bot = Telebot::Bot.new(ENV["TELEGRAM_BOT_TOKEN"])
# bot.run do |client, message|
#     chat_id = message.chat.id
#     puts("Chat ID:", chat_id)
#     client.send_message(
#         chat_id: chat_id,
#         text: "Chat ID found. Check terminal."
#     )
# end

# =====================================================
# Run this after we have chat_id
# =====================================================
# client = Telebot::Client.new(ENV["TELEGRAM_BOT_TOKEN"])
# client.send_message(chat_id: 12345678, text: "Hello!")
