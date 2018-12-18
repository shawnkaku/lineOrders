require 'line/bot'
class LineController < ApplicationController
  protect_from_forgery with: :null_session
 
  def line # Line Bot API 物件初始化  
    @line ||= Line::Bot::Client.new { |config|
      config.channel_secret = ENV['CHANNEL_SECRET']
      config.channel_token = ENV['CHANNEL_TOKEN']
      }
  end
  def webhook
    # reply_text = simple_msg("RoR")
    reply_text = rich_menu
    # 傳送訊息
    response = reply_to_line(reply_text)
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
  def rich_menu
    message = {
      "size":{
          "width":2500,
          "height":1686
      },
      "selected":false,
      "name":"Controller",
      "chatBarText":"Controller",
      "areas":[
          {
            "bounds":{
                "x":551,
                "y":325,
                "width":321,
                "height":321
            },
            "action":{
                "type":"message",
                "text":"up"
            }
          },
          {
            "bounds":{
                "x":876,
                "y":651,
                "width":321,
                "height":321
            },
            "action":{
                "type":"message",
                "text":"right"
            }
          },
          {
            "bounds":{
                "x":551,
                "y":972,
                "width":321,
                "height":321
            },
            "action":{
                "type":"message",
                "text":"down"
            }
          },
          {
            "bounds":{
                "x":225,
                "y":651,
                "width":321,
                "height":321
            },
            "action":{
                "type":"message",
                "text":"left"
            }
          },
          {
            "bounds":{
                "x":1433,
                "y":657,
                "width":367,
                "height":367
            },
            "action":{
                "type":"message",
                "text":"btn b"
            }
          },
          {
            "bounds":{
                "x":1907,
                "y":657,
                "width":367,
                "height":367
            },
            "action":{
                "type":"message",
                "text":"btn a"
            }
          }
      ]
    }
  end
end
