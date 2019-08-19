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

local char = display.newImageRect("dancer.png", 85, 145)
char.x = display.contentCenterX
char.y = display.contentHeight-30


local physics = require( "physics" )
physics.start()

physics.addBody( platform, "static" )
-- Adicionei o atrito
physics.addBody( char, "dynamic", { radius=50, bounce=0.0 } )

local function jump()
    char:applyLinearImpulse( 0, -0.75, char.x, char.y)
end

char:addEventListener( "tap", jump )