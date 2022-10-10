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
                main.setScreen(main.screens.game)
            end
        },
        {
            name = "Kreditek",
            y = 20,
            click = function ()
                
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

}

function menuTable.functions.update(dt)
    local y_index = 0
    for i,v in pairs(menuTable.buttons) do
        if suit.Button(v.name,main.dimensions.w/2 - 100,y_index + main.dimensions.h/2 - (#menuTable.buttons*60)/2,200,60).hit then
            v.click()
        end
        y_index = y_index + 60 + 20
    end
end

function menuTable.functions.draw()
    suit.draw()
end