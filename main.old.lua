-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here

local tapCount = 0

local background = display.newImageRect( "pista-de-danca.jpg", 360, 570 )
local tapText = display.newText( tapCount, display.contentCenterX, 20, native.systemFont, 40 )
--tapText:setFillColor( 0, 0, 0 )   

background.x = display.contentCenterX
background.y = display.contentCenterY

local platform = display.newImageRect( "platform.png", 300, 50 )
platform.x = display.contentCenterX
platform.y = display.contentHeight-25

--local balloon = display.newImageRect( "balloon.png", 112, 112 )
-- Alterei aqui o asset para uma bomba
local balloon = display.newImageRect( "bomb_PNG40.png", 112, 112 )
balloon.x = display.contentCenterX
balloon.y = display.contentCenterY
balloon.alpha = 0.8

local physics = require( "physics" )
physics.start()

physics.addBody( platform, "static" )
-- Adicionei o atrito
physics.addBody( balloon, "dynamic", {friction = 10, radius=50, bounce=0.25 } )

local function pushBalloon()
    -- Aplique uma força no x que faz o asset girar
    balloon:applyLinearImpulse( 0, -0.75, balloon.x - 5, balloon.y)
    --balloon:applyAngularImpulse( 100 )
    tapCount = tapCount + 1
    tapText.text = tapCount
end

balloon:addEventListener( "tap", pushBalloon )