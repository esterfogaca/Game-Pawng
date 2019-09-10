function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()

    elseif key == 'enter' or key == 'return' then
        if gameState == 'start' then
            gameState = 'serve'
        elseif gameState == 'serve' then
            gameState = 'play'
        elseif gameState == 'done' then
            gameState = 'serve'

            ball:reset()

            player1Score = 0
            player2Score = 0

            if winningPlayer== 1 then
                servingPlayer = 2
            else
                servingPlayer = 1
            end
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

    if gameState == 'serve' then
        ball.dy = math.random( -50, 50)
        if servingPlayer == 1 then
            ball.dx = math.random(140, 200)
        else
            ball.dx = -math.random(140, 200)
        end

    elseif gameState == 'play' then

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
            if player2Score == 10 then
                winningPlayer = 2
                gameState = 'done'
            else
                gameState = 'serve'
                ball:reset()
            end
        end

        if ball.x > VIRTUAL_WIDTH then
            servingPlayer = 2
            player1Score = player1Score + 1
            if player1Score == 10 then
                winningPlayer = 1
                gameState = 'done'
            else
                gameState = 'serve'
                ball:reset()
            end
        end

       ball:update(dt)
    end

    player1:update(dt)
    player2:update(dt) 
end
