#!/bin/bash
channel_access_token="jHrphplolNugLytHNrCNi22ki1xH3rHuqGEU9trjSwQK0T0rVBVUdLfhenjfGbOBiiaMp7rv5TiJPDBdj+nVmZUvvt6qRO7Mr+wtBipZkP1IaR9Z66Bo5+yadhdJQsfF2hLJA0RehYcKJBKv6ZXOEwdB04t89/1O/w1cDnyilFU="
rich_menu_id="richmenu-244642253d279cfef6f403b1cdac03e6"

# Get rich menu list
# curl -v -X GET https://api.line.me/v2/bot/richmenu/list \
# -H 'Authorization: Bearer '$channel_access_token

#Set default rich menu 
curl -v -X POST "https://api.line.me/v2/bot/user/all/richmenu/"$rich_menu_id \
-H "Authorization: Bearer "$channel_access_token

# Upload rich menu image
# curl -v -X POST "https://api.line.me/v2/bot/richmenu/"$rich_menu_id"/content" \
# -H "Authorization: Bearer "$channel_access_token \
# -H "Content-Type: image/jpeg" \
# -T 2500.jpg

# Create rich menu
# curl -v -X POST https://api.line.me/v2/bot/richmenu \
# -H 'Authorization: Bearer '$channel_access_token \
# -H 'Content-Type: application/json' \
# -d \
# '{
#     "size": {
#       "width": 2500,
#       "height": 1686
#     },
#     "selected": false,
#     "name": "Nice richmenu",
#     "chatBarText": "Tap here",
#     "areas": [
#       {
#         "bounds": {
#           "x": 0,
#           "y": 0,
#           "width": 2500,
#           "height": 1686
#         },
#         "action": {
#           "type": "postback",
#           "data": "action=buy&itemid=123"
#         }
#       }
#    ]
# }'