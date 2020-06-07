import serial
from pymongo import MongoClient
from pprint import pprint
import dns
from time import sleep

client = MongoClient('mongodb+srv://dhrumil:billneedsthis@notunihacks-mpzji.mongodb.net/data?retryWrites=true&w=majority')
pprint(client)
data_database = client.data
rpi_collection = data_database.rpi
serverStatusResult = data_database.command("serverStatus")
pprint(serverStatusResult)


ser = serial.Serial('COM12', baudrate=9600,timeout= 1)
pprint(f"Really used port: {ser.name}")

try:
    try:
        ser.open()  
    except serial.SerialException:
        pprint(f"Couldn't open {ser.name}")
    msg = {}
    while True:
        arduino = ser.readline().rstrip().decode()
        print("Received:" + arduino)
        if "TEMP:" in arduino:
            msg["TEMP"] = arduino[arduino.rindex(":") + 1:]
        if "HUMIDITY:" in arduino:
            msg["HUMIDITY"] = arduino[arduino.rindex(":") + 1:]
        if "RESISTIVITY:" in arduino:
            msg["RESISTIVITY"] = arduino[arduino.rindex(":") + 1:]
        if "TEMP" in msg and "HUMIDITY" in msg and "RESISTIVITY" in msg:
            pprint(rpi_collection.insert_one(msg))
            msg.clear()
except KeyboardInterrupt:
    ser.close()