-- uhh yeah
mode = 0
modestring = "N/A"
delta = 0
value = 7.27
delta = 0
modechange = 0
frff = 0
function calculate()
  if mode = 0
    modestring = "Stable"
    value1 = value - 0.025
    value2 = value + 0.025
    value = math.random(value1, value2)
    delta = delta-5
    elseif mode = 1
      modestring = "Slow Rise"
      value1 = value - 0.005
      value2 = value + 0.045
      value = math.random(value1, value2)
      delta = delta-1
    elseif mode = 2
      modestring = "Slow Fall"
      value1 = value - 0.045
      value2 = value + 0.005
      value = math.random(value1, value2)
      delta = delta-1
    elseif mode = 3
      modestring = "Fast Rise"
      value1 = value
      value2 = value + 5
      value = math.random(value1, value2)
      delta1 = delta - 0.05
      delta2 = delta + 0.05
      delta = math.random(delta1, delta2)
    elseif mode = 4
      modestring = "Fast Fall"
      value1 = value - 5
      value2 = value
      value = math.random(value1, value2)
      delta1 = delta - 0.05
      delta2 = delta + 0.05
      delta = math.random(delta1, delta2)
    elseif mode = 5
      modestring = "Chaotic"
      chance = math.random(0, 100)
      if chance =< 50
        value1 = value - 5
        value2 = value + 5
        value = math.random(value1, value2)
      delta1 = delta - 0.15
      delta2 = delta + 0.15
      delta = math.random(delta1, delta2)
    end
  end
  modechange = modechange - 1
  value = value + value * (delta / 100)
end
function modechange()
  if mode = 4 or 3
    frff = 1
  end
  if modechange = 0
    chance = math.random(0.0,100.0)
    if chance >=12.5
      mode = 0
    elseif chance <12.5 and >= 37.5 and frff = 0
      mode = 1
    elseif chance <37.5 and >= 62.5 and frff = 0
      mode = 2
    elseif chance <62.5 and >= 75 and frff = 0
      mode = 3
    elseif chance <75 and >= 87.5 and frff = 0
      mode = 4
    elseif chance <87.5 and >= 100 and frff = 0
      mode = 5
    elseif frff = 0
      if chance <= 0 and >= 70
        mode = 5
      elseif chance <70 and >=100
        chance = math.random(0.0,100.0)
        if chance >=12.5
          mode = 0
        elseif chance <12.5 and >= 37.5 and frff = 0
          mode = 1
        elseif chance <37.5 and >= 62.5 and frff = 0
          mode = 2
        elseif chance <62.5 and >= 75 and frff = 0
          mode = 3
        elseif chance <75 and >= 87.5 and frff = 0
          mode = 4
        elseif chance <87.5 and >= 100 and frff = 0
          mode = 5
        end
      end
    end
  end
  if mode = 0
    modestring = "Stable"
  elseif mode = 1
    modestring = "Slow Rise"
  elseif mode = 2
    modestring = "Slow Fall"
  elseif mode = 3
    modestring = "Fast Rise"
  elseif mode = 4
    modestring = "Fast Fall"
  elseif mode = 5
    modestring = "Chaotic"
  end
end
calculate()
modechange()
print(modestring/n..value/n..delta)
