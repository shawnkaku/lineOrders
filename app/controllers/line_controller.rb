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
    
    # line.create_rich_menu rich_menu
    puts line.get_rich_menus
    # line.create_rich_menu_image(rich_menu_id, file)
    # line.get_rich_menu_image(rich_menu_id)
    # line.create_rich_menu_image(rich_menu_id, file)
    # puts line.get_rich_menus 
    reply_text = simple_msg("get_rich_menus")
    # reply_text = rich_menu
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
        "size": {
          "width": 2500,
          "height": 1686
        },
        "selected": false,
        "name": "Nice richmenu",
        "chatBarText": "Tap here",
        "areas": [
          {
            "bounds": {
              "x": 0,
              "y": 0,
              "width": 2500,
              "height": 1686
            },
            "action": {
              "type": "postback",
              "data": "action=buy&itemid=123"
            }
          }
       ]
    }
  end
end
