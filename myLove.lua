

MyLove = {}


function MyLove:load()
    local major, minor, revision, codename = love.getVersion()
    self.str = string.format("Version %d.%d.%d - %s", major, minor, revision, codename)
end

function MyLove:draw()
    local fps = love.timer.getFPS()
    love.graphics.print(self.str, 5, 5)
    love.graphics.print("FPS:" .. tostring(fps), 5, 25)
    love.graphics.print(""..Ball.speed, love.graphics.getWidth() / 2, love.graphics.getHeight() / 2)
end