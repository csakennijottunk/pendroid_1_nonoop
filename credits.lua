font = love.graphics.newFont("assets/heavy_heap_rg.otf", 20)
x, y = love.graphics.getDimensions()
creditsTable = {
    functions = {
        setup = function ()
            suit = require("Framework.suit")
            background = love.graphics.newImage("assets/background.jpg")
        end,
        update = nil,
        draw = nil,
        load = nil,
    },
    text = {
        credits = {
            text = love.graphics.newText(font, "Credits"),
            x = x / 2,
            y = y / 2 - 100,
        },
        milan = {
            text = love.graphics.newText(font, "Fellner Milán"),
            x = x / 2,
            y = y / 2 - 50,
        },
        bence = {
            text = love.graphics.newText(font, "Németh Csaba Bence"),
            x = x / 2,
            y = y / 2,
        },
        kancsal = {
            text = love.graphics.newText(font, "Kancsal Máté"),
            x = x / 2,
            y = y / 2 + 50,
        },
        zsebok = {
            text = love.graphics.newText(font, "Zsebők Dávid Ferenc"),
            x = x / 2,
            y = y / 2 + 100,
        }
    }
}

function creditsTable.functions.update(dt)

end
for i,v in pairs(creditsTable.text)do
    v.x = v.x - v.text:getWidth() /2
end
function creditsTable.functions.draw()
    love.graphics.draw(background, 0, 0)
    for i,v in pairs(creditsTable.text)do
        love.graphics.draw(v.text, v.x, v.y)
    end
end
