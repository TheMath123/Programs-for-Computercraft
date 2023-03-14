sleep(30)

local reactor = peripheral.find("fissionReactorLogicAdapter");

-- Enable or disable reactor - true = ON | false = OFF
function enableReactor (state)
  coolant = reactor.getCoolant()
  currentCoolantAmount = coolant['amount']
  minAmountCoolantStart = reactor.getCoolantCapacity() * 0.2

  fuel = reactor.getFuel()
  currentFuelAmount = fuel['amount']
  minAmountFuelStart = reactor.getFuelCapacity() * 0.2

  currentStateReactor = reactor.getStatus()

  if state and currentCoolantAmount >= minAmountCoolantStart and currentFuelAmount >= minAmountFuelStart then
    if not currentStateReactor then
      redstone.setOutput("back", true)
      print('Enable reactor')
    end
  else
    if currentStateReactor then
    redstone.setOutput("back", false) 
    print('Disable reactor')
    end
  end
end

-- Enable or disable cyrene meld alert
function meltAlert (state)
  redstone.setOutput("left", state)
end

enableReactor(false) -- Reactor OFF

-- Reactor monitoring
while true do
  currentStateReactor = reactor.getStatus()
  currentPercentageFuel = math.floor((reactor.getFuel()['amount'] * 100) / reactor.getFuelCapacity())
  currentPercentageCoolant = math.floor(( reactor.getCoolant()['amount'] * 100 ) / reactor.getCoolantCapacity())
  currentTemp =  math.floor(reactor.getTemperature())
  currentPercentDamage = reactor.getDamagePercent()
  
  -- Display Status
  if currentStateReactor then
    stateReactorStr = 'ON'
  else
    stateReactorStr = 'OFF'
  end
  print('----------------------');
  print('State:', stateReactorStr)
  print('Fuel:', currentPercentageFuel,'%')
  print('Coolant:', currentPercentageCoolant,'%')
  print('Temp:',currentTemp,'K')

  -- Control reactor
  if(currentTemp < 580) then
    enableReactor(true) -- alterar para true
  end

  if(currentTemp >= 800) then
    enableReactor(false)
  end
  
  -- Melt Alert
  if currentTemp >= 1200 or currentPercentDamage >= 30 then
    meltAlert(true)
  else
    meltAlert(false)
  end
  sleep(1)
end

