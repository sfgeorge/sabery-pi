from gpiozero import LEDBoard
from time import sleep

leds = LEDBoard(obiwan=LEDBoard(white=8, blue=25), grievous=LEDBoard(white=18, red=19, blue=12, green=13))

leds.obiwan.white.on()
sleep(1)
leds.obiwan.blue.on()
sleep(1)
leds.obiwan.on()
sleep(1)
