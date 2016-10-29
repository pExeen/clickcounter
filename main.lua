function love.load()
  timeLimit = 10 --seconds
  mouseClicks = 0
  time = 0
  lastScore = 0
  hightScore = 0
  screenW, screenH = love.graphics.getDimensions()
  screenWMid, screenHMid = screenW / 2, screenH / 2
  love.mouse.setVisible(false)
  font = love.graphics.newFont("BPmono.ttf", 250)
  font2 = love.graphics.newFont("BPmono.ttf", 40)
end

function love.update(dt)
  time = time + dt
  if time >= timeLimit then
    timeReset()
  end
end

function love.draw()
  love.graphics.setFont(font)
  love.graphics.print("Clicks : "..mouseClicks, screenWMid -700 , screenHMid - 175)
  love.graphics.setFont(font2)
  love.graphics.print("Time : "..time, 0, 0)
  love.graphics.print("Last Score : "..lastScore, screenW - 375, 0)
  love.graphics.print("Hight Score "..hightScore, screenW - 400, screenH - 50)
end

function love.mousepressed(x, y, left, isTouch)
  mouseClicks = mouseClicks + 1
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
