function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end
end

function love.update(dt)
-- Player 1 controls
    if love.keyboard.isDown(P1_UP) then
        if player1Y > 10 then 
            player1Y = player1Y + -PADDLE_SPEED * dt
        end
    elseif love.keyboard.isDown(P1_DOWN) then
        if player1Y < VIRTUAL_HEIGHT - 30 then
            player1Y = player1Y + PADDLE_SPEED * dt
        end
    end

    if love.keyboard.isDown(P2_UP) then
        if player2Y > 10 then
            player2Y = player2Y + -PADDLE_SPEED * dt
        end
    elseif love.keyboard.isDown(P2_DOWN) then
        if player2Y < VIRTUAL_HEIGHT - 30 then
            player2Y = player2Y + PADDLE_SPEED * dt
        end
    end

end