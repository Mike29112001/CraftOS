local size = 10
local currentPosition = { x = 0, y = 0, z = 0, d = 0 }
local homePosition =    { x = 0, y = 0, z = 0, d = 0 }
local savedPosition =    { x = 0, y = 0, z = 0, d = 0 }
local fuelThreshold = 10

-- Dig in a specified direction
function dig(direction)
    local success = false
    direction = string.lower(direction)
    if direction == "forward" or direction == "f" then
        success = turtle.dig()
    elseif direction == "up" or direction == "u" then
        success = turtle.digUp()
    elseif direction == "down" or direction == "d" then
        success = turtle.digDown()
    end
    return success
end

-- Move in a specified direction
function go(direction)
    local success = false
    direction = string.lower(direction)
    if direction == "down" or direction == "d" then
        if turtle.down() then
            currentPosition.y = currentPosition.y - 1
            success = true
        else
            print("I'm stuck!")
        end
    elseif direction == "up" or direction == "u" then
        if turtle.up() then
            currentPosition.y = currentPosition.y + 1
            success = true
        else
            print("I'm stuck!")
        end
    elseif direction == "forward" or direction == "f" then
        if turtle.forward() then
            if currentPosition.d == 0 then currentPosition.z = currentPosition.z + 1 end
            if currentPosition.d == 1 then currentPosition.x = currentPosition.x - 1 end
            if currentPosition.d == 2 then currentPosition.z = currentPosition.z - 1 end
            if currentPosition.d == 3 then currentPosition.x = currentPosition.x + 1 end
            success = true
        else
            print("I'm stuck!")
        end
    elseif direction == "back" or direction == "b" then
        if turtle.back() then
            if currentPosition.d == 0 then currentPosition.z = currentPosition.z - 1 end
            if currentPosition.d == 1 then currentPosition.x = currentPosition.x + 1 end
            if currentPosition.d == 2 then currentPosition.z = currentPosition.z + 1 end
            if currentPosition.d == 3 then currentPosition.x = currentPosition.x - 1 end
            success = true
        else
            print("I'm stuck!")
        end
    end
    return success
end

-- Turn in a specified direction
function turn(direction)
    direction = string.lower(direction)
    if direction == "right" or direction == "r" then
        turtle.turnRight()
        currentPosition.d = (currentPosition.d + 1) % 4
    elseif direction == "left" or direction == "l" then
        turtle.turnLeft()
        currentPosition.d = (currentPosition.d - 1) % 4
    end
end

-- Track inventory
function trackInventory()
    local freeSlots = 0
    for i = 1, 16 do
        if turtle.getItemCount(i) == 0 then
            freeSlots = freeSlots + 1
        end
    end
    if freeSlots == 0 then
        print("Inventory full!")
        return false
    end
    return true
end

-- Check fuel level
function checkFuel()
    if turtle.getFuelLevel() < fuelThreshold then
        print("Low on fuel! Refueling...")
        for i = 1, 16 do
            turtle.select(i)
            if turtle.refuel(0) then
                turtle.refuel()
                if turtle.getFuelLevel() >= fuelThreshold then
                    break
                end
            end
        end
    end
end

-- Track position
function trackPosition()
    term.clear()
    term.setCursorPos(1, 1)
    term.write("Position: (" .. currentPosition.x .. ", " .. currentPosition.y .. ", " .. currentPosition.z .. ")")
    term.setCursorPos(1, 2)
    term.write("Direction: " .. currentPosition.d)
end

-- Main excavation function
function excavate(size)
    checkFuel()
    local notAtBedrock = dig("d") and go("d")
    while notAtBedrock do
        for i = 0, size - 1 do -- column
            for j = 0, size - 1 do -- row
                dig("f")
                go("f")
                trackPosition()
            end
            if i % 2 == 0 then -- Turn right on the even columns
                turn("r")
                dig("f")
                go("f")
                turn("r")
            else -- Turn left on the odd columns
                turn("l")
                dig("f")
                go("f")
                turn("l")
            end
        end
        if size % 2 == 1 then
            turn("r")
            turn("r")
        else
            turn("r")
        end
        notAtBedrock = dig("d") and go("d")
    end
end

-- Example usage
excavate(size)
