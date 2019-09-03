function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()

    elseif key == 'enter' or key == 'return' then
        if gameState == 'start' then
            gameState = 'play'
        else
            gameState = 'start'

            ball:reset()

        end
    end
end

function love.update(dt)
-- Player 1 controls
    if love.keyboard.isDown(P1_UP) then
        player1.dy = -PADDLE_SPEED
    elseif love.keyboard.isDown(P1_DOWN) then
        player1.dy = PADDLE_SPEED
    else
        player1.dy = 0
    end

    if love.keyboard.isDown(P2_UP) then
        player2.dy = -PADDLE_SPEED
    elseif love.keyboard.isDown(P2_DOWN) then
        player2.dy = PADDLE_SPEED
    else
        player2.dy = 0
    end

    if gameState == 'play' then
       ball:update(dt)
    end

    player1:update(dt)
    player2:update(dt) 
end
