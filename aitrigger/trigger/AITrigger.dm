/**
*
*	Info:
*		What we need to know before looking into this code, there
*		are a few key points we need to assure. Our trigger will be a square
*		and it's size needs to be corresponding to the monsters aggro_dist
*
*		Therefore, we need to change it's image size, and bounds.
*		Just changing the image size only changes it's appearance, but does not
*		make sure to change it's collition points.
*
*		A movable's bounds is what determines it's collition points. Hence, we need
*		to scale both image and collition. (ChangeBounds() & Scale())
*/


AITrigger

	parent_type = /obj

	var

		Monster/parent_monster

	New(mob/new_parent)
		parent_monster = new_parent

	Crossed(mob/m)
		spawn() parent_monster.FoundTarget(m)


	proc

		//The object needs to portray correct bounds in pixel movement.
		//And also to scale, relative to parent_monster's aggro_dist

		/* ChangeBounds(x_offset, y_offset, extra_width, extra_height)
		*
		*	arguments:
		*		x_offset = pixels to shift image on the x-axis. Automaticly negative
		*		y_offset = pixels to shift image on the y-axis. Automaticly negative
		*		extra_width = how many tiles to enlarge on x-axis
		*		extra_height = how many tiles to enlarge on y-axis
		*
		*/
		ChangeBounds(x_offset = 0, y_offset = 0, extra_width = 0, extra_height = 0)

			//offset image in pixels.
			pixel_x -= x_offset
			pixel_y -= y_offset

			//increase bound size
			bound_width += extra_width * world.icon_size
			bound_height += extra_height * world.icon_size

			//offstep the object on the map, relative to it's size.
			step_x = (bound_width / 2) * -1
			step_y = (bound_height / 2) * -1

		/*	Scale()
		*
		*	argument:
		*		_x = times to scale in x-coordinate
		*		_y = times to scale in y-coordinate
		*
		*/
		Scale(_x,_y)
			transform = new/matrix().Scale(_x +1,_y+1)