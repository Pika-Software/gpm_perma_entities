if CLIENT then
    return
end

local vector_origin = vector_origin
local angle_zero = angle_zero

local timer_Simple = timer.Simple
local table_insert = table.insert
local ents_Create = ents.Create
local hook_Add = hook.Add
local assert = assert
local pairs = pairs
local type = type

module( "perma" )

local function createEntity( class, pos, ang )
    if type( class ) == "function" then
        return class( pos, ang )
    elseif type( class ) == "string" then
        local ent = ents_Create( class )
        ent:SetPos( pos )
        ent:SetAngles( ang )
        ent:Spawn()

        return ent
    end
end

local spawnList = {}
function spawn( class, respawnable, pos, ang )
    local ent = createEntity( class, pos, ang )
    if (ent == nil) then
        return
    end

    if (respawnable == true) then
        ent:CallOnRemove( "perma.module", function( ent )
            spawn( class, respawnable, pos, ang )
        end)
    elseif type( respawnable ) == "number" then
        ent:CallOnRemove( "perma.module", function( ent )
            timer_Simple(respawnable, function()
                spawn( class, respawnable, pos, ang )
            end)
        end)
    end

    return ent
end

function add( id, class, respawnable, pos, ang )
    spawnList[ id ] = { class, respawnable, pos or vector_origin, ang or angle_zero }
end

function remove( id )
    spawnList[ id ] = nil
end

function getList()
    return spawnList
end

function respawnAll()
    for id, data in pairs( spawnList ) do
        spawn( data[1], data[2], data[3], data[4] )
    end
end

hook_Add("InitPostEntity", "perma.module", respawnAll)
hook_Add("PostCleanupMap", "perma.module", respawnAll)