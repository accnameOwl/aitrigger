/**
*	File: monster/monster.dm
*/

/*
*	Desc:
*		This is the entrypoint for the library.
*		You can import this type to your own project,
*		but for a pre-existing type for monsters with
*		AI or other functions you would most likely
*		be better of with applying the algorythm for
*		the AI trigger.
*/


Monster
	parent_type = /mob

	New()
		..()
		home_loc = loc
		ShowAITrigger()

	var
		/*	target
		*
		*	We have to parse a target to the monster through the AI.
		*	This library has standard target type to /mob in this example.
		*	But you can change it's type relative to a player's type if you want
		*	the AI to only detect players.
		*
		*	default type is /mob
		*
		*	default value is null
		*/

		mob/target = null


		/*	ai_trigger
		*
		*	We have to relate a trigger object to the monster.
		*	This is essential, because we need to be able to parse
		*	map cordinates to the ai_trigger.
		*
		*	default type is /AITrigger
		*
		*	default value is undeclared
		*/

		AITrigger/ai_trigger


		//	The next variables are really only related to movements

		/*	home_loc
		*
		*	We store the monsters initial location to home_loc
		*	so we can later make it run back to it's initial position
		*	if losing a target, or if target is out of reach
		*
		*	default value is undeclared
		*/

		home_loc


		/*	aggro_dist
		*
		*	One crucial part of this method of AI triggering
		*	is the ability to set a distance of how far the
		*	monster can detect players or other mobs.
		*
		*	This variable determines how far that distance will be
		*	in tiles, measured from the centerpoint.
		*
		*	default value is 5
		*/

		aggro_dist = 4


		/*	attack_reach
		*
		*	We would have to determine how close the monster has to be
		*	relative to it's target's position.
		*
		*	default value is 1
		*/

		attack_reach = 1

		/*
		* chase_speed = world.tick_lag * chase_speed
		*/
		chase_speed = 2


	proc

		/*	These functions are only constructors, and are
		*	overwritten within the other files!
		*
		*	Read this file for information of return values
		*	and arguments
		*/


		/*	FoundTarget(mob/new_target)
		*
		*	argument: a new target, with type /mob
		*	@return TRUE or FALSE
		*
		*	desc: Sets a new target and forwards to ChaseState() and HideAITrigger()
		*		related towards new target
		*/
		FoundTarget(mob/new_target)


		/*	ResetState()
		*
		*	no arguments
		*	@return TRUE or FALSE
		*
		*	desc: If conditions are met to reset the AI, ResetState() is called
		*		The monster returns to home_loc, then calls ShowAITrigger()
		*/
		ResetState()

		/*	ChaseState()
		*
		*	no arguments
		*	@return none
		*
		*	desc: Runs a loop that checks for conditions regarding distance
		*		towards target.
		*
		*		if target is close enough, calls AttackState()
		*		if target is to far, calls ResetState()
		*/
		ChaseState()


		/*	AttackState()
		*
		*	no arguments
		*	@return TRUE or FALSE
		*
		*	placeholder for show, sends a text to world
		*/
		AttackState()


		/* ShowAITrigger()
		*
		*	no arguments
		*	@return null
		*
		*	desc:
		*		relocates monsters ai_trigger to it's current position
		*/
		ShowAITrigger()


		/* ShowAITrigger()
		*
		*	no arguments
		*	@return null
		*
		*	desc:
		*		relocates monsters ai_trigger to locate(0,0,0)
		*
		*		Relocating it outside of the map makes it never proc towards other players.
		*/
		HideAITrigger()