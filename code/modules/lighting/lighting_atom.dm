/atom
	var/light_max_bright = 1  // intensity of the light within the full brightness range. Value between 0 and 1
	var/light_inner_range = 1 // range, in tiles, the light is at full brightness
	var/light_outer_range = 0 // range, in tiles, where the light becomes darkness
	var/light_falloff_curve = 2 // adjusts curve for falloff gradient. Must be greater than 0.
	var/light_color		// Hexadecimal RGB string representing the colour of the light

	var/datum/light_source/light
	var/list/light_sources

// Nonsensical value for l_color default, so we can detect if it gets set to null.

#define DEFAULT_FALLOFF_CURVE (2)
/atom/proc/set_light(l_max_bright, l_inner_range, l_outer_range, l_falloff_curve = NONSENSICAL_VALUE, l_color = NONSENSICAL_VALUE)
	. = 0 //make it less costly if nothing's changed

	if(l_max_bright != null && l_max_bright != light_max_bright)
		light_max_bright = l_max_bright
		. = 1
	if(l_outer_range != null && l_outer_range != light_outer_range)
		light_outer_range = l_outer_range
		. = 1
	if(l_inner_range != null && l_inner_range != light_inner_range)
		if(light_inner_range >= light_outer_range)
			light_inner_range = light_outer_range / 4
		else
			light_inner_range = l_inner_range
		. = 1
	if(l_falloff_curve != NONSENSICAL_VALUE)
		if(!l_falloff_curve || l_falloff_curve <= 0)
			light_falloff_curve = DEFAULT_FALLOFF_CURVE
		if(l_falloff_curve != light_falloff_curve)
			light_falloff_curve = l_falloff_curve
			. = 1
	if(l_color != NONSENSICAL_VALUE && l_color != light_color)
		light_color = l_color
		. = 1

	if(.) update_light()

/atom/proc/remove_light()
	light_max_bright = 0
	for (var/datum/light_source/LS in light_sources)
		LS.destroy()
	light_sources = list()
	if (light)
		light.destroy()
		light = null


#undef DEFAULT_FALLOFF_CURVE

/atom/proc/update_light()
	set waitfor = FALSE

	if(!light_max_bright || !light_outer_range || light_max_bright > 1)
		if(light)
			light.destroy()
			light = null
		if(light_max_bright > 1)
			light_max_bright = 1
			CRASH("Attempted to call update_light() on atom [src] \ref[src] with a light_max_bright value greater than one")
	else
		if(!istype(loc, /atom/movable))
			. = src
		else
			. = loc

		if(light)
			light.update(.)
		else
			light = new /datum/light_source(src, .)

/atom/Destroy()
	if(light)
		light.destroy()
		light = null
	return ..()

/atom/set_opacity()
	. = ..()
	if(.)
		var/turf/T = loc
		if(istype(T))
			T.handle_opacity_change(src)

#define LIGHT_MOVE_UPDATE \
var/turf/old_loc = loc;\
. = ..();\
if(loc != old_loc) {\
	for(var/datum/light_source/L in light_sources) {\
		L.source_atom.update_light();\
	}\
}

/atom/movable/Move(NewLoc, Dir = 0, step_x = 0, step_y = 0, var/glide_size_override = 0)
	LIGHT_MOVE_UPDATE

/atom/movable/forceMove(atom/destination, var/special_event, glide_size_override=0)
	LIGHT_MOVE_UPDATE

#undef LIGHT_MOVE_UPDATE

/obj/item/equipped()
	. = ..()
	update_light()

/obj/item/pickup()
	. = ..()
	update_light()

/obj/item/dropped()
	. = ..()
	update_light()
