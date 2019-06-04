Monster
	ChaseState()

		//if there is a condition you have required to start the AI to chase, then
		//this is the statement you apply it to.
		//If the target is dead, or if the monster is dead, continue to ResetState()
		if(target)

			//For our movement, we need two variables.
			//Distance & Direction
			//
			//pr. itteration of the movement loop we are making
			//we are going to have to update our distance and direction
			//towards the target. We are stepping once towards the direction pr.
			//itteration

			var
				dist = get_dist(src, target)
				dir = get_dir(src, target)

			//for movement and condition itterations, we are using a whileloop
			//To also stop the AI from chasing eternally, we make sure the chasespeed
			//Isn't catching up to it's target, so it could be outrun.
			while(dist <= aggro_dist && target)

				//we change . to be our next step this itteration
				// . is the default return value(null)
				. = step(src, dir, step_size)

				//If for some reason, our step was blocked, then we want to move into
				//a random direction
				if(!.)
					step_rand(src)

				//We then update our distance and direction!
				//It is very crucial we do this AFTER we have moved
				dist = get_dist(src, target)
				dir = get_dir(src, target)

				//If we are in reach of an attack, we call AttackState()
				if(dist <= attack_reach)
					AttackState()

				sleep(world.tick_lag * chase_speed)

		//We set our default returnvalue to ResetState()

		. = ResetState()