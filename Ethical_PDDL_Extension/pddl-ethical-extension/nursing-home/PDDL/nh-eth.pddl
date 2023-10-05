(define (problem nh-eth)
    (:domain nh-d-eth)
     ( :objects
        p1 p2 - person
        key knives alcohol lighter cigarettes medication - item
        oily sweet salty - flavour
        x1 x2 x3 x4 - xPos
        y1 y2 y3 y4 - yPos
    )
    ( :init
        ; ready to set the initial state....
        ; including what position would moving along a direction result in
        ( updated )


        ; TODO according to floorplan and stage settings
        ( hasPosPerson ?P1 - person ?X1 - xPos ?Y1 - yPos )
        ( hasPosRobot ?R1 - robot ?X1 - xPos ?Y1 - yPos )
        ( hasDir ?R1 - robot ?D - direction )
        ( hasHeartProblem ?P1 - person )
        ( hasDiabetes ?P1 - person )
        ( hasHighBloodPressure ?P1 - person )

        ( isNotChef ?P1 - person )
        ( isResident ?P1 - person )

        ; robot moving directions and resulting positions
        ( nextX left x4 x3 )
        ( nextX left x3 x2 )
        ( nextX left x2 x1 )
        ( nextX right x1 x2 )
        ( nextX right x2 x3 )
        ( nextX right x3 x4 )
        
        ( nextY backward y4 y3 )
        ( nextY backward y3 y2 )
        ( nextY backward y2 y1 )
        ( nextY forward y1 y2 )
        ( nextY forward y2 y3 )
        ( nextY forward y3 y4 )

        ; the floorplan is as drawn below
        ;               (forward/backward)
        ; x1y4 x2y4 x3y4 x4y4     |
        ; x1y3 x2y3 x3y3 x4y3     |
        ; x1y2 x2y2 x3y2 x4y2     |    
        ; x1y1 x2y1 x3y1 x4y1     |_ _ _ _ (left/right)

    )

    ( :goal
        (and
        ( updated )
        ( hasPos agent x2 y4 )
        (not ( hasCrashed agent ) ) )
    )
)




(define (problem test1)
    (:domain default_domain)
    (:objects
    leia - robot
    maindoor_to_corridor corridor_to_maindoor corridor_to_livingroom livingroom_to_corridor - door
    outdoor corridor kitchen livingroom bedroom bathroom - room
    wp_maindoor_to_corridor wp_corridor_from_maindoor wp_corridor_to_maindoor wp_maindoor_from_corridor wp_corridor_to_livingroom wp_livingroom_from_corridor wp_livingroom_to_corridor wp_corridor_from_livingroom wp_corridor wp_livingroom wp_kitchen wp_bedroom wp_bathroom - waypoint
    )
    (:init
    (door_connected maindoor_to_corridor outdoor corridor wp_maindoor_to_corridor wp_corridor_from_maindoor)
    (door_connected corridor_to_maindoor corridor outdoor wp_corridor_to_maindoor wp_maindoor_from_corridor)
    (door_connected corridor_to_livingroom corridor livingroom wp_corridor_to_livingroom wp_livingroom_from_corridor)
    (door_connected livingroom_to_corridor livingroom corridor wp_livingroom_to_corridor wp_corridor_from_livingroom)
    (door_opened maindoor_to_corridor)
    (door_opened corridor_to_maindoor)
    (door_opened corridor_to_livingroom)
    (door_opened livingroom_to_corridor)
    (free_connected corridor kitchen)
    (free_connected kitchen corridor)
    (free_connected kitchen bedroom)
    (free_connected bedroom kitchen)
    (free_connected livingroom bedroom)
    (free_connected bedroom livingroom)
    (free_connected livingroom bathroom)
    (free_connected bathroom livingroom)
    (robot_at leia wp_maindoor_to_corridor)
    (robot_at_room leia outdoor)
    (waypoint_at wp_maindoor_to_corridor outdoor)
    (waypoint_at wp_corridor_from_maindoor corridor)
    (waypoint_at wp_corridor_to_maindoor corridor)
    (waypoint_at wp_maindoor_from_corridor outdoor)
    (waypoint_at wp_corridor_to_livingroom corridor)
    (waypoint_at wp_livingroom_from_corridor livingroom)
    (waypoint_at wp_livingroom_to_corridor livingroom)
    (waypoint_at wp_corridor_from_livingroom corridor)
    (waypoint_at wp_corridor corridor)
    (waypoint_at wp_livingroom livingroom)
    (waypoint_at wp_kitchen kitchen)
    (waypoint_at wp_bedroom bedroom)
    (waypoint_at wp_bathroom bathroom)
    )
    (:goal (and
        (robot_at leia wp_corridor_to_livingroom)
    )))
