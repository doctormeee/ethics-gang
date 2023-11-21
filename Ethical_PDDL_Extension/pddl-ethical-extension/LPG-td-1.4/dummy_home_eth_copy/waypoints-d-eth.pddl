(define (domain waypoints-d-eth)
    ; ( :requirements :strips :typing :fluents) ; :equality :negative-preconditions :conditional-effects); :ethical)

    ; (:requirements :strips :fluents :typing) ;:durative-actions :timed-initial-literals :typing :negative-preconditions :duration-inequalities)
    ; (:requirements :strips :fluents :durative-actions :timed-initial-literals :typing :negative-preconditions :duration-inequalities :ethical)
    ; (:requirements :strips :typing :negative-preconditions :ethical)
    ( :requirements :strips :typing :equality :negative-preconditions :conditional-effects :ethical)

    ( :types
        ; robot direction person items flavour xPos yPos - object
        waypoint door room robot person items - object
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

        ; define whether a robot is holding an items
        (robot_has_items ?r - robot ?i - items)

        ; define the current wellbeing of the person
        (content_person ?p - person)

        
        (person_needs_items ?p - person ?i -items)
        ; define if 
        (person_has_items ?p - person ?i -items)

        ; define whether an items is in a room
        ; (items_in_room ?i - items ?r - room)
        
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

    ; (:action pick_items
    ;     :parameters (?r - robot ?i - items ?room - room)
    ;     :precondition (and
    ;         (not (robot_has_items ?r ?i))
    ;         (items_in_room ?room ?i)
    ;     )
    ;     :effect (and
    ;     (robot_has_items ?r ?i)
    ;     (not (items_in_room ?room ?i))
    ;     )
    ; )

    (:action give_items
        :parameters (?r - robot ?p - person ?i - items)
        :precondition (and
            (person_needs_items ?p ?i)
            (robot_has_items ?r ?i)
        )
        :effect (and
        (not (robot_has_items ?r ?i))
        (person_has_items ?p ?i)
        (content_person ?p)
        )
    )

    ; (:action interact
    ;     :parameters (?r - robot ?person - person)
    ;     :precondition ()
    ;     :effect (and 
    ;     (content_person ?person)
    ;     )
    ; )

    (:ethical-features
        ; ( PrivacyBreachment ?room - room )
        ( SafetyBreachment ?person - person ?i - items)
        ; ( SocialNeed ?person - person)
    )

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

; ---------------------------------------------------

    ( :ethical-rank
        :feature
        ( SafetyBreachment Bob medication )
        :type -
        :rank 2
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Bob lighter )
        :type -
        :rank 9
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Bob key )
        :type -
        :rank 7
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Bob knife )
        :type -
        :rank 9
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Bob scissors )
        :type -
        :rank 9
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Bob nuts )
        :type -
        :rank 5
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Bob shirt )
        :type -
        :rank 1
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Bob pants )
        :type -
        :rank 1
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Bob dress )
        :type -
        :rank 2
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Bob extinguisher )
        :type -
        :rank 4
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Bob shrimp )
        :type -
        :rank 5
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Bob bread )
        :type -
        :rank 1
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Bob wine )
        :type -
        :rank 8
    )

; ---------------------------------------------------

    ( :ethical-rank
        :feature
        ( SafetyBreachment Tom medication )
        :type -
        :rank 2
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Tom lighter )
        :type -
        :rank 9
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Tom key )
        :type -
        :rank 7
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Tom knife )
        :type -
        :rank 9
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Tom scissors )
        :type -
        :rank 9
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Tom nuts )
        :type -
        :rank 5
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Tom shirt )
        :type -
        :rank 1
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Tom pants )
        :type -
        :rank 1
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Tom dress )
        :type -
        :rank 2
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Tom extinguisher )
        :type -
        :rank 4
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Tom shrimp )
        :type -
        :rank 5
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Tom bread )
        :type -
        :rank 1
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Tom wine )
        :type -
        :rank 8
    )

; ---------------------------------------------------


    ( :ethical-rank
        :feature
        ( SafetyBreachment Abby medication )
        :type -
        :rank 2
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Abby lighter )
        :type -
        :rank 9
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Abby key )
        :type -
        :rank 7
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Abby knife )
        :type -
        :rank 9
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Abby scissors )
        :type -
        :rank 9
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Abby nuts )
        :type -
        :rank 5
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Abby shirt )
        :type -
        :rank 1
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Abby pants )
        :type -
        :rank 1
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Abby dress )
        :type -
        :rank 2
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Abby extinguisher )
        :type -
        :rank 4
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Abby shrimp )
        :type -
        :rank 5
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Abby bread )
        :type -
        :rank 1
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Abby wine )
        :type -
        :rank 8
    )

    ; ( :ethical-rule safetyPickRule
    ;     :parameters (?r - robot ?person - person ?i - items ?room - room)
    ;     :precondition (and 
    ;     (not (robot_has_items ?r ?i))
    ;     (robot_at_room ?r ?room)
    ;     )
    ;     :activation ( pick_items ( ?r ?i ?room ))
    ;     :features ( SafetyBreachment ?person ?i )
    ; )
    ( :ethical-rule safetyGiveRule
        :parameters (?r - robot ?p - person ?i - items ?room - room)
        :precondition (and 
        (robot_has_items ?r ?i) 
        (robot_at_room ?r ?room)
        )
        :activation ( give_items ( ?r ?p ?i ))
        :features ( SafetyBreachment ?p ?i )
    )

    ; ( :ethical-rule socialRule
    ;     :parameters (?r - robot ?person - person ?i - items)
    ;     :precondition ()
    ;     :activation ( interact ( ?r ?person ))
    ;     :features ( SocialNeed ?person)
    ; )
)
