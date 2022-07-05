require("player");
require("myLove");
require("enemy");
require("ball");

function love.load()
    MyLove:load()
    Player:load()
    Enemy:load()
    Ball:load()
end

function love.update(dt)
    Player:update(dt)
    Enemy:update(dt)
    Ball:update(dt)
end

function love.draw()
    MyLove:draw()
    Player:drawn()
    Enemy:drawn()
    Ball:drawn()
end

function CheckColission(a, b)
    if a.x + a.width > b.x and a.x < b.x + b.width and a.y + a.height > b.y and a.y < b.y + b.height then 
        return true
    else 
        return false
    end
end

function CheckBoudries(any)
    if any.y <= 45  then
        any.y = 45
    elseif any.y + any.height > love.graphics.getHeight() then
        any.y = love.graphics.getHeight() - any.height
    end
end