function love.load()
    love.graphics.setDefaultFilter('nearest', 'nearest')

    smallFont = love.graphics.newFont("assets/fonts/font.ttf", FONT_SIZE)
    love.graphics.setFont(smallFont)

    scoreFont = love.graphics.newFont("assets/fonts/font.ttf", FONT_SIZE * 2)

    push:setupScreen(
        VIRTUAL_WIDTH,
        VIRTUAL_HEIGHT,
        WINDOW_WIDTH, 
        WINDOW_HEIGHT, 
        LOVE_CONFIG)

    player1Score = 0
    player2Score = 0

    player1Y = 30
    player2Y = VIRTUAL_HEIGHT - 50

end 
