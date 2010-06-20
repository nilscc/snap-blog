{-# LANGUAGE OverloadedStrings #-}

module Main () where

import Prelude hiding (head, id)

import Text.Blaze.Html5
import Text.Blaze.Html5.Attributes hiding (title)
import Snap.Types
import Snap.Http.Server
import Snap.Util.FileServe

main = httpServe "*" 8081 "localhost"
                 (Just "access.log")
                 (Just "error.log")
                 mainSnap


mainSnap :: Snap ()
mainSnap =
    route [ ("/style"       , fileServeSingle' "text/css" "htdocs/style.css")
          , ("/"            , testHtml)
          ]

testHtml :: Snap ()
testHtml = do

    modifyResponse $ setContentType "text/html"
    writeLBS . renderHtml . html $ do

        head $ do

            title $ "Hello World!"
            meta ! charset "UTF-8"
            link ! rel "stylesheet" ! href "style" ! type_ "text/css" ! media "screen"

        body $ do

            h1 ! id "moep" $ "Hi!"
            p "Hello world!"
