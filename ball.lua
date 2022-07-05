Ball = {}

function Ball:load() 
    self.x = love.graphics.getWidth() / 2 
    self.y = love.graphics.getHeight() / 2
    self.width = 20
    self.height = 20
    self.speed = 300
    self.xVel = -self.speed
    self.yVel = 0
end

function Ball:update(dt)
    Ball:moved(dt)
    Ball:colision()
end

function Ball:moved(dt)
    self.x = self.x + self.xVel * dt
    self.y = self.y + self.yVel * dt
end

function Ball:colision()
    if CheckColission(self, Player) then
        self.speed = self.speed + 50
        self.xVel = self.speed
        local middleBall = self.y + self.height / 2
        local middlePlayer = Player.y + Player.height / 2
        local collisionPosition =  middleBall - middlePlayer
        self.yVel = collisionPosition * 5
    end

    if CheckColission(self, Enemy) then
        self.speed = self.speed + 50
        self.xVel = -self.speed
        local middleBall = self.y + self.height / 2
        local middleEnemy = Enemy.y + Enemy.height / 2
        local collisionPosition =  middleBall - middleEnemy
        self.yVel = collisionPosition * 5
    end

    if self.y <= 45  then
        self.y = 45
        self.yVel = -self.yVel
    elseif self.y + self.height > love.graphics.getHeight() then
        self.y = love.graphics.getHeight() - self.height
        self.yVel = -self.yVel
    end

    if self.x + self.width < 0 then
        self.x = love.graphics.getWidth() / 2
        self.y = love.graphics.getHeight() / 2
        self.speed = 300
    elseif self.x + self.width > love.graphics.getWidth() then
        self.x = love.graphics.getWidth() / 2
        self.y = love.graphics.getHeight() / 2
        self.speed = 300
    end
end

function Ball:drawn()
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end