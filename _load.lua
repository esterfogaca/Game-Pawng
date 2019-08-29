function love.load()
    love.graphics.setDefaultFilter('nearest', 'nearest')

    math.randomseed(os.time()) 

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

    ballX = VIRTUAL_WIDTH / 2 - 2
    ballY = VIRTUAL_HEIGHT / 2 - 2

    ballDX = math.random(2) == 1 and 100 or - 100
    ballDY = math.random(-50, 50) * 1.5

    gameState = 'play'
end 
