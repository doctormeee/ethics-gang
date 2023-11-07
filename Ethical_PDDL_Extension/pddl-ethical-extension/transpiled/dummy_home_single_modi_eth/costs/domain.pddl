(define (domain waypoints-d_GEN)
(:requirements :action-costs :strips :typing :equality :negative-preconditions :conditional-effects)

(:types
waypoint door room robot  - object 
)

(:constants
leia  - robot 
Bathroom_to_LivingRoom LivingRoom_to_Bathroom Kitchen_to_LivingRoom LivingRoom_to_Kitchen Kitchen_to_Balcony Balcony_to_Kitchen Bedroom_to_Balcony Balcony_to_Bedroom - door
Balcony Kitchen LivingRoom Bedroom Bathroom - room ; define the rooms existing in the initial state
wp_Bathroom_to_LivingRoom wp_LivingRoom_to_Bathroom wp_Kitchen_to_LivingRoom wp_LivingRoom_to_Kitchen wp_Kitchen_to_Balcony wp_Balcony_to_Kitchen wp_Bedroom_to_Balcony wp_Balcony_to_Bedroom - waypoint ; corresponds to the "doors"
wp_Bathroom_from_LivingRoom wp_LivingRoom_from_Bathroom wp_Kitchen_from_LivingRoom wp_LivingRoom_from_Kitchen wp_Kitchen_from_Balcony wp_Balcony_from_Kitchen wp_Bedroom_from_Balcony wp_Balcony_from_Bedroom - waypoint 
wp_Balcony wp_Kitchen wp_LivingRoom wp_Bathroom - waypoint
)

(:functions (total-cost))

(:predicates
(door_connected ?d - door ?r1 - room ?r2 - room ?wp1 - waypoint ?wp2 - waypoint )
(robot_at ?r - robot ?wp - waypoint )
(robot_at_room ?r - robot ?room - room )
(waypoint_at ?wp - waypoint ?r - room )
(door_opened ?d - door )
(check )
(privacybreachment ?room - room )
(final-mode)
(final-mode-check-privacybreachment-bedroom)
(final-mode-check-privacybreachment-balcony)
(final-mode-check-privacybreachment-livingroom)
(final-mode-check-privacybreachment-bathroom)
(final-mode-check-privacybreachment-kitchen)
)

(:action cross
:parameters (?r - robot ?from - room ?to - room ?d - door ?wp1 - waypoint ?wp2 - waypoint )
:precondition (and
(door_opened ?d )
(waypoint_at ?wp1 ?from )
(waypoint_at ?wp2 ?to )
(robot_at_room ?r ?from )
(door_connected ?d ?from ?to ?wp1 ?wp2 )
(robot_at ?r ?wp1 )
(not (final-mode ))
(check )
) 

:effect (and
(not (check ))
(not (robot_at ?r ?wp1 ))
(not (robot_at_room ?r ?from ))
(robot_at_room ?r ?to )
(robot_at ?r ?wp2 )
) 


)
(:action move
:parameters (?r - robot ?from - waypoint ?to - waypoint ?room - room )
:precondition (and
(waypoint_at ?from ?room )
(waypoint_at ?to ?room )
(robot_at_room ?r ?room )
(robot_at ?r ?from )
(not (final-mode ))
(check )
) 

:effect (and
(not (check ))
(not (robot_at ?r ?from ))
(robot_at ?r ?to )
) 


)
(:action check-ethical-features
:parameters ()
:precondition (and
(not (final-mode ))
(not (check ))
) 

:effect (and
(check )
(forall (?r - robot ?room - room )
(when (and
(robot_at_room ?r ?room )
) 
 (privacybreachment ?room )))
) 


)
(:action final-mode-start
:parameters ()
:precondition (not (final-mode ))
:effect (final-mode )

)
(:action final-mode-check-op-true-privacybreachment-bedroom
:parameters ()
:precondition (and
(final-mode )
(privacybreachment bedroom )
(not (final-mode-check-privacybreachment-bedroom ))
) 

:effect (and
(final-mode-check-privacybreachment-bedroom )
(increase (total-cost ) 1)
) 


)
(:action final-mode-check-op-false-privacybreachment-bedroom
:parameters ()
:precondition (and
(final-mode )
(not (privacybreachment bedroom ))
(not (final-mode-check-privacybreachment-bedroom ))
) 

:effect (final-mode-check-privacybreachment-bedroom )

)
(:action final-mode-check-op-true-privacybreachment-balcony
:parameters ()
:precondition (and
(final-mode )
(privacybreachment balcony )
(not (final-mode-check-privacybreachment-balcony ))
) 

:effect (and
(final-mode-check-privacybreachment-balcony )
(increase (total-cost ) 1)
) 


)
(:action final-mode-check-op-false-privacybreachment-balcony
:parameters ()
:precondition (and
(final-mode )
(not (privacybreachment balcony ))
(not (final-mode-check-privacybreachment-balcony ))
) 

:effect (final-mode-check-privacybreachment-balcony )

)
(:action final-mode-check-op-true-privacybreachment-livingroom
:parameters ()
:precondition (and
(final-mode )
(privacybreachment livingroom )
(not (final-mode-check-privacybreachment-livingroom ))
) 

:effect (and
(final-mode-check-privacybreachment-livingroom )
(increase (total-cost ) 1)
) 


)
(:action final-mode-check-op-false-privacybreachment-livingroom
:parameters ()
:precondition (and
(final-mode )
(not (privacybreachment livingroom ))
(not (final-mode-check-privacybreachment-livingroom ))
) 

:effect (final-mode-check-privacybreachment-livingroom )

)
(:action final-mode-check-op-true-privacybreachment-bathroom
:parameters ()
:precondition (and
(final-mode )
(privacybreachment bathroom )
(not (final-mode-check-privacybreachment-bathroom ))
) 

:effect (and
(final-mode-check-privacybreachment-bathroom )
(increase (total-cost ) 1)
) 


)
(:action final-mode-check-op-false-privacybreachment-bathroom
:parameters ()
:precondition (and
(final-mode )
(not (privacybreachment bathroom ))
(not (final-mode-check-privacybreachment-bathroom ))
) 

:effect (final-mode-check-privacybreachment-bathroom )

)
(:action final-mode-check-op-true-privacybreachment-kitchen
:parameters ()
:precondition (and
(final-mode )
(privacybreachment kitchen )
(not (final-mode-check-privacybreachment-kitchen ))
) 

:effect (and
(final-mode-check-privacybreachment-kitchen )
(increase (total-cost ) 1)
) 


)
(:action final-mode-check-op-false-privacybreachment-kitchen
:parameters ()
:precondition (and
(final-mode )
(not (privacybreachment kitchen ))
(not (final-mode-check-privacybreachment-kitchen ))
) 

:effect (final-mode-check-privacybreachment-kitchen )

)

)
