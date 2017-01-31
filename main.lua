require "player"
function love.load()
  timeLimit = 10 --seconds
  mouseClicks = 0
  time = 0

  players = {Player.new(), Player.new()}
  currentPlayer = 1
  inactivePlayer = 2

  screenW, screenH = love.graphics.getDimensions()
  screenWMid, screenHMid = screenW / 2, screenH / 2
  love.mouse.setVisible(false)

  arraySize = 0

  r = 255
  g = 255
  b = 0
end

function love.update(dt)
  time = time + dt
  if time >= timeLimit then
    timeReset()
  end
  love.graphics.setColor(r, g, b)
  love.graphics.setBackgroundColor(255-r,255-g,255-b)
end

function love.draw()
  love.graphics.setNewFont(250/1080*screenH)
  love.graphics.print("Clicks : "..mouseClicks, screenWMid -700 , screenHMid - 175)
  love.graphics.setNewFont(40/1080*screenH)
  local timeRounded = math.floor(time * 100 + 0.5) / 100
  timeLeft = timeLimit - timeRounded
  love.graphics.print("Time Left : "..timeLeft, 0, 0)
  love.graphics.print("Last Scores : ", screenW - 375, 0)
  for i,s in ipairs(players[currentPlayer].scores) do
    love.graphics.print(s, screenW - 100, i*40)
  end
    love.graphics.print("Your High Score : "..players[currentPlayer].highScore, screenW - 400, screenH - 50)
    love.graphics.print("Opponents High Score : "..players[inactivePlayer].highScore, 10, screenH - 50)
end

function love.mousepressed(x, y, button, isTouch)
  mouseClicks = mouseClicks + 1
  r = love.math.random(255)
  g = love.math.random(255)
  b = love.math.random(255)
end

function love.keypressed(key)
  if key == 'escape' then
    love.event.quit()
  end
  if key == 'r' then
    timeReset()
    players[currentPlayer].highScore = 0
  end
  if key == 'c'then
    cheat()
  end
  if key == 'backspace' then
    timeReset()
    -- players[currentPlayer].score = lastScore
    player = currentPlayer
    currentPlayer = inactivePlayer
    inactivePlayer = player
  end
end

function timeReset()
  lastScore = mouseClicks
  if lastScore >= players[currentPlayer].highScore then
    players[currentPlayer].highScore = lastScore
  end
  if lastScore > 0 then
    table.insert(players[currentPlayer].scores, 1, lastScore)
  end
  time = 0
  mouseClicks = 0
  if table.getn(players[currentPlayer].scores) > 10 then
    table.remove(players[currentPlayer].scores, 11)
  end
end

function cheat()
  mouseClicks = mouseClicks + love.math.random(1,4)
end
