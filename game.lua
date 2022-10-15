gameTable = {
    functions = {
        setup = function ()
            suit = require("Framework.suit")
            time = 0
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
                main.setScreen(main.screens.set)
            end
        },
    }
}

function gameTable.functions.draw()
    if x ~= nil then
        love.graphics.rectangle("fill",x,y,50,50)
    end
    suit.draw()
end

function gameTable.functions.update(dt)
    time = time or 0
    time = time + (1 / 60)
    local start = 150
    x,y = 180,start + getY(time)
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