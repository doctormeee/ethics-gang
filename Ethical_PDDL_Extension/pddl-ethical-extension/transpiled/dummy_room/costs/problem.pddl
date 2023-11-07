(define (problem waypoints-p-eth_GEN)
(:domain waypoints-d-eth_GEN )
(:init 
(= (total-cost) 0)
(door_connected bathroom_to_livingroom bathroom livingroom wp_bathroom_to_livingroom wp_livingroom_from_bathroom )
(door_connected livingroom_to_bathroom livingroom bathroom wp_livingroom_to_bathroom wp_bathroom_from_livingroom )
(door_connected kitchen_to_livingroom kitchen livingroom wp_kitchen_to_livingroom wp_livingroom_from_kitchen )
(door_connected livingroom_to_kitchen livingroom kitchen wp_livingroom_to_kitchen wp_kitchen_from_livingroom )
(door_connected kitchen_to_balcony kitchen balcony wp_kitchen_to_balcony wp_balcony_from_kitchen )
(door_connected balcony_to_kitchen balcony kitchen wp_balcony_to_kitchen wp_kitchen_from_balcony )
(door_connected diningroom_to_livingroom diningroom livingroom wp_diningroom_to_livingroom wp_livingroom_from_diningroom )
(door_connected livingroom_to_diningroom livingroom diningroom wp_livingroom_to_diningroom wp_diningroom_from_livingroom )
(door_connected diningroom_to_balcony diningroom balcony wp_diningroom_to_balcony wp_balcony_from_diningroom )
(door_connected balcony_to_diningroom balcony diningroom wp_balcony_to_diningroom wp_diningroom_from_balcony )
(door_connected bedroom_to_balcony bedroom balcony wp_bedroom_to_balcony wp_balcony_from_bedroom )
(door_connected balcony_to_bedroom balcony bedroom wp_balcony_to_bedroom wp_bedroom_from_balcony )
(door_opened bathroom_to_livingroom )
(door_opened livingroom_to_bathroom )
(door_opened kitchen_to_livingroom )
(door_opened livingroom_to_kitchen )
(door_opened kitchen_to_balcony )
(door_opened balcony_to_kitchen )
(door_opened diningroom_to_livingroom )
(door_opened livingroom_to_diningroom )
(door_opened diningroom_to_balcony )
(door_opened balcony_to_diningroom )
(door_opened bedroom_to_balcony )
(door_opened balcony_to_bedroom )
(robot_at leia wp_bedroom_to_balcony )
(robot_at_room leia bedroom )
(waypoint_at wp_bathroom_to_livingroom bathroom )
(waypoint_at wp_livingroom_to_bathroom livingroom )
(waypoint_at wp_kitchen_to_livingroom kitchen )
(waypoint_at wp_livingroom_to_kitchen livingroom )
(waypoint_at wp_kitchen_to_balcony kitchen )
(waypoint_at wp_balcony_to_kitchen balcony )
(waypoint_at wp_diningroom_to_livingroom diningroom )
(waypoint_at wp_livingroom_to_diningroom livingroom )
(waypoint_at wp_diningroom_to_balcony diningroom )
(waypoint_at wp_balcony_to_diningroom balcony )
(waypoint_at wp_bedroom_to_balcony bedroom )
(waypoint_at wp_balcony_to_bedroom balcony )
(waypoint_at wp_bathroom_from_livingroom bathroom )
(waypoint_at wp_livingroom_from_bathroom livingroom )
(waypoint_at wp_kitchen_from_livingroom kitchen )
(waypoint_at wp_livingroom_from_kitchen livingroom )
(waypoint_at wp_kitchen_from_balcony kitchen )
(waypoint_at wp_balcony_from_kitchen balcony )
(waypoint_at wp_diningroom_from_livingroom diningroom )
(waypoint_at wp_livingroom_from_diningroom livingroom )
(waypoint_at wp_diningroom_from_balcony diningroom )
(waypoint_at wp_balcony_from_diningroom balcony )
(waypoint_at wp_bedroom_from_balcony bedroom )
(waypoint_at wp_balcony_from_bedroom balcony ))

(:goal (and
(robot_at_room leia bathroom )
(check )
(final-mode)
(final-mode-check-privacybreachment-bedroom)
(final-mode-check-privacybreachment-balcony)
(final-mode-check-privacybreachment-livingroom)
(final-mode-check-privacybreachment-bathroom)
(final-mode-check-privacybreachment-kitchen)
(final-mode-check-privacybreachment-diningroom)
) 
)

(:metric minimize (total-cost))
)
