
Enemy = {}

function Enemy:load() 
    self.width = 20
    self.height = 100
    self.x = love.graphics.getWidth() - self.width - 20 
    self.y = (love.graphics.getHeight() / 2) - (self.height / 2)
    self.yVel = 0
    self.speed = 500

    self.timer = 0
    self.rate = 0.5
end

function Enemy:update(dt)
    Enemy:moved(dt)
    CheckBoudries(self)
    self.timer = self.rate + dt
    if self.timer > self.rate then
        self.timer = 0
        Enemy:acquireTarget()
    end
end

function Enemy:moved(dt)
    self.y = self.y + self.yVel * dt
end

function Enemy:acquireTarget()
    if Ball.y < self.y then
        self.yVel = -self.speed
    elseif Ball.y > self.y then
        self.yVel = self.speed
    end
end

function Enemy:checkBoudries()
    if self.y <= 45  then
        self.y = 45
    elseif self.y + self.height > love.graphics.getHeight() then
        self.y = love.graphics.getHeight() - self.height
    end
end

function Enemy:drawn()
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end