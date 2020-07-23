##########################################
# METAR Download-Script
##########################################
# Sintach150 # 20200629 
##########################################
# usage: metar.sh <argument> 
# <argument> equals 4 Letter ICAO Standard of Airportname 
# Salzburg Airport --> LOWS
# San Franzisco Int'l Airport --> KSFO
# Munich Airport --> EDDM
##########################################
# Output directory "raw" for metarfile XXXX.TXT
# Output directory "decoded" for decoded metarfile XXXX.TXT
##########################################
# Sintach150 # 20200710
# file containing an accumulation of 
# raw metar data is located at ./acc
##########################################


#! /bin/bash

# Variable declaration 
# $1 first argument 
ICAO=$1
station="${ICAO}.TXT"

# Download Url declaration
URL_general='https://tgftp.nws.noaa.gov/data/observations/metar/'
URL_station="${URL_general}stations/${station}"
URL_decoded="${URL_general}decoded/${station}"

# Check existance of output folder - in case of absence create it
# raw folder
if [ ! -d "./raw" ]  ; then
    mkdir ./raw
fi

# accumulated folder
if [ ! -d "./acc" ]  ; then
    mkdir ./acc
fi

# decoded folder
if [ ! -d "./decoded" ]  ; then
    mkdir ./decoded
fi

# Outputfile location
station_raw_file="./raw/${station}"
station_acc_file="./acc/${station}"
station_decoded_file="./decoded/${station}"

# creation of outputfiles
touch $station_raw_file
touch $station_decoded_file

# Check existance of station_acc_file - in case of absence create it
if [ ! -f $station_acc_file ] ;then
    touch $station_acc_file
fi

# Download of Data
wget -q -O $station_raw_file $URL_station
wget -q -O $station_decoded_file $URL_decoded

# check if last lines of station_raw_file and station_acc_file are equals
# if not append >> last line of station_raw_file to station_acc_file

last_raw=$(tail -n 1 $station_raw_file)
last_acc=$(tail -n 1 $station_acc_file)

if [ "$(tail -n 1 $station_raw_file)" != "$(tail -n 1 $station_acc_file)" ] ; then
    tail -n 1 $station_raw_file >> $station_acc_file
fi

# output of metar file
tail -n 1 $station_raw_file

echo ++++++

# output of decoded metar file
cat $station_decoded_file

echo ++ ++ ++

# end of script
exit 0
