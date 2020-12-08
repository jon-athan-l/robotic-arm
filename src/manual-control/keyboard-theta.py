import serial
import time

port = serial.Serial('/dev/ttyACM2', 9600, timeout=1)
print("-----------------------------------------------------")
print("Communications online on " + port.name)
print()
print("Enter swivel steps (<400), tilt steps (<90), slide steps (???)")


while True:
    instruction = input(">>>   ")
    # to have a distinct terminating character for the parsing on the firmware to recognize
    instruction = instruction + "!"
    port.write(instruction.encode())
    time.sleep(0.001)
