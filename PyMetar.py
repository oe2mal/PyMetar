
from pathlib import Path
import urllib.request

# Path declaration
cwd_path = Path('.')
data_path = cwd_path/'data'
stations_path = data_path/'stations'

# Check if declared path exist, else create it 
Path(data_path).mkdir(parents=True, exist_ok=True)
Path(stations_path).mkdir(parents=True, exist_ok=True)

# Station
ICAO = input('Enter 4 letter ICAO-Code : ')
station = ICAO.upper() + '.TXT'

# Download Url declaration
URL_general='https://tgftp.nws.noaa.gov/data/observations/metar/'
URL_station= URL_general+'stations/'+station

# not now... maybe for later use?
# URL_decoded= URL_general+'decoded/'+station

# Download and save file
urllib.request.urlretrieve(URL_station, stations_path/station)

# Print file
report = open(stations_path/station, 'r')
for line in report:
    print(line)
report.close()
