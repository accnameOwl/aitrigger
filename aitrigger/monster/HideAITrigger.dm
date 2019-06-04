
Monster
	HideAITrigger()
		/*
		*	We don't have to worry about resizing or anything when we want to hide the
		*	AI trigger! So we relocate it outside of the map.
		*/
		ai_trigger.loc = locate(0,0,0)