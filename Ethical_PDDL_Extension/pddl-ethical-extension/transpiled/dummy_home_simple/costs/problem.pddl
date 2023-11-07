(define (problem waypoints-p_GEN)
(:domain waypoints-d_GEN )
(:init 
(= (total-cost) 0)
(door_connected bedroom_to_balcony bedroom balcony wp_bedroom_to_balcony wp_balcony_from_bedroom )
(door_opened bedroom_to_balcony )
(robot_at leia wp_bedroom_to_balcony )
(robot_at_room leia bedroom )
(waypoint_at wp_bedroom_to_balcony bedroom )
(waypoint_at wp_balcony_from_bedroom balcony ))

(:goal (and
(robot_at_room leia balcony )
(check )
(final-mode)
) 
)

(:metric minimize (total-cost))
)
