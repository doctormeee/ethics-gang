(define (domain waypoints-d-eth)
    ; ( :requirements :strips :typing :fluents) ; :equality :negative-preconditions :conditional-effects); :ethical)

    ; (:requirements :strips :fluents :typing) ;:durative-actions :timed-initial-literals :typing :negative-preconditions :duration-inequalities)
    ; (:requirements :strips :fluents :durative-actions :timed-initial-literals :typing :negative-preconditions :duration-inequalities :ethical)
    ; (:requirements :strips :typing :negative-preconditions :ethical)
    ( :requirements :strips :typing :equality :negative-preconditions :conditional-effects :ethical)

    ( :types
        ; robot direction person item flavour xPos yPos - object
        waypoint door room robot - object
    )

    ( :constants
        ; agent - robot
        ; probably not use direction anymore
        ; left right forward backward - direction

        leia - robot
    )

    ( :predicates
        ; two rooms connected via a door, and the waypoint location of that door in room 1 and room 2 respectively, because a door has 2 sides
        (door_connected ?d - door ?r1 ?r2 - room ?wp1 ?wp2 - waypoint)

        ; ; two rooms connected without any intermediate gates/doors
        ; (free_connected ?r1 ?r2 - room)

        ; the location of the robot at a particular waypoint
        (robot_at ?r - robot ?wp - waypoint)
        ; the location of the robot at in a particular room
        (robot_at_room ?r - robot ?room - room)

        ; define that a particular waypoint refers to a particular room
        (waypoint_at ?wp - waypoint ?r - room)

        ; define whether a door is open
        (door_opened ?d - door)

        ; ( updated )

    )

    ; cross the door...
    (:action cross
        :parameters (?r - robot ?from ?to - room ?d - door ?wp1 ?wp2 - waypoint)
        :precondition (and
            (door_opened ?d)

            (waypoint_at ?wp1 ?from)
            (waypoint_at ?wp2 ?to)

            (robot_at_room ?r ?from)

            (door_connected ?d ?from ?to ?wp1 ?wp2)
            (robot_at ?r ?wp1)
        )
        :effect (and
            (not (robot_at ?r ?wp1) )
            (not (robot_at_room ?r ?from) )
            (robot_at_room ?r ?to)
            (robot_at ?r ?wp2)
        )
    )

    ; move withn a room, from one waypoint to another
    ; like if the robot is at WP_LIVINGROOM_FROM_KITCHEN, meaning it just went through the 
    ; door between kitchen and living room and is currently in the living room.
    ; if it wants to move from living room to the bathroom. it needs to make its way to WP_LIVINGROOM_TO_BATHROOM
    ; "move" moves the robot from WP_LIVINGROOM_FROM_KITCHEN to WP_LIVINGROOM_TO_BATHROOM
    (:action move
        :parameters (?r - robot ?from ?to - waypoint ?room - room)
        :precondition (and
            (waypoint_at ?from ?room)
            (waypoint_at ?to ?room)
            (robot_at_room ?r ?room)
            (robot_at ?r ?from)
        )
        :effect (and
        (not(robot_at ?r ?from))
        (robot_at ?r ?to)
        )
    )

    ; (:ethical-features
    ;     ( PrivacyBreachment ?room - room )
    ; )
    ; ( :ethical-rank
    ;     :feature
    ;     ( PrivacyBreachment Bedroom )
    ;     :type -
    ;     :rank 1
    ; )
    ; ( :ethical-rank
    ;     :feature
    ;     ( PrivacyBreachment Balcony )
    ;     :type -
    ;     :rank 1
    ; )
    ; ( :ethical-rank
    ;     :feature
    ;     ( PrivacyBreachment LivingRoom )
    ;     :type -
    ;     :rank 1
    ; )
    ; ( :ethical-rank
    ;     :feature
    ;     ( PrivacyBreachment Bathroom )
    ;     :type -
    ;     :rank 1
    ; )
    ; ( :ethical-rank
    ;     :feature
    ;     ( PrivacyBreachment Kitchen )
    ;     :type -
    ;     :rank 1
    ; )
    ; ( :ethical-rank
    ;     :feature
    ;     ( PrivacyBreachment DiningRoom )
    ;     :type -
    ;     :rank 2
    ; )
    ; ( :ethical-rule privacyRule
    ;     :parameters (?r - robot ?room - room)
    ;     :precondition ( and 
    ;     (robot_at_room ?r ?room)
    ;     )
    ;     :activation null
    ;     :features ( PrivacyBreachment ?room )
    ; )
)