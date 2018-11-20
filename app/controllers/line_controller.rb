require 'line/bot'
class LineController < ApplicationController
  protect_from_forgery with: :null_session
 
  def line # Line Bot API 物件初始化  
    @line ||= Line::Bot::Client.new { |config|
      # config.channel_secret = ENV['CHANNEL_SECRET']
      # config.channel_token = ENV['CHANNEL_TOKEN']
      config.channel_secret = '6a2c4eff4ac644a723d14d912417bffe'
      config.channel_token = 'cwFvhLSRHWwH6IQvR2QCFrmQJ1b1lVDjss6cjh49S1eqaLZrpzFVZQpRzsmvcybWiiaMp7rv5TiJPDBdj+nVmZUvvt6qRO7Mr+wtBipZkP0Uu5+l/wfLcplSbN4Km8PGv6w9QMrdAyWmDqX/1laxcwdB04t89/1O/w1cDnyilFU='
      }
  end
  def webhook
    # reply_text = simple_msg("^_^")
    # # 傳送訊息
    # response = reply_to_line(reply_text)

    # 回應 200
    head :ok
  end
  def reply_to_line(reply_text)
    return nil if reply_text.nil?
    reply_token = params['events'][0]['replyToken']
    line.reply_message(reply_token, reply_text)  
  end
  def simple_msg(vtext)
    message = {
      type: 'text',
      text: vtext
    }
  end
end
