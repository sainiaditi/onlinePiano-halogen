module Widget.HyperRunner where

import UI.Properties

import UI.Core (AttrValue(Some), MEvent)
import UI.Elements (linearLayout, textView)
import UI.Events (onClick)


foreign import click :: MEvent

getApplyButtonUI state = linearLayout
                            [
                              id_ (state.id_)
                            , height "40"
                            , width "250"
                            , background (state.buttonApplyColor)
                            , margin "0,20,0,0"
                            , gravity "center"
                            , color "#fff000"
                            , onClick (Some click)
                            ]
                            [
                             textView
                             [
                                id_ "7"
                              , height "20"
                              , width "match_parent"
                              , text (state.text)
                              , fontStyle "Source Sans Pro-Regular"
                              , gravity "center"
                             ]
                            ]

getControlPane state = linearLayout
                        [ id_ "8"
                        , height "300"
                        , width "400"
                        , background "#ffffff"
                        , gravity "center"
                        , orientation "vertical"
                        ]
                        [ 
                            getApplyButtonUI { id_ : "resetButton" , text : "RESET" , buttonApplyColor : "#ff0066"}
                          , getApplyButtonUI { id_ : "startButton" , text : "START" , buttonApplyColor : state.buttonApplyColor}
                         ]

-- getHyperCanvasHolder state { id_ : "svgContainer" , height : "300" , width : "300" , cubeState : state },
getHyperCanvasHolder = linearLayout
                        [ id_ "svgContainer"
                        , height "500"
                        , width "800"
                        , margin "20,20,20,20"
                        , background "#FFFFFF"
                        ]
                        [
                        ]