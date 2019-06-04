# AI Trigger

    @Author: Tafe
	Language: .DM (Dream maker)
	Latest update: v01
	Date: 4. June 2019

	https://www.byond.com/members/Tafe


	This library is primarly meant to edjucate, but is entirely
	flexible for integration and importation.

## Object tree & functions
~~~~
AITrigger
    ChangeBounds(x_offset, y_offset, extra_width, extra_height)
    Size(x,y)

mob
    HideAITrigger()
    ShowAITrigger()

Monster

    AttackState()
    ChaseState()
    FoundTarget(mob/m)
    ResetState()

    home_loc = spawn_location
    mob/target
    AITrigger/ai_trigger
    aggro_dist
    attack_reach
    chase_speed
~~~~



## Info
FILES

	Entrypoint: monster/monster.dm

	The files will be organized so that each file contains seperate functions.
	This will hopefully improve readability, and my personal capability to
	comment the code as i proceed.
	each files name will be respectable towards it's function naming.


NAMING CONVENTION

	Types & Functions:
		/Monster & /AITrigger
		Function() & AnotherFunction()

	Variables:
		variable_naming = ""


