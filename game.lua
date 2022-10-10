gameTable = {
    functions = {
        setup = function ()
            suit = require("Framework.suit")
        end,
        update = nil,
        draw = nil,
    },

}

function gameTable.functions.draw()
    if x ~= nil then
        love.graphics.rectangle("fill",x,y,20,20)
        
    end
end

function gameTable.functions.update(dt)
    time = time or 0
    time = time + 1/60
    x,y = time,getY(time)
end

function getY(t)
    return 4.06*math.exp(-0.5*t)*math.sin(3*t+1.4);
end