local Player = {
    x = 50,
    y = 50,
    v = 200,
    image = lg.newImage("ninja.jpeg")
}

function Player:Draw()
    lg.draw(self.image, self.x, self.y)
end

function Player:Update(dt)
    local xv = 0
    local yv = 0

    if not (input.right() and input.left()) then
        if input.right() then
            xv = self.v
        end
        if input.left() then
            xv = -self.v
        end
    end
    if not (input.down() and input.up()) then
        if input.down() then
            yv = self.v
        end
        if input.up() then
            yv = -self.v
        end
    end

    self.x = self.x + xv * dt
    self.y = self.y + yv * dt
end

return Player