require("menu")
require("game")
require("credits")
require("set")
main = {
    dimensions = {},
    setScreen = nil,
    currentScreen = nil,
    previousScreen = nil,
    screens = {
        menu = {
            table = menuTable
        },
        game = {
            table = gameTable
        },
        credits = {
            table = creditsTable
        },
        set = {
            table = setTable
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
    if (main.currentScreen ~= screen) then
        main.currentScreen = screen
        
    end
end

function love.keypressed(key)
    main.keypressed(key)
end

function main.keypressed(key)
    if (main.currentScreen ~= nil and main.currentScreen.table.functions.key~= nil) then
        main.currentScreen.table.functions.key(key)
    end
end