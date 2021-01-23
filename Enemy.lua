function newEnemy()
    local oof = {"sin","cos","fast","slow"}
local Enemy = {
    x = lm.random(200, game_width),
    y = lm.random(0, game_height),
    image = lg.newImage("torch.png"),
    way = oof[math.random(4)],
    tick = 0
}

function Enemy:Draw()
    lg.draw(self.image, self.x, self.y)
end

function Enemy:Update(dt)
    if self.way == "sin" then
        self.y = self.y + math.sin(self.tick) * 150 * dt
    elseif self.way == "cos" then
        self.x = self.x + math.cos(self.tick) * 150 *dt
    elseif self.way == "fast" then
        if self.tick > 0.8 then
            v = 200
        else
            v = -200
        end
        if self.tick > 1.6 then self.tick = 0 end

        self.y = self.y + v * dt
        self.x = self.x + v * dt
    else
        if self.tick > 0.8 then
            v = 50
        else
            v = -50
        end
        if self.tick > 1.6 then self.tick = 0 end

        self.y = self.y + v * dt
        self.x = self.x + v * dt

    end

    self.tick = self.tick + dt
end
return Enemy
end