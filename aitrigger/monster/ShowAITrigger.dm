
Monster
	ShowAITrigger()

		/*
		*	If Monster.ai_trigger for some reason is non-existant
		*	we have to create a new one.
		*
		*	This involves scaling it's appearance and bounds aswell.
		*/
		if(!ai_trigger)

			/*
			*	This is where we create the new ai_trigger
			*	we pass in src as argument, cause that is who we want
			*	as parent_monster
			*/
			ai_trigger = new/AITrigger(src)

			/*
			*	AITrigger.Scale(width, height)
			*
			*	scale the ai_trigger, relative to the monsters aggro_dist.
			*	This only changes the appearance, and thus we need additional functions
			*	to change it's collition points aswell
			*/
			ai_trigger.Scale(aggro_dist,aggro_dist)

			/*
			*	ChangeBounds(offset_x, offset_y, bound_x, bound_y)
			*
			*	Changes it's collition points, by rescaling bound_width and bound_height
			*	It get scaled relative to aggro_dist from monster, and world.icon_size
			*
			*	increasing bounds only increases from left to right and bottom to top.( ^ & > )
			*	from bottomleft corner. therefore we need to offset it's pixel location.
			*
			*	we calibrate it by getting amount of pixels, which is aggro_dist * world.icon_size
			*	We divide that by 2, to only move half of the square's width. we multiply it by -1,
			*	so we offset it in a opposite direction. we don't want the square to move upwards and right,
			*	but downwards and left.
			*
			*	bounds are increased by Monster.aggro_dist
			*
			*/
			ai_trigger.ChangeBounds((aggro_dist * world.icon_size/2)*-1, (aggro_dist * world.icon_size / 2)*-1, aggro_dist, aggro_dist)

		//relocate it back to src

		/*
		*	We make it visible by changing it's location
		*	relative to the monster
		*/
		ai_trigger.loc = src.loc