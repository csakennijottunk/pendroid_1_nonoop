sw,sh = love.graphics.getDimensions()
gameTable = {
    functions = {
        setup = function ()
            suit = require("Framework.suit")
            time = 0
            --#region értékek resetelése
            gameTable.rectangle = {
                w = 50,
                h = 50,
            }
            gameTable.spiral = {
                img = love.graphics.newImage("assets/rugofull.png")
            }
            --#endregion
            --#region rugoertekek
                gameTable.rectangle.w,gameTable.rectangle.h = gameTable.rectangle.w+(setTable.sliders.tomeg.value)/2,gameTable.rectangle.h+(setTable.sliders.tomeg.value)/2
                local rugo = gameTable.spiral
                --@todo RUGÓ WIDTHJE ARÁNYLIK A RUGÓERŐHŐZ
                --alap értékek
                rugo.ow,rugo.oh = rugo.img:getDimensions()
                gameTable.start = 150
                local rugo_w = 50+(setTable.sliders.rugomerevseg.value)/2
                rugo.w,rugo.h = rugo_w/rugo.ow, y/rugo.oh
                rugo.x,rugo.y  = sw/2 - (rugo_w)/2, 0
            --#endregion
        end,
        calcSpring = nil,
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
                main.setScreen(main.screens.set)
            end
        },
    },
    spiral = {
        img = love.graphics.newImage("assets/rugofull.png")
    },
    rectangle = {
        w = 50,
        h = 50,
    },
}
function gameTable.functions.draw()
    if x ~= nil then
        love.graphics.draw(gameTable.spiral.img,gameTable.spiral.x,gameTable.spiral.y,0,gameTable.spiral.w,gameTable.spiral.h)
        love.graphics.rectangle("fill",x,y,gameTable.rectangle.w,gameTable.rectangle.h)
    end
    suit.draw()
    love.graphics.print("A rugó végpontja: ", 2, sh - 20)
    love.graphics.print(tostring(string.format("%.0f",gameTable.spiral.h * gameTable.spiral.oh)), 120, sh - 20)
end

function gameTable.functions.update(dt)
    --RUGÓ HEIGHT FRISSITESE
    gameTable.spiral.h = y/gameTable.spiral.oh
    time = time or 0
    time = time + (1 / 60)
    x,y = sw/2 - gameTable.rectangle.w/2,gameTable.start + getY(time)
    local y_index = 0
    for i,v in pairs(gameTable.buttons) do
        if suit.Button(v.name,v.x,v.y,v.w,v.h).hit then
            v.click()
        end
        y_index = y_index + 60 + 20
    end
end

function getY(t)
    x0 = setTable.sliders.kitereskezdetierteke.value--1 -- A kitérés kezdeti értéke (m)
    v0 = 10 -- Kezdeti sebesség (m/s)


    c = setTable.sliders.csilapitasitenyezo.value --0.82 -- Csillapítási tényező, Damping ratio (konstans érték)
    k = setTable.sliders.rugomerevseg.value --20 -- Rugómerevség (N/m) Stiffness
    m = setTable.sliders.tomeg.value--5  -- Tömeg (N) mass
    f = setTable.sliders.rezgesifrekvencia.value--1  -- Frekvancia (Hz)

    zeta = c / (2 * math.sqrt(k * m)) -- Csillapítási faktor
    -- \zeta < 1(Underdamped),
    -- \zeta = 1(Critically Damped),
    -- \zeta > 1(Overdamped).
    
    sqrt1ms2 = math.sqrt(1 - math.pow(zeta, 2))

    p = sqrt1ms2 * f -- Csillapított sajátfrekvencia (Hz)
    omegak = 2 * math.pi * p;
    local e = 2.71828182845904523536028747135266249775724709369995
    -- https://engcourses-uofa.ca/books/vibrations-and-sound/damped-free-vibrations-of-single-degree-of-freedom-systems/free-vibrations-of-a-damped-spring-mass-system/

    if t < 0 then
        return 0 
     else
        return math.pow(e, -zeta * omegak * t) *(((v0 + zeta * omegak * x0) / (sqrt1ms2 * omegak)) * math.sin(sqrt1ms2 * omegak * t) +x0 * math.cos(sqrt1ms2 * omegak * t))
     end
end