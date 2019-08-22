require "config"
push = require "lib.push"

function love.load()
    love.graphics.setDefaultFilter('nearest', 'nearest')

    smallFont = love.graphics.newFont("assets/fonts/font.ttf", 48)
    love.graphics.setFont(smallFont)

    push:setupScreen(
        VIRTUAL_WIDTH,
        VIRTUAL_HEIGHT,
        WINDOW_WIDTH, 
        WINDOW_HEIGHT, 
        LOVE_CONFIG)
end 

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end
end

function love.draw()
    push:apply('start')

    love.graphics.clear(0.8, 0.4, 0.4, 1)

    love.graphics.printf(
        'Pawng!',
        0,
        VIRTUAL_HEIGHT/2 - FONT_SIZE/2,
        VIRTUAL_WIDTH,
        'center')

    love.graphics.rectangle("fill", 10, 30, 5, 20)
    love.graphics.rectangle("fill", VIRTUAL_WIDTH - 10, VIRTUAL_HEIGHT - 50, 5, 20)
    love.graphics.circle("fill", VIRTUAL_WIDTH / 2, VIRTUAL_HEIGHT / 3 - 60, 3)

    push:apply('end')
end