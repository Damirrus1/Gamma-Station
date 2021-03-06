/obj/item/clothing/head/hardhat
	name = "hard hat"
	desc = "A piece of headgear used in dangerous working conditions to protect the head. Comes with a built-in flashlight."
	icon_state = "hardhat"
	item_state = "hardhat"
	item_color = "standard"
	var/brightness_on = 4 //luminosity when on
	var/on = 0
	armor = list(melee = 30, bullet = 5, laser = 20,energy = 10, bomb = 20, bio = 10, rad = 20)
	flags_inv = 0
	action_button_name = "Toggle Hardhat"
	siemens_coefficient = 0.9

/obj/item/clothing/head/hardhat/atom_init()
	. = ..()
	update_icon()

/obj/item/clothing/head/hardhat/attack_self(mob/user)
	if(!isturf(user.loc))
		to_chat(user, "You cannot turn the light on while in this [user.loc]")//To prevent some lighting anomalities.
		return FALSE

	on = !on
	update_icon()

	if(on)
		set_light(brightness_on)
	else
		set_light(0)
	user.update_inv_head()
	return TRUE

/obj/item/clothing/head/hardhat/update_icon()
	icon_state = "[initial(icon_state)][on]_[item_color]"
	item_state = icon_state

/obj/item/clothing/head/hardhat/yellow
	item_color = "yellow"

/obj/item/clothing/head/hardhat/yellow/visor
	name = "visor hard hat"
	desc = "A piece of headgear used in dangerous working conditions to protect the head. Comes with a built-in flashlight and visor, which may protect eyes."
	item_color = "yellow_visor"
	body_parts_covered = HEAD|FACE|EYES
	flags = MASKCOVERSEYES
	flash_protection = 2

/obj/item/clothing/head/hardhat/yellow/visor/attack_self(mob/user)
	if(!..())
		return
	flash_protection = on ? 2 : 0

/obj/item/clothing/head/hardhat/orange
	item_color = "orange"

/obj/item/clothing/head/hardhat/red
	name = "firefighter helmet"
	item_color = "red"
	flags_pressure = STOPS_HIGHPRESSUREDMAGE
	heat_protection = HEAD
	max_heat_protection_temperature = FIRE_HELMET_MAX_HEAT_PROTECTION_TEMPERATURE

/obj/item/clothing/head/hardhat/white
	item_color = "white"
	flags_pressure = STOPS_HIGHPRESSUREDMAGE
	heat_protection = HEAD
	max_heat_protection_temperature = FIRE_HELMET_MAX_HEAT_PROTECTION_TEMPERATURE

/obj/item/clothing/head/hardhat/dblue
	item_color = "dblue"
