# gpm_perma_entities
 A small package for creating persistent entities on the map.

## Example
```lua
if SERVER then

    perma.add("little_bomb_function", function()
        local ball = ents.Create("sent_ball")
        ball:SetBallSize( 256 )
        ball:Spawn()
        ball:Activate()

        return ball
    end, true)

    perma.add( "little_bomb_class", "sent_ball", true, Vector( 0, 0, 100 ), Angle( 0, 90, 0 ) )

end
```

## Functions

```lua
perma.add( id, class, respawnable, pos, ang ) -- Add perma entity spawn point
```

id `string` | class `string or function` | pos `vector` | ang `angle or nil`

```lua
perma.remove( id ) -- Remove perma entity spawn point
```
