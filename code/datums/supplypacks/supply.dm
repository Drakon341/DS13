/decl/hierarchy/supply_pack/supply
	name = "Supply"

/decl/hierarchy/supply_pack/supply/food
	name = "Kitchen supply crate"
	contains = list(/obj/item/weapon/reagent_containers/food/condiment/flour = 6,
					/obj/item/weapon/reagent_containers/food/drinks/milk = 4,
					/obj/item/weapon/reagent_containers/food/drinks/soymilk = 2,
					/obj/item/weapon/storage/fancy/egg_box = 2,
					/obj/item/weapon/reagent_containers/food/snacks/tofu = 2,
					/obj/item/weapon/reagent_containers/food/snacks/rawbacon = 8,
					/obj/item/weapon/reagent_containers/food/snacks/meat = 4
					)
	cost = 10
	containertype = /obj/structure/closet/crate/freezer
	containername = "\improper Food crate"

/decl/hierarchy/supply_pack/supply/toner
	name = "Toner cartridges"
	contains = list(/obj/item/device/toner = 6)
	cost = 10
	containername = "\improper Toner cartridges"

/decl/hierarchy/supply_pack/supply/janitor
	name = "Janitorial supplies"
	contains = list(/obj/item/weapon/reagent_containers/glass/bucket,
					/obj/item/weapon/mop,
					/obj/item/weapon/caution = 4,
					/obj/item/weapon/storage/bag/trash,
					/obj/item/device/lightreplacer,
					/obj/item/weapon/reagent_containers/spray/cleaner,
					/obj/item/weapon/reagent_containers/glass/rag,
					/obj/item/weapon/grenade/chem_grenade/cleaner = 3,
					/obj/structure/mopbucket)
	cost = 10
	containertype = /obj/structure/closet/crate/large
	containername = "\improper Janitorial supplies"

/decl/hierarchy/supply_pack/supply/boxes
	name = "Empty boxes"
	contains = list(/obj/item/weapon/storage/box = 10)
	cost = 10
	containername = "\improper Empty box crate"

/decl/hierarchy/supply_pack/supply/bureaucracy
	contains = list(/obj/item/weapon/clipboard,
					/obj/item/weapon/clipboard,
					/obj/item/weapon/pen/red,
					/obj/item/weapon/pen/blue,
					/obj/item/weapon/pen/green,
					/obj/item/device/camera_film,
					/obj/item/weapon/folder/blue,
					/obj/item/weapon/folder/red,
					/obj/item/weapon/folder/yellow,
					/obj/item/weapon/hand_labeler,
					/obj/item/weapon/tool/tape_roll,
					/obj/structure/filingcabinet/chestdrawer{anchored = 0},
					/obj/item/weapon/paper_bin)
	name = "Office supplies"
	cost = 15
	containertype = /obj/structure/closet/crate/large
	containername = "\improper Office supplies crate"

/decl/hierarchy/supply_pack/supply/scanner_module
	name = "Paper scanner module crate"
	contains = list(/obj/item/weapon/computer_hardware/scanner/paper = 4)
	cost = 20
	containername = "\improper Paper scanner module crate"

/decl/hierarchy/supply_pack/supply/spare_pda
	name = "Spare PDAs"
	contains = list(/obj/item/modular_computer/pda = 3)
	cost = 10
	containername = "\improper Spare PDA crate"