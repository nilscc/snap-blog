{-# LANGUAGE OverloadedStrings #-}

module Main () where

import Prelude hiding (head, id)

import Text.Blaze.Html5
import Text.Blaze.Html5.Attributes hiding (title)
import Snap.Types
import Snap.Http.Server

main = httpServe "*" 8081 "localhost"
                 (Just "access.log")
                 (Just "error.log")
                 mainSnap


mainSnap :: Snap ()
mainSnap = writeLBS . renderHtml . html $ do

    head $ do

        title $ "Moep!"

    body $ do

        h1 ! id "moep" $ "Hi!"
        p "Willkommen bei Snap!"
