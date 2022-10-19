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
    },
    music = love.audio.newSource("assets/music.mp3","static")
}
function love.load()
    main.music:play()
    main.music:setLooping(true)
    --Betöltjük az összes képernyőnek az inicializáló metódusát.
    for i,v in pairs(main.screens) do
        v.table.functions.setup()
    end
    main.setScreen(main.screens.menu)
    main.dimensions.w,main.dimensions.h = love.graphics.getDimensions()
end

function love.update(dt)
    if (type(menuTable.sliders.music) ~= "nil") then
       main.music:setVolume(menuTable.sliders.music.value/100) 
    end
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
    if (screen ~= main.screens.menu or screen ~= nil) then
        main.previousScreen = main.currentScreen
    end
    if (main.currentScreen ~= screen) then
        main.currentScreen = screen
        main.currentScreen.table.functions.setup()
    end
end

function love.keypressed(key)
    if (key == "escape" or key == "appback") then
        main.setScreen(main.previousScreen)
    else
        main.keypressed(key)
    end
end

function main.keypressed(key)
    if (main.currentScreen ~= nil and main.currentScreen.table.functions.key~= nil) then
        main.currentScreen.table.functions.key(key)
    end
end