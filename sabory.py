from gpiozero import LEDBoard
from time import sleep

leds = LEDBoard(obiwan=LEDBoard(white=8, blue=25), grievous=LEDBoard(white=18, red=19, blue=12, green=13))

leds.obiwan.white.on()
sleep(1)
leds.obiwan.white.off()
leds.obiwan.blue.on()
sleep(1)
leds.obiwan.blue.off()
leds.obiwan.on()
sleep(1)
leds.obiwan.off()

leds.grievous.white.on()
sleep(1)
leds.grievous.white.off()
leds.grievous.blue.on()
sleep(1)
leds.grievous.blue.off()
leds.grievous.red.on()
sleep(1)
leds.grievous.red.off()
leds.grievous.green.on()
sleep(1)
leds.grievous.green.off()
leds.grievous.off()
