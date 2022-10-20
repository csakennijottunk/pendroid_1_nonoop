local sw, sh = love.graphics.getDimensions()
menuTable = {
    functions = {
        setup = function ()
            suit = require("Framework.suit")
        end,
        update = nil,
        draw = nil,
    },
    buttons = {
        {
            name = "Játék",
            y = 0,
            click = function ()
                main.setScreen(main.screens.set)
            end
        },
        {
            name = "Kreditek",
            y = 20,
            click = function ()
                main.setScreen(main.screens.credits)
            end
        },
        {
            name = "Kilépés",
            y = 20,
            click = function ()
                love.event.quit()
            end
        },
    },
    sliders = {
        music = {
            x = sw/2 - 75,
            y = 80,
            w = 150,
            h = 30,
            min = 0,
            max = 100,
            value = 50,
            icon = {
                img = love.graphics.newImage("assets/music.png"),
                w = 0.5,
            }
        },
    },
    bg = {
        img = love.graphics.newImage("assets/setscreenhatter.png")
    }

}
menuTable.sliders.music.x = menuTable.sliders.music.x - menuTable.sliders.music.icon.img:getWidth() * menuTable.sliders.music.icon.w

function menuTable.functions.update(dt)
    local y_index = 0
    for i,v in pairs(menuTable.buttons) do
        if suit.Button(v.name,main.dimensions.w/2 - 100,y_index + main.dimensions.h/2 - (#menuTable.buttons*60)/2,200,60).hit then
            v.click()
        end
        y_index = y_index + 60 + 20
    end
    suit.Slider(menuTable.sliders.music,menuTable.sliders.music.x,menuTable.sliders.music.y,menuTable.sliders.music.w,menuTable.sliders.music.h)
end

function menuTable.functions.draw()
    if (menuTable.bg.img ~= nil) then
        love.graphics.draw(menuTable.bg.img,0,0,0,sw/menuTable.bg.img:getWidth(),(sh/menuTable.bg.img:getHeight()))
        
    end
    suit.draw()
    love.graphics.draw(menuTable.sliders.music.icon.img,menuTable.sliders.music.x + menuTable.sliders.music.w + 25,menuTable.sliders.music.y,0,menuTable.sliders.music.icon.w,menuTable.sliders.music.icon.w)
end