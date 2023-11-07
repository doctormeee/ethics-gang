(define (domain waypoints-d_GEN)
(:requirements :action-costs :strips :typing :equality :negative-preconditions :conditional-effects)

(:types
waypoint door room robot  - object 
)

(:constants
leia  - robot 
bedroom_to_balcony  - door 
bedroom balcony  - room 
wp_balcony_from_bedroom wp_Bedroom_to_Balcony - waypoint 
)

(:functions (total-cost))

(:predicates
(door_connected ?d - door ?r1 - room ?r2 - room ?wp1 - waypoint ?wp2 - waypoint )
(robot_at ?r - robot ?wp - waypoint )
(robot_at_room ?r - robot ?room - room )
(waypoint_at ?wp - waypoint ?r - room )
(door_opened ?d - door )
(check )
(final-mode)
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
(:action check-ethical-features
:parameters ()
:precondition (and
(not (final-mode ))
(not (check ))
) 

:effect (and
(check )
) 


)
(:action final-mode-start
:parameters ()
:precondition (not (final-mode ))
:effect (final-mode )

)

)
