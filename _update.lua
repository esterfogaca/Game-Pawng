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

        if ball:collides(player1) then
            ball.dx = -ball.dx * 1.03
            ball.x = player1.x + 5
            
            if ball.dy < 0 then
                ball.dy = -math.random(10, 150)
            else
                ball.dy = math.random(10, 150)
            end
        end

        if ball:collides(player2) then
            ball.dx = -ball.dx * 1.03
            ball.x = player2.x - 4
            if ball.dy < 0 then
                ball.dy = -math.random(10, 150)
            else
                ball.dy = math.random(10, 150)
            end
        end

        if ball.y <= 0 then
            ball.y = 0
            ball.dy = -ball.dy
        end

        if ball.y >= VIRTUAL_HEIGHT - ball.size then
            ball.y = VIRTUAL_HEIGHT - ball.size
            ball.dy = -ball.dy
        end

        if ball.x < 0 then
            servingPlayer = 1
            player2Score = player2Score + 1
            ball:reset()
            gameState = 'serve'
        end

        if ball.x > VIRTUAL_WIDTH then
            servingPlayer = 2
            player1Score = player1Score + 1
            ball:reset()
            gameState = 'serve'
        end

       ball:update(dt)
    end

    player1:update(dt)
    player2:update(dt) 
end
