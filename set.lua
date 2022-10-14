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
            y = 20,
            click = function ()
                main.setScreen(main.screens.menu)
            end
        },
        {
            name = "Mentés",
            y = 20,
            click = function ()
                main.setScreen(main.screens.game)
            end
        },
    }
}

function setTable.functions.update(dt)
    local y_index = 0
    for i,v in pairs(setTable.buttons) do
        if suit.Button(v.name,2,y_index + 0 + 32 - (#setTable.buttons*60)/2,100,30).hit then
            v.click()
        end
        y_index = y_index + 60 + 20
    end
end

function setTable.functions.draw()
    suit.draw()
end