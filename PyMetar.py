
from pathlib import Path
import urllib.request

# Path declaration
cwd_path = Path('.')
data_path = cwd_path/'data'/'stations'

# Station
ICAO = input('Enter 4 letter ICAO-Code : ')
station = ICAO.upper() + '.TXT'

# Download Url declaration
URL_general='https://tgftp.nws.noaa.gov/data/observations/metar/'
URL_station= URL_general+'stations/'+station
URL_decoded= URL_general+'decoded/'+station

# Download and save file
urllib.request.urlretrieve(URL_station, data_path/station)

# Print file
report = open(data_path/station, 'r')
for line in report:
    print(report.readline())
report.close()

