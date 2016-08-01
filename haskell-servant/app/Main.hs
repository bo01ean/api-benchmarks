module Main where

import Network.Wai.Handler.Warp (run)
import Lib

main :: IO ()
main = run 8080 app
