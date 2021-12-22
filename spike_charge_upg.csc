#using scripts\shared\callbacks_shared;
#using scripts\shared\math_shared;
#using scripts\shared\system_shared;
#using scripts\shared\util_shared;

#insert scripts\shared\shared.gsh;

#using scripts\shared\weapons\spike_charge;

#precache("client_fx", "weapon/fx_light_spike_launcher_upg");

REGISTER_SYSTEM("spike_charge_upg", &__init__, undefined)

function __init__(){
	level._effect["spike_light_upg"] = "weapon/fx_light_spike_launcher_upg";

	callback::add_weapon_type("spike_launcher_upgraded", &spawned);
	callback::add_weapon_type("spike_charge_upgraded", &spawned_spike_charge);
}

function spawned( localClientNum )
{
	self thread fx_think( localClientNum );
}

function spawned_spike_charge(localClientNum){
	self thread fx_think( localClientNum );
	self thread sticky_grenade::spike_detonation( localClientNum );
}

function fx_think(localClientNum){
	self notify("light_disable");

	self endon("entityshutdown");
	self endon("light_disable");

	self util::waittill_dobj(localClientNum);
	
	interval = 0.3;

	for(;;){
		self stop_light_fx(localClientNum);
		self start_light_fx(localClientNum);

		util::server_wait(localClientNum, interval, 0.01, "player_switch");

		self util::waittill_dobj(localClientNum);

		interval = math::clamp((interval / 1.2 ), 0.08, 0.3);
	}
}

function start_light_fx(localClientNum){
	player = GetLocalPlayer(localClientNum);

	self.ufx = PlayFxOnTag(localClientNum, level._effect["spike_light_upg"], self, "tag_fx");
}

function stop_light_fx(localClientNum){
	if(isdefined( self.ufx ) && self.ufx != 0 ){
		StopFx( localClientNum, self.ufx );
		self.ufx = undefined;
	}
}