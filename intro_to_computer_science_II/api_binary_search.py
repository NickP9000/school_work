import requests

"""
Python 3.7.9 (bundled)
>>> %Run api_example.py
{'ID': '65277516-bb18-4091-8ec6-9994293dc02e', 'Country': 'United States of America', 'CountryCode': 'US', 'Province': 'Iowa', 'City': '', 'CityCode': '', 'Lat': '42.01', 'Lon': '-93.21', 'Confirmed': 494407, 'Deaths': 7069, 'Recovered': 0, 'Active': 487338, 'Date': '2021-11-08T00:00:00Z'}
>>> print(covid_binary_search(data, "Kansas"))
{'ID': '5c21206b-29a9-477f-866d-634e61990fd4', 'Country': 'United States of America', 'CountryCode': 'US', 'Province': 'Kansas', 'City': '', 'CityCode': '', 'Lat': '38.53', 'Lon': '-96.73', 'Confirmed': 441137, 'Deaths': 6498, 'Recovered': 0, 'Active': 434639, 'Date': '2021-11-08T00:00:00Z'}
>>> print(covid_binary_search(data, "Nebraska"))
{'ID': 'a82e35a1-df78-4460-9a2d-5d98a2fc494d', 'Country': 'United States of America', 'CountryCode': 'US', 'Province': 'Nebraska', 'City': '', 'CityCode': '', 'Lat': '41.13', 'Lon': '-98.27', 'Confirmed': 289282, 'Deaths': 3001, 'Recovered': 0, 'Active': 286281, 'Date': '2021-11-08T00:00:00Z'}
>>>
"""

response = requests.get("https://api.covid19api.com/live/country/united-states/status/confirmed/date/2021-11-07")

data = response.json()
data.sort(key = lambda record: record["Province"])

def covid_binary_search(d_list, state):
    first = 0
    last = len(d_list)-1
    found = False
    case = dict()
    
    while first <= last and not found:
        midpoint = (first + last)//2
        #print(d_list[midpoint])
        if d_list[midpoint]["Province"] == state:
            case = d_list[midpoint]
            found = True
        else:
            if state < d_list[midpoint]["Province"]:
                last = midpoint-1
            else:
                first = midpoint+1
    
    return case
            
