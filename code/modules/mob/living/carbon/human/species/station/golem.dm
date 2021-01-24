/datum/species/golem
	name = "Golem"
	name_plural = "golems"

	icobase = 'icons/mob/human_races/species/golem/body.dmi'
	deform = 'icons/mob/human_races/species/golem/body.dmi'
	husk_icon = 'icons/mob/human_races/species/golem/husk.dmi'

	language = "Sol Common" //todo?
	unarmed_types = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick, /datum/unarmed_attack/punch)
	species_flags = SPECIES_FLAG_NO_PAIN | SPECIES_FLAG_NO_SCAN | SPECIES_FLAG_NO_POISON
	spawn_flags = SPECIES_IS_RESTRICTED | SPECIES_IS_WHITELISTED | SPECIES_NO_FBP_CONSTRUCTION
	siemens_coefficient = 0

	breath_type = null
	poison_types = null

	blood_color = "#515573"
	flesh_color = "#137e8f"

	has_organ = list(
		BP_BRAIN = /obj/item/organ/internal/brain/golem
		)

	death_message = "becomes completely motionless..."
	genders = list(NEUTER)

/datum/species/golem/handle_post_spawn(var/mob/living/carbon/human/H)
	if(H.mind)
		H.mind.assigned_role = "Golem"
		H.mind.set_special_role("Golem")
	H.real_name = "golem ([rand(1, 1000)])"
	H.SetName(H.real_name)
	..()

/datum/species/golem/post_organ_rejuvenate(var/obj/item/organ/org)
	org.status |= ORGAN_BRITTLE
	org.status |= ORGAN_CRYSTAL
