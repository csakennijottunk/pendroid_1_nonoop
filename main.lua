require("menu")
require("game")
main = {
    dimensions = {},
    setScreen = nil,
    currentScreen = nil,
    screens = {
        menu = {
            table = menuTable
        },
        game = {
            table = gameTable
        }
    }
}
function love.load()
    --Betöltjük az összes képernyőnek az inicializáló metódusát.
    for i,v in pairs(main.screens) do
        v.table.functions.setup()
    end
    main.setScreen(main.screens.menu)
    main.dimensions.w,main.dimensions.h = love.graphics.getDimensions()
end

function love.update(dt)
    if (main.currentScreen ~= nil and main.currentScreen.table.functions.update~= nil) then
        main.currentScreen.table.functions.update(dt)       
    end
end

function love.draw()
    if (main.currentScreen ~= nil and main.currentScreen.table.functions.draw~= nil) then
        main.currentScreen.table.functions.draw()
    end
end

function main.setScreen(screen)
    main.currentScreen = screen
end