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
    reply_text = simple_msg("RoR")
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
        "height": 843
      },
      "selected": true,
      "name": "圖文選單 1",
      "chatBarText": "查看更多資訊",
      "areas": [
        {
          "bounds": {
            "x": 8,
            "y": 80,
            "width": 539,
            "height": 686
          },
          "action": {
            "type": "postback",
            "text": "查看訂單",
            "data": "action=getOrders"
          }
        },
        {
          "bounds": {
            "x": 652,
            "y": 81,
            "width": 560,
            "height": 682
          },
          "action": {
            "type": "uri",
            "uri": "line://ti/p/@dml3676y"
          }
        },
        {
          "bounds": {
            "x": 1302,
            "y": 76,
            "width": 520,
            "height": 682
          },
          "action": {
            "type": "postback",
            "text": "會員資料",
            "data": "action=getMemberInfo"
          }
        },
        {
          "bounds": {
            "x": 1902,
            "y": 81,
            "width": 556,
            "height": 673
          },
          "action": {
            "type": "postback",
            "text": "商品資訊",
            "data": "action=getProducts"
          }
        }
      ]
    }
  end
end
