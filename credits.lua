font = love.graphics.newFont("assets/heavy_heap_rg.otf", 20)
bigfont = love.graphics.newFont("assets/heavy_heap_rg.otf", 40)
x, y = love.graphics.getDimensions()
creditsTable = {
    functions = {
        setup = function ()
            suit = require("Framework.suit")
            background = love.graphics.newImage("assets/setscreenhatter.png")
        end,
        update = nil,
        draw = nil,
        load = nil,
    },
    text = {
        credits = {
            text = love.graphics.newText(bigfont, "Fejlesztők"),
            x = x / 2,
            y = y / 2 - 150,
        },
        milan = {
            text = love.graphics.newText(font, "Fellner Milán - Fejlesztő"),
            x = x / 2,
            y = y / 2 - 50,
        },
        bence = {
            text = love.graphics.newText(font, "Németh Csaba Bence - Fejlesztő"),
            x = x / 2,
            y = y / 2,
        },
        kancsal = {
            text = love.graphics.newText(font, "Kancsal Máté - Grafikus"),
            x = x / 2,
            y = y / 2 + 50,
        },
        zsebok = {
            text = love.graphics.newText(font, "Zsebők Dávid Ferenc - Fejlesztő"),
            x = x / 2,
            y = y / 2 + 100,
        }
    },
    buttons = {
        {
            name = "Vissza",
            y = 20,
            click = function ()
                main.setScreen(main.screens.menu)
            end
        },
    }
}

function creditsTable.functions.update(dt)
    local y_index = 0
    for i,v in pairs(creditsTable.buttons) do
        if suit.Button(v.name,2,y_index + 0 + 32 - (#creditsTable.buttons*60)/2,100,30).hit then
            v.click()
        end
        y_index = y_index + 60 + 20
    end
end

for i,v in pairs(creditsTable.text)do
    v.x = v.x - v.text:getWidth() /2
end
function creditsTable.functions.draw()
    love.graphics.draw(background, 0, 0)
    for i,v in pairs(creditsTable.text)do
        love.graphics.draw(v.text, v.x, v.y)
    end
    suit.draw()
end
