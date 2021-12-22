## Required

### Installation of these Scripts

Install to this path (either shared or usermaps folder):

```
scripts/zm/weapons/zm_weap_spike_launcher/zm_weap_spike_launcher.gsc
```

### Zone

```
//Spike Launcher
weapon,spike_launcher_zm
weapon,spike_charge_zm
scriptparsetree,scripts/zm/weapons/zm_weap_spike_launcher/zm_weap_spike_launcher.gsc
scriptparsetree,scripts/zm/weapons/zm_weap_spike_launcher/spike_charge_upg.csc
weapon,spike_launcher_upgraded_zm
weapon,spike_charge_upgraded_zm
fx,weapon/fx_light_spike_launcher
fx,weapon/fx_light_spike_launcher_upg
```

### Sound Zone Config

```
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

```
#using scripts\shared\weapons\spike_charge;
#using scripts\zm\weapons\zm_weap_spike_launcher\spike_charge_upg;
```

### FX

```
weapon/fx_light_spike_launcher.efx
weapon/fx_light_spike_launcher_upg.efx
```