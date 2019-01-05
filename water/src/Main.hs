module Main where

import Arduino.Nano

main = compileProgram $ do
    digitalOutput pin13 =: clock ~> toggle