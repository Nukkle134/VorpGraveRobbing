local gntw = {
    inventario_API = {
        API = exports.vorp_inventory:vorp_inventoryApi()
    }
}
local Loot = {
    {item = 'oldbuckle', amountToGive = math.random(4, 8)},
    {item = 'oldwatch', amountToGive = math.random(1, 5)},
    {item = 'rubyring', amountToGive = math.random(1, 2)},
    {item = 'goldtooth', amountToGive = math.random(4, 8)},
    {item = 'peacockfeather', amountToGive = math.random(1, 1)}
}

local LootRare = {
    {item = 'oldbuckle', amountToGive = math.random(2, 4)},
    {item = 'oldwatch', amountToGive = math.random(1, 3)},
    {item = 'rubyring', amountToGive = math.random(1, 3)},
    {item = 'goldtooth', amountToGive = math.random(1, 2)},
    {item = 'peacockfeather', amountToGive = math.random(1, 1)},
    {item = 'piratecoin', amountToGive = math.random(1, 1)}
}

RegisterServerEvent('FF_MinerJob:sdfjds8ufhh')
AddEventHandler(
    'FF_MinerJob:sdfjds8ufhh',
    function(HR)
        local _source = source
        local FinalLoot,LabelLoot = LootToGive(_source, HR)
        TriggerEvent(
            'vorp:getCharacter',
            _source,
            function(user)
                if HR then
                    for k, v in pairs(LootRare) do
                        if v.item == FinalLoot then
                            gntw.inventario_API.API.addItem(_source, FinalLoot, v.amountToGive)
                            LootsToGiveR = {}
                            break
                        end
                    end
                    ---    TriggerClientEvent("redemrp_notification:start", _source, "You got "..FinalLoot, 4)
                    TriggerClientEvent('Notify', _source, 'sucesso', 'Conseguiu x1 <b>' .. LabelLoot,5000)
                else
                    for k, v in pairs(Loot) do
                        if v.item == FinalLoot then
                            gntw.inventario_API.API.addItem(_source, FinalLoot, v.amountToGive)
                            LootsToGive = {}
                            break
                        end
                    end
                    TriggerClientEvent('Notify', _source, 'sucesso', 'Conseguiu x1 <b>' .. LabelLoot,5000)
                end
                TriggerEvent('vorp:addXp', _source, 10) -- some exp here if you want, fuck knows
            end
        )
    end
)

function LootToGive(source, HasRares) -- kek
    local LootsToGive = {}
    local LootsToGiveR = {}
    if HasRares then
        for k, v in pairs(LootRare) do
            table.insert(LootsToGiveR, v.item)
        end
    else
        for k, v in pairs(Loot) do
            table.insert(LootsToGive, v.item)
        end
    end

    if LootsToGive[1] ~= nil then
        local value = math.random(1, #LootsToGive)
        local picked = LootsToGive[value]
        return picked
    elseif LootsToGiveR[1] ~= nil then
        local value = math.random(1, #LootsToGiveR)
        local picked = LootsToGiveR[value]
        local itemLabel = nil 
        
        if picked == "oldbuckle" then itemLabel = "Fivela Velha" 
        elseif picked == "oldwatch" then itemLabel = "Relógio Velho"
        elseif picked == "peacockfeather" then itemLabel = "Moeda Pirata"
        elseif picked == "rubyring" then itemLabel = "Anel de Rúbi"
        elseif picked == "goldtooth" then itemLabel = "Dente de Ouro"
        elseif picked == "piratecoin" then itemLabel = "Moeda Pirata"
        end
        return picked, itemLabel
    end
end
