#!/bin/bash
channel_access_token="jHrphplolNugLytHNrCNi22ki1xH3rHuqGEU9trjSwQK0T0rVBVUdLfhenjfGbOBiiaMp7rv5TiJPDBdj+nVmZUvvt6qRO7Mr+wtBipZkP1IaR9Z66Bo5+yadhdJQsfF2hLJA0RehYcKJBKv6ZXOEwdB04t89/1O/w1cDnyilFU="
# echo $channel_access_token
# echo 'AAAA.'$channel_access_token
curl -v -X GET https://api.line.me/v2/bot/richmenu/list \
-H 'Authorization: Bearer '$channel_access_token

# curl -v -X POST https://api.line.me/v2/bot/richmenu \
# -H 'Authorization: Bearer {channel_access_token}' \
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