modeid = 0
-- change this pls
modename = "Stable"
-- leave unchanged, it will change for you
delta = -2
-- important, change this too if needed
price = 0
-- literally the most important bro
ttmc = 6
-- time left until change the mode
function modechanger()
  chance = math.random() * 100
  if ttmc == 0 then
    if chance <0 then
      modeid = 0
      modename = "Stable"
    elseif chance <12.5 then
      modeid = 1
      modename = "Slow Rise"
    elseif chance <37.5 then
      modeid = 2
      modename = "Slow Fall"
    elseif chance <62.5 then
      modeid = 3
      modename = "Fast Rise"
    elseif chance <75 then
      modeid = 4
      modename = "Fast Fall"
    elseif chance <87.5 then
      modeid = 5
      modename = "Chaotic"
    end
  end
  ttmc = math.random(1, 10)
end
function chaoticmodechanger()
  if modeid == 3 or modeid == 4 then
    chance = math.random() * 100
    if chance <= 70 then
      modeid = 5
      modename = "Chaotic"
    else
      modechanger()
    end
  else
    modechanger()
  end
end
function changevalue()
  if modeid == 0 then
    modename = "Stable"
    price1 = price - 0.025
    price2 = price + 0.025
    price = price1 + math.random() * (price2 - price1)
    delta = delta-5
  elseif modeid == 1 then
    modename = "Slow Rise"
    price1 = price - 0.005
    price2 = price + 0.045
    price = price1 + math.random() * (price2 - price1)
    delta = delta -1
  elseif modeid == 2 then
    modename = "Slow Fall"
    price1 = price - 0.045
    price2 = price + 0.005
    price = price1 + math.random() * (price2 - price1)
    delta = delta -1
  elseif modeid == 3 then
    modename = "Fast Rise"
    price1 = price
    price2 = price + 5
    price = price1 + math.random() * (price2 - price1)
    delta1 = delta - 0.015
    delta2 = delta + 0.135
    delta = delta1 + math.random() * (delta2 - delta1)
    chance = math.random() * 100
    if chance >= 30 then
      price1 = price - 3
      price2 = price + 7
      price = price1 + math.random() * (price2 - price1)
      delta1 = delta -0.05
      delta2 = delta + 0.05
      delta = delta1 + math.random() * (delta2 - delta1)
    end
  elseif modeid == 4 then
    modename = "Fast Fall"
    price1 = price - 5
    price2 = price
    price = price1 + math.random() * (price2 - price1)
    delta1 = delta - 0.135
    delta2 = delta + 0.015
    delta = delta1 + math.random() * (delta2 - delta1)
    chance = math.random() * 100
    if chance >= 30 then
      price1 = price - 7
      price2 = price + 3
      price = price1 + math.random() * (price2 - price1)
      delta1 = delta -0.05
      delta2 = delta + 0.05
      delta = delta1 + math.random() * (delta2 - delta1)
    end
  elseif modeid == 5 then
    modename = "Chaotic"
    delta1 = delta - 0.15
    delta2 = delta + 0.15
    delta = delta1 + math.random() * (delta2 - delta1)
    chance = math.random() * 100
    if chance >= 50 then
      price1 = price - 5
      price2 = price + 5
      price = price1 + math.random() * (price2 - price1)
    end
    if chance >= 20 then
      delta1 = delta - 1
      delta2 = delta + 1
      delta = delta1 + math.random() * (delta2 - delta1)
    end
  end
  chance = math.random() * 100
  if chance <= 97 and modeid == 3 then
    modeid = 4
    modename = "Fast Fall" 
  end
  ttmc = ttmc - 1
  price = price + (price * (delta/100))
end
changevalue()
if modeid == 3 or modeid == 4 and ttmc == 0 then
  chaoticmodechanger()
elseif modeid ~= 3 or modeid ~= 4 and ttmc == 0 then
  modechanger()
end
--detect which modechanger to use
price = math.max(0.01, price)
-- make sure price can't go below 0

print("modeid: " .. modeid .. "\nmodename: " .. modename .. "\ndelta: " .. delta .. "\nprice: " .. price.. "\ntime to mode change: "..ttmc)
--print the variables
