local Goal = {
    x = game_width - 200,
    y = 500,
    image = lg.newImage("goal.jpg")
}

function Goal:Draw()
    lg.draw(self.image, self.x, self.y)
end

function Goal:Update(dt)
end

return Goal