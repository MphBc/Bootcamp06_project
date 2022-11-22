import requests
import time
import pandas as pd

headers = {
	    "X-RapidAPI-Key": "request key from web",
	    "X-RapidAPI-Host": "free-nba.p.rapidapi.com"
      }
first_name = []
last_name = []
position = []
weight_pounds = []
team_city = []
team_conference = []
team_full_name = []


for i in range(1,16):
    url = f"https://free-nba.p.rapidapi.com/players/{i}"
    response = requests.request("GET", url, headers=headers)
    reps = requests.get(url)
    result = response.json()
    first_name.append(result['first_name'])
    last_name.append(result['last_name'])
    position.append(result['position'])
    weight_pounds.append(result['weight_pounds'])
    team_city.append(result['team']['city'])
    team_conference.append(result['team']['conference'])
    team_full_name.append(result['team']['full_name'])
    time.sleep(1)

df = pd.DataFrame({
    "first_name": first_name,
    "last_name": last_name,
    "position": position,
    "weight_pounds": weight_pounds,
    "city": team_city,
    "conference": team_conference,
    "team": team_full_name,
}) 

df
