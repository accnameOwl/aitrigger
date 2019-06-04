Monster

	//Removes current target and moves back to it's initial position
	ResetState()

		//We remove our current target
		target = null

		//variables needed to know distance and directions to walk
		//to get back to home_loc
		var
			dist = get_dist(src, home_loc)
			dir = get_dir(src, home_loc)

		//Loop to itterate movement calls towards home_loc
		//walk home while distance to home is greater then zero
		while(dist > 0)

			//this will be our step towards home
			. = step(src, dir)

			//If we for some reason can't make the step, go to a
			//random direction.
			if(!.)
				step_rand(src)

			//recalculate direction and distance again, after moving
			dist = get_dist(src, home_loc)
			dir = get_dir(src, home_loc)


			sleep(1)

		//This will get called when monster gets back to home
		. = ShowAITrigger(src)