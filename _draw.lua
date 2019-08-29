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
        
        love.graphics.circle("fill", ballX, ballY, 4)
    end

    love.graphics.rectangle("fill", 10, player1Y, 5, 20)
    love.graphics.rectangle("fill", VIRTUAL_WIDTH - 10, player2Y, 5, 20)

    push:apply('end')
end
