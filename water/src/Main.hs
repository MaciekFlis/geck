module Main where

import Arduino.Nano

main = compileProgram $
    digitalOutput pin13 =: clock ~> toggle