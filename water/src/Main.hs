module Main where

import Arduino.Nano
import qualified Arduino.Library.LCD as LCD

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
    let inp = digitalRead pin9 
    in
      -- digitalOutput pin6 =: inp
      setupLCD [ bootup ~> mapSMany (const introText)
                   , timerDelta ~> mapSMany statusText
                   ]

statusText :: Expression Arduino.Nano.Word -> [Expression LCD.Command]
statusText delta = concat
    [ LCD.position 1 0
    , LCD.text ":-)"
    ]

introText :: [Expression LCD.Command]
introText = concat
    [ LCD.position 0 0
    , LCD.text "FRP Arduino"
    ]

setupLCD :: [Stream LCD.Command] -> Action ()
setupLCD streams = do
    LCD.output rs d4 d5 d6 d7 enable =: mergeS streams
    where
        rs     = digitalOutput pin3
        d4     = digitalOutput pin5
        d5     = digitalOutput pin6
        d6     = digitalOutput pin7
        d7     = digitalOutput pin8
        enable = digitalOutput pin4
