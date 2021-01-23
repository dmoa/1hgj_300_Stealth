la = love.audio
ld = love.data
le = love.event
lfile = love.filesystem
lf = love.font
lg = love.graphics
li = love.image
lj = love.joystick
lk = love.keyboard
lm = love.math
lmouse = love.mouse
lp = love.physics
lsound = love.sound
lsys = love.system
lth = love.thread
lt = love.timer
ltouch = love.touch
lv = love.video
lw = love.window

lg.setDefaultFilter("nearest", "nearest", 1)
lg.setLineStyle('rough')

splash = require "libs/splash"

function love.draw() splash:update() end
splash:startSplashScreen("start_screen.png", "", 1500, 500, 2, {}, function()

push = require "libs/push"
game_width, game_height = 1024, 1024
window_width, window_height = 1024, 1024
lw.setMode(window_width, window_height, {borderless = false})
push:setupScreen(game_width, game_height, window_width, window_height, {fullscreen = false, resizable = true, borderless = false})

input = require "libs/input"

function AABB(x, y, w, h, x2, y2, w2, h2)
    return x + w > x2 and x < x2 + w2 and y + h > y2 and y < y2 + h2
end

screen = require "libs/shack"
screen:setDimensions(push:getDimensions())

player = require "Player"
goal = require "Goal"

require "Enemy"

enemies = {}
for i = 1, 10 do
    table.insert(enemies, newEnemy())
end

timer = 1.5

function love.draw()
    screen:apply()
    push:start()

    player:Draw()
    goal:Draw()
    for i = 1, #enemies do
        enemies[i]:Draw(dt)
    end

    push:finish()
end

function love.update(dt)
    screen:update(dt)

    player:Update(dt)
    goal:Update()
    for i = 1, #enemies do
        enemies[i]:Update(dt)
        if timer < 0 and AABB(player.x, player.y, player.image:getWidth(), player.image:getHeight(), enemies[i].x, enemies[i].y, enemies[i].image:getWidth(), enemies[i].image:getHeight()) then
            love.system.openURL("https://www.youtube.com/watch?v=dQw4w9WgXcQ")
            love.event.quit()
        end
    end
    if AABB(player.x, player.y, player.image:getWidth(), player.image:getHeight(), goal.x, goal.y, goal.image:getWidth(), goal.image:getHeight()) then
        love.system.openURL("https://www.youtube.com/watch?v=-uUZCgDMoxY")
        love.event.quit()
    end

    timer = timer - dt
end

function love.keypressed(key)
    if key == "escape" then le.quit() end
    if key == "return" and lk.isDown("lalt") then push:switchFullscreen() end
end

function love.resize(w, h)
  push:resize(w, h)
  lg.clear()
end

end)