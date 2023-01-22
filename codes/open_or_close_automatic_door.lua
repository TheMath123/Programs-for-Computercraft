local detector = peripheral.find("playerDetector") -- Finds the peripheral if one is connected
if detector == nil then error("playerDetector not found") end
continue = false
print('Program is running...')
while not continue do
  if detector.isPlayersInRange(2) then
    redstone.setOutput("front", true)
  else
    redstone.setOutput("front", false)
  end
end