local replicatedstorage, userinputservice = cloneref(game:GetService("ReplicatedStorage")), cloneref(game:GetService("UserInputService"))
local modules, functions = {
        character = require(replicatedstorage.Classes.Character);
        charactercontroller = require(replicatedstorage.Controllers.CharacterController)
    }, {} do
    functions.airaccelerate = function(p67, p68, p69, p70)
        local v71 = math.min(p69, 2.5)
        local v72 = v71 - p67.GlobalVelocity:Dot(p68)
        if v72 > 0 then
            local v73 = v71 * 100 * p70
            if v72 >= v73 then
                v72 = v73
            end
            p67.GlobalVelocity = p67.GlobalVelocity + p68 * v72
        end
    end
end
modules.character.AirAccelerate = functions.airaccelerate
