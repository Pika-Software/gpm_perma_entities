# gpm_perma_entities
 A small package for creating persistent entities on the map.

## Example #1
```lua
if SERVER then
    perma.add("little_bomb_function", function()
        local ball = ents.Create("sent_ball")
        ball:SetBallSize( 256 )
        ball:Spawn()
        ball:Activate()

        return ball
    end, true)
end
```

## Example #2
```lua
if SERVER then
    perma.add( "little_bomb_class", "sent_ball", true, Vector( 0, 0, 100 ), Angle( 0, 90, 0 ) )
end
```

## Functions

id `string` | class `string or function` | respawnable `boolean` | pos `vector` | ang `angle or nil`

### Add perma entity spawn point
```lua
perma.add( id, class, respawnable, pos, ang )
```

### Remove perma entity spawn point
```lua
perma.remove( id )
```
