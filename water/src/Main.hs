module Main where

import Arduino.Nano

-- digitalOutput pin13 OK
-- digitalOutput pin12 OK
-- digitalOutput pin11 OK
-- digitalOutput pin10 OK
-- digitalOutput pin9 OK
-- digitalOutput pin8 OK
-- digitalOutput pin7 OK
-- digitalOutput pin6 OK
-- digitalOutput pin5 OK
-- digitalOutput pin4 OK
-- digitalOutput pin3 OK
-- digitalOutput pin2 OK
-- digitalOutput pin1 no such pin in lib
main = compileProgram $
    digitalOutput pin13 =: (every 20000) ~> toggle