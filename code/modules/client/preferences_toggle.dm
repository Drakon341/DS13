var/list/client_preference_stats_

/proc/client_preference_stats_for_usr(var/mob/user = usr)
	. = list()
	if(!user)
		return
	if(!client_preference_stats_)
		client_preference_stats_ = list()
		for(var/datum/client_preference/client_pref in get_client_preferences())
			client_preference_stats_[client_pref.description] = new /stat_client_preference(null, client_pref)

	for(var/client_pref_description in client_preference_stats_)
		var/stat_client_preference/scp = client_preference_stats_[client_pref_description]
		if(scp.client_preference.may_set(user))
			scp.update_name(user)
			.[client_pref_description] = scp

/client/verb/toggle_preference_verb(client_pref_name in client_preference_stats_for_usr())
	set category = "Preferences"
	set name = "Toggle Preference"
	set desc = "Toggles the selected preference."

	var/list/client_stats = client_preference_stats_for_usr()
	var/stat_client_preference/scp = client_stats[client_pref_name]
	if(istype(scp))
		scp.Click()

/client/verb/setup_character()
	set category = "Preferences"
	set name = "Game Preferences"
	set desc = "Allows you to access the Setup Character screen. Changes to your character won't take effect until next round, but other changes will."
	prefs?.ShowChoices(usr)

/stat_client_preference
	parent_type = /atom/movable
	simulated = 0
	var/datum/client_preference/client_preference

/stat_client_preference/New(var/loc, var/preference)
	client_preference = preference
	update_name(usr)
	..()

/stat_client_preference/Destroy()
	client_preference = null
	. = ..()

/stat_client_preference/Click()
	if(!usr.client)
		return

	if(!usr.cycle_preference(client_preference))
		return

	usr.client.prefs.save_preferences()
	to_chat(usr, "[client_preference.description]: [usr.get_preference_value(client_preference)]")

/stat_client_preference/proc/update_name(var/mob/user)
	name = user.get_preference_value(client_preference)
