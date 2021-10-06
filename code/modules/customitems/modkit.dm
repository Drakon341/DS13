//Modkits
/obj/item/mod_kit

	var/list/valid_types
	var/result_path

	var/consumed = FALSE


/obj/item/mod_kit/afterattack(atom/target, mob/user, proximity_flag, click_parameters)
	. = ..()
	if (!consumed && is_valid_target(target))
		apply_to(target, user)



/obj/item/mod_kit/proc/is_valid_target(var/atom/target)
	if (!isturf(target.loc))
		return FALSE

	var/valid_type = FALSE
	for (var/typepath in valid_types)
		if (istype(target, typepath))
			valid_type = TRUE
			break

	if (!valid_type)
		return FALSE

	return TRUE

/obj/item/mod_kit/proc/apply_to(var/atom/target, mob/user)
	if (consumed)
		return
	consumed = TRUE
	var/atom/A = new result_path(target.loc)

	target.pre_modkit_transform(A, src, user)




/*
	Base functionality, event proc
	Called when an item is about to be transformed into a new one with a modkit
*/
/atom/proc/pre_modkit_transform(var/atom/replacement, var/obj/item/mod_kit/transformer, var/mob/user)



/*
	Special gear subtype
*/
/datum/gear/modkit
	slot = GEAR_EQUIP_SPECIAL
	var/item_name
	var/list/valid_types


/datum/gear/modkit/spawn_special(var/mob/living/carbon/human/H,  var/metadata)
	var/obj/item/mod_kit/MK = new (H.loc)
	MK.name = name
	MK.desc =
	MK.result_path = path
	return item