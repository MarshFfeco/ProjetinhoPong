
Player = {}

function Player:load() 
    self.width = 20
    self.height = 100
    self.x = 20 
    self.y = (love.graphics.getHeight() / 2) - (self.height / 2)
    self.speed = 500
end

function Player:update(dt)
    Player:moved(dt)
    CheckBoudries(self)
end

function Player:moved(dt)
    if love.keyboard.isDown("w") then
        self.y = self.y - self.speed * dt
    elseif love.keyboard.isDown("s") then
        self.y = self.y + self.speed * dt
    end
end

function Player:checkBoudries()
    if self.y <= 45  then
        self.y = 45
    elseif self.y + self.height > love.graphics.getHeight() then
        self.y = love.graphics.getHeight() - self.height
    end
end

function Player:drawn()
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end