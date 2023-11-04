(define (domain nh-d-eth)
    ( :requirements :strips :typing :equality :negative-preconditions :conditional-effects :ethical)

    ( :types
        ; robot direction person item flavour xPos yPos - object
        waypoint door room robot - object
    )

    ( :constants
        agent - robot
        ; probably not use direction anymore
        left right forward backward - direction
    )

    ( :predicates
        ; two rooms connected via a door, and the waypoint location of that door in room 1 and room 2 respectively, because a door has 2 sides
        (door_connected ?d - door ?r1 ?r2 - room ?wp1 ?wp2 - waypoint)
        ; two rooms connected without any intermediate gates/doors
        (free_connected ?r1 ?r2 - room)

        ; the location of the robot at a particular waypoint
        (robot_at ?r - robot ?wp - waypoint)
        ; the location of the robot at in a particular room
        (robot_at_room ?r - robot ?room - room)

        ; define that a particular waypoint refers to a particular room
        (waypoint_at ?wp - waypoint ?r - room)

        ; define whether a door is open
        (door_opened ?d - door)

        ( updated )

    )

    ; direction change of the robot
    (:durative-action cross
        :parameters (?r - robot ?from ?to - room ?d - door ?wp1 ?wp2 - waypoint)
        :duration ( = ?duration 5)
        :condition (and
            (over all(door_opened ?d))

            (at start(waypoint_at ?wp1 ?from))
            (at start(waypoint_at ?wp2 ?to))

            (at start(robot_at_room ?r ?from))

            (at start(door_connected ?d ?from ?to ?wp1 ?wp2))
            (at start(robot_at ?r ?wp1))
        )
        :effect (and
            (at start(not(robot_at ?r ?wp1)))
            (at start(not(robot_at_room ?r ?from)))
            (at end(robot_at_room ?r ?to))
            (at end(robot_at ?r ?wp2))
        )
    )

    (:durative-action navigate
        :parameters (?r - robot ?from ?to - room ?d - door ?wp1 ?wp2 - waypoint)
        :duration ( = ?duration 10)
        :condition (and

            (at start(waypoint_at ?wp1 ?from))
            (at start(waypoint_at ?wp2 ?to))

            (at start(robot_at_room ?r ?from))

            (at start(free_connected ?from ?to))
            (at start(robot_at ?r ?wp1))
        )
        :effect (and
        (at start(not(robot_at ?r ?wp1)))
        (at start(not(robot_at_room ?r ?from)))
        (at end(robot_at_room ?r ?to))
        (at end(robot_at ?r ?wp2))
        )
    )
)

    (:durative-action move
        :parameters (?r - robot ?from ?to - waypoint ?room - room)
        :duration ( = ?duration 10)
        :condition (and
            (at start(waypoint_at ?from ?room))
            (at start(waypoint_at ?to ?room))
            (at start(robot_at_room ?r ?room))
            (at start(robot_at ?r ?from))
        )
        :effect (and
        (at start(not(robot_at ?r ?from)))
        (at end(robot_at ?r ?to))
    )
    )