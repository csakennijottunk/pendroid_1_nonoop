font = love.graphics.newFont("assets/heavy_heap_rg.otf", 17.5)
x, y = love.graphics.getDimensions()
local sw,sh = love.graphics.getDimensions()
setTable = {
    functions = {
        setup = function ()
            suit = require("Framework.suit")
            suit.theme.color.active.bg = {1,0,0}
            suit.theme.color.hovered.bg = suit.theme.color.normal.bg
            setTable.sliders.tomeg.value = 10
            setTable.sliders.rugomerevseg.value = 20
            setTable.sliders.kitereskezdetierteke.value = 70
            setTable.sliders.csilapitasitenyezo.value = 1
            setTable.sliders.rezgesifrekvencia.value = 1
        end,
        update = nil,
        draw = nil,
    },
    page = 1,
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
      
        {
            name = "1",
            y = y - 155,
            x = x / 2 - 55,
            w = 50,
            h = 37.5,
            click = function ()
                setTable.page = 1
            end
        },
        {
            name = "2",
            y = y - 155,
            x = x / 2 + 5,
            w = 50,
            h = 37.5,
            click = function ()
                setTable.page = 2
            end
        },
        {
            name = "Random értékek",
            y = 5,
            x = x - 155,
            w = 150,
            h = 30,
            click = function ()
                for i, v in pairs(setTable.sliders) do
                    if (i ~= "rezgesifrekvencia") then
                        v.value = randomFloat(v.min,v.max)                        
                    else
                        v.value = randomFloat(1,10)
                    end
                end
            end
        },
    },
    sliders = {
        tomeg = {
            value = 10,
            mertekegyseg = "Kg",
            min = 1,
            max = 100,
            w = 140,
            h = 15,
            x = (x / 2) - 75,
            y = 125,
            text = {
                text = love.graphics.newText(font, "Tömeg: "),
            },
            page = 1,
        },
        rugomerevseg = {
            value = 20,
            mertekegyseg = "N/m",
            min = 1,
            max = 100,
            w = 140,
            h = 15,
            x = (x / 2) - 75,
            y = 200,
            text = {
                text = love.graphics.newText(font, "Rugómerevség: "),
            },
            page = 1,
        },
        csilapitasitenyezo = {
            value = 1,
            mertekegyseg = "Ns/m",
            min = 0.1,
            max = 1,
            w = 140,
            h = 15,
            x = (x / 2) - 75,
            y = 275,
            text = {
                text = love.graphics.newText(font, "Csillapítási tényező: "),
            },
            page = 1,
        },
        rezgesifrekvencia = {
            value = 1,
            mertekegyseg = "Hz",
            min = 1,
            max = 100,
            w = 140,
            h = 15,
            x = (x / 2) - 75,
            y = 125,
            text = {
                text = love.graphics.newText(font, "Rezgési frekvencia: "),
            },
            page = 2,
        },
        kitereskezdetierteke = {
            value = 70,
            mertekegyseg = "m",
            min = 1,
            max = 100,
            w = 140,
            h = 15,
            x = (x / 2) - 75,
            y = 200,
            text = {
                text = love.graphics.newText(font, "Kitérés kezdeti értéke: "),
            },
            page = 2,
        },
    },
    bg = {
        img = love.graphics.newImage("assets/setscreenhatter.png")
    }
}

function setTable.functions.update(dt)
    for i,v in pairs(setTable.buttons) do
        if suit.Button(v.name,v.x,v.y,v.w,v.h).hit then
            v.click()
        end
    end
    if (setTable.sliders ~= nil) then
        for i,v in pairs(setTable.sliders) do
            if (v.page == setTable.page) then
                suit.Slider(v,v.x,v.y,v.w,v.h)
                    suit.Label(tostring(string.format("%.2f",v.value)..'\n' .. v.mertekegyseg),v.x+v.w+5,v.y,50,10) 
            end
        end
    end
    
end

function setTable.functions.draw()
    love.graphics.draw(setTable.bg.img,0,0,0,sw/setTable.bg.img:getWidth(),(sh/setTable.bg.img:getHeight()))
    for i,v in pairs(setTable.sliders) do
        if (v.page == setTable.page) then
            love.graphics.draw(v.text.text,v.x,v.y - 20)            
        end
    end
    suit.draw()
end

function randomFloat(lower, greater)
    return lower + math.random()  * (greater - lower);
end