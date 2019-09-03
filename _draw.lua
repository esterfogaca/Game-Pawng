function love.draw()
    push:apply('start')

    love.graphics.clear(0.8, 0.4, 0.4, 1)

    love.graphics.setFont(scoreFont)
    if gameState == 'start' then
        love.graphics.setFont(smallFont)
        love.graphics.printf(
        MESSAGE,
        0,
        VIRTUAL_HEIGHT/2 - FONT_SIZE/2,
        VIRTUAL_WIDTH,
        'center')
    else
        love.graphics.setFont(scoreFont)
        love.graphics.print(tostring(player1Score), VIRTUAL_WIDTH / 2 - 50, 10)
        love.graphics.print(tostring(player2Score), VIRTUAL_WIDTH / 2 + 30, 10)

        ball:render()
    end

    player1:render()
    player2:render()

    --displayFPS()

    push:apply('end')
end

function displayFPS()
    love.graphics.setFont(smallFont)
    love.graphics.setColor(0, 255, 0, 1)
    love.graphics.print('FPS: ' .. tostring(love.timer.getFPS()), 10, 10)
end
