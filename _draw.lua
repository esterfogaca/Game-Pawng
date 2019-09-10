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
    
    elseif gameState == 'serve' then
        love.graphics.setFont(smallFont)
        love.graphics.printf('Player' .. tostring(servingPlayer) .. " 's serve'! ", 
        0, 10, VIRTUAL_WIDTH, 'center')
        love.graphics.printf('Press Enter to serve', 0, 20, VIRTUAL_WIDTH, 'center')
    
    elseif gameState == 'play' then
        love.graphics.setFont(scoreFont)
        love.graphics.print(tostring(player1Score), VIRTUAL_WIDTH / 2 - 50, 10)
        love.graphics.print(tostring(player2Score), VIRTUAL_WIDTH / 2 + 30, 10)

        ball:render()
    elseif gameState == 'done' then
        love.graphics.setFont(largeFont)
        love.graphics.printf('Player' .. tostring(winningPlayer) .. 'wins!', 0, 10, 
        VIRTUAL_WIDTH, 'center')
        love.graphics.setFont(smallFont)
        love.graphics.printf('Press Enter to restart!', 0, 30, VIRTUAL_WIDTH, 'center' )
    end

    --displayScore()

    player1:render()
    player2:render()

    --displayFPS()

    push:finish()
end

function displayScore()
    love.graphics.setFont(scoreFont)
    love.graphics.print(tostring(player1Score), VIRTUAL_WIDTH / 2 - 50, 
    VIRTUAL_HEIGHT / 3)
    love.graphics.print(tostring(player2Score), VIRTUAL_WIDTH / 2 + 30,
    VIRTUAL_HEIGHT / 3)
end

function displayFPS()
    love.graphics.setFont(smallFont)
    love.graphics.setColor(0, 255, 0, 1)
    love.graphics.print('FPS: ' .. tostring(love.timer.getFPS()), 10, 10)
end
