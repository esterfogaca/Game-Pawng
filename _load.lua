function love.load()
    love.graphics.setDefaultFilter('nearest', 'nearest')

    love.window.setTitle('Pawng')

    math.randomseed(os.time()) 

    smallFont = love.graphics.newFont("assets/fonts/font.ttf", FONT_SIZE) 
    largeFont = love.graphics.newFont("assets/fonts/font.ttf", FONT_SIZE * 2)
    love.graphics.setFont(smallFont)

    scoreFont = love.graphics.newFont("assets/fonts/font.ttf", FONT_SIZE * 2)

    sounds = {
        ['score'] = love.audio.newSource('assets/sounds/score.wav', 'static'),
        ['hit'] = love.audio.newSource('assets/sounds/hit.wav', 'static'),
        ['goal'] = love.audio.newSource('assets/sounds/goal.wav', 'static')
    }

    push:setupScreen(
        VIRTUAL_WIDTH,
        VIRTUAL_HEIGHT,
        WINDOW_WIDTH, 
        WINDOW_HEIGHT, 
        LOVE_CONFIG)

    player1Score = 0
    player2Score = 0
    servingPlayer = 1

    player1 = Paddle(10, 30, 5, 20)
    player2 = Paddle(VIRTUAL_WIDTH - 10, VIRTUAL_HEIGHT - 30, 5, 20)

    ball = Ball(VIRTUAL_WIDTH / 2 - 2, VIRTUAL_HEIGHT / 2 - 2, 4)

    gameState = 'start'
end 

function love.resize(w, h)
    push:resize(w, h)
end
