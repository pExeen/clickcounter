function love.load()
  timeLimit = 10 --seconds
  mouseClicks = 0
  time = 0
  lastScore = 0
  hightScore = 0
  screenW, screenH = love.graphics.getDimensions()
  screenWMid, screenHMid = screenW / 2, screenH / 2
  love.mouse.setVisible(false)
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
  love.graphics.setNewFont(250)
  love.graphics.print("Clicks : "..mouseClicks, screenWMid -700 , screenHMid - 175)
  love.graphics.setNewFont(40)
  local timeRounded = math.floor(time * 100 + 0.5) / 100
  love.graphics.print("Time : "..timeRounded, 0, 0)
  love.graphics.print("Last Score : "..lastScore, screenW - 375, 0)
  love.graphics.print("Hight Score : "..hightScore, screenW - 400, screenH - 50)
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
    hightScore = 0
  end
end

function timeReset()
  lastScore = mouseClicks
  if lastScore >= hightScore then
    hightScore = lastScore
  end
  time = 0
  mouseClicks = 0
end
