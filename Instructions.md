## Required

### Installation of these Scripts

Install to this path (either shared or usermaps folder):

```
scripts/zm/weapons/zm_weap_spike_launcher/zm_weap_spike_launcher.gsc
```

### Zone

Put the .zpkg in `share/zone_source` or `usermaps/mapname/zone_source`

In the map's zone file:

```
//Spike Launcher
include,spike_launcher_zm
```

### Sound Zone Config

```c
 {
 "Type" : "ALIAS",
 "Name" : "t7_spike_launcher",
 "Filename" : "t7_spike_launcher.csv",
 "Specs" : [ ] 
},
```

- Spike Launcher Aliases From Campaign
- Source Sound Files From Campaign

### Mapname.gsc

```
//Spike Launcher
#using scripts\zm\weapons\zm_weap_spike_launcher\zm_weap_spike_launcher;
```

### Mapname.csc

```cpp
#using scripts\shared\weapons\spike_charge;
#using scripts\zm\weapons\zm_weap_spike_launcher\spike_charge_upg;

function main()
{
    LuiLoad("ui.uieditor.menus.hud.t7hud_zm_hotel");

    zm_usermap::main();

    include_weapons();
    
    util::waitforclient( 0 );
}
```

### FX

```
weapon/fx_light_spike_launcher.efx
weapon/fx_light_spike_launcher_upg.efx
```

### LUA

In the map's LUA file

```lua
require( "ui.uieditor.widgets.CPSystems.SpikeLauncher.SpikeCounter.SpikeLauncherSpikeCounter" )

local PostLoadFunc = function ( f2_arg0, f2_arg1 )
    CoD.Zombie.CommonPostLoadHud( f2_arg0, f2_arg1 )
    CoD.TacticalModeUtility.CreateShooterSpottedWidgets( f2_arg0, f2_arg1 )
    if Engine.GetModel( Engine.GetModelForController( f2_arg1 ), "currentWeapon.viewmodelWeaponName" ) ~= nil then
        f2_arg0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( f2_arg1 ), "currentWeapon.viewmodelWeaponName" ), function ( modelRef )
            if IsCurrentViewmodelWeaponName( f2_arg1, "spike_launcher" ) then
                f2_arg0.spikeLauncherCounter = CoD.SpikeLauncherSpikeCounter.new( f2_arg0, f2_arg1 )
                f2_arg0:addElement( f2_arg0.spikeLauncherCounter )
                f2_arg0.spikeLauncherCounter:dispatchEventToChildren( {
                    name = "update_state",
                    controller = f2_arg1
                } )
            elseif f2_arg0.spikeLauncherCounter ~= nil then
                f2_arg0.spikeLauncherCounter:close()
                f2_arg0.spikeLauncherCounter = nil
            end
        end )
    end
    local f2_local2 = f2_arg0.close
    f2_arg0.close = function ( f7_arg0 )
        f2_local2( f7_arg0 )
        if f7_arg0.spikeLauncherCounter ~= nil then
            f7_arg0.spikeLauncherCounter:close()
        end
    end
end
```

Make sure that all spike lua/luac files are in the correct directories (see the example `.zpkg`)

### Images

Setup the UIE images in APE under the same name as in the `.zpkg`. Ensure that mipmap is disabled.