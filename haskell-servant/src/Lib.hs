{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeOperators #-}

module Lib where

import Data.Aeson
import GHC.Generics
import  Network.Wai (Application)
import Servant


type FibApi = "fib" :> Capture "name" Int :> Get '[JSON] FibAnswer

data FibAnswer = FibAnswer { query :: Int, answer :: Int }
  deriving (Generic, Show, Eq)

instance ToJSON FibAnswer

fastfibs = 1:1:zipWith (+) fastfibs (tail fastfibs)

fib :: Int -> Handler FibAnswer
fib n = return $ FibAnswer n (head $ drop (n + 1) fastfibs)

fibServer :: Server FibApi
fibServer = fib

fibApi :: Proxy FibApi
fibApi = Proxy

app :: Application
app = serve fibApi fibServer

