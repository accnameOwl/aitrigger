Monster

	FoundTarget(mob/new_target)

		//To stop it from changing targets, we keep to our current target
		//by making an exception towards an already excisting target.

		//If there is no target from before. then continue
		if(!target)

			//make new_target our current target priority
			target = new_target

			//We then hide our trigger object!
			//This is crucial, as AITrigger is the component
			//that calls FoundTarget(), and starts the AI cycle
			HideAITrigger()

			//We then call to ChaseState() and continue our AI there
			ChaseState()