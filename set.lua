font = love.graphics.newFont("assets/heavy_heap_rg.otf", 17.5)
x, y = love.graphics.getDimensions()
setTable = {
    functions = {
        setup = function ()
            suit = require("Framework.suit")
        end,
        update = nil,
        draw = nil,
    },
    buttons = {
        {
            name = "Vissza",
            y = 5,
            x = 5,
            w = 100,
            h = 30,
            click = function ()
                main.setScreen(main.screens.menu)
            end
        },
        {
            name = "Mentés",
            y = y - 75,
            x = x / 2 - 75,
            w = 150,
            h = 50,
            click = function ()
                main.setScreen(main.screens.game)
            end
        },
    },
    tomeg = {
        value = 1,
        min = 0,
        max = 100,
        w = 150,
        h = 15,
        x = (x / 2) - 75,
        y = 125
    },
    rugomerevseg = {
        value = 1,
        min = 0,
        max = 100,
        w = 150,
        h = 15,
        x = (x / 2) - 75,
        y = 200
    },
    csilapitasitenyezo = {
        value = 1,
        min = 0,
        max = 100,
        w = 150,
        h = 15,
        x = (x / 2) - 75,
        y = 275
    },
    text = {
        tomeg = {
            text = love.graphics.newText(font, "Tömeg: "),
            x = x /2 - 75,
            y = 105,
        },
        rugomerevseg = {
            text = love.graphics.newText(font, "Rugómerevség: "),
            x = x /2 - 75,
            y = 180,
        },
        csilapitasitenyezo = {
            text = love.graphics.newText(font, "Csillapítási tényező: "),
            x = x /2 - 75,
            y = 255,
        },
    }
}

function setTable.functions.update(dt)
    local y_index = 0
    for i,v in pairs(setTable.buttons) do
        if suit.Button(v.name,v.x,v.y,v.w,v.h).hit then
            v.click()
        end
    end
    suit.Slider(setTable.tomeg, setTable.tomeg.x,setTable.tomeg.y, setTable.tomeg.w, setTable.tomeg.h)
    suit.Label(tostring(math.floor(setTable.tomeg.value)), 175,120, 200,20)
    suit.Slider(setTable.rugomerevseg, setTable.rugomerevseg.x, setTable.rugomerevseg.y, setTable.rugomerevseg.w, setTable.rugomerevseg.h)
    suit.Label(tostring(math.floor(setTable.rugomerevseg.value)), 175,195, 200,20)
    suit.Slider(setTable.csilapitasitenyezo, setTable.csilapitasitenyezo.x, setTable.csilapitasitenyezo.y, setTable.csilapitasitenyezo.w, setTable.csilapitasitenyezo.h)
    suit.Label(tostring(math.floor(setTable.csilapitasitenyezo.value)), 175,270, 200,20)
end

function setTable.functions.draw()
    for i,v in pairs(setTable.text)do
        love.graphics.draw(v.text, v.x, v.y)
    end
    suit.draw()
end