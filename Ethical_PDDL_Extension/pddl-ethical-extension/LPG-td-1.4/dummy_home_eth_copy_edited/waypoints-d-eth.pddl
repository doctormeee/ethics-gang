(define (domain waypoints-d-eth)
    ; ( :requirements :strips :typing :fluents) ; :equality :negative-preconditions :conditional-effects); :ethical)

    ; (:requirements :strips :fluents :typing) ;:durative-actions :timed-initial-literals :typing :negative-preconditions :duration-inequalities)
    ; (:requirements :strips :fluents :durative-actions :timed-initial-literals :typing :negative-preconditions :duration-inequalities :ethical)
    ; (:requirements :strips :typing :negative-preconditions :ethical)
    ( :requirements :strips :typing :equality :negative-preconditions :conditional-effects :ethical)

    ( :types
        waypoint door room robot person things - object
    )

    ( :constants
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

        ; define whether a robot is holding an things
        (robot_has_things ?r - robot ?t - things)

        ; define the current wellbeing of the person
        (content_person ?p - person)

        (person_needs_things ?p - person ?t - things)
        ; define if 
        (person_has_things ?p - person ?t - things)

        ; define whether an things is in a room
        ; (things_in_room ?t - things ?r - room)

        ; define if resident is sick
        ; (sick_resident ?p - person)

        ; define if resident has taken medication a prescribed number of hours ago, but still needs it
        ; (needs_medication ?p - person ?t - things)

        ; define if resident is hungry
        ; (hungry_resident ?p - person)

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

    ; (:action pick_things
    ;     :parameters (?r - robot ?t - things ?room - room)
    ;     :precondition (and
    ;         (not (robot_has_things ?r ?t))
    ;         (things_in_room ?room ?t)
    ;     )
    ;     :effect (and
    ;     (robot_has_things ?r ?t)
    ;     (not (things_in_room ?room ?t))
    ;     )
    ; )

    (:action give_things
        :parameters (?r - robot ?p - person ?t - things)
        :precondition (and
            (person_needs_things ?p ?t)
            (robot_has_things ?r ?t)
        )
        :effect (and
        (not (robot_has_things ?r ?t))
        (person_has_things ?p ?t)
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

    ; (:action provide_medication
    ;     :parameters (?r - robot ?person - person ?t - things)
    ;     :precondition ( and 
    ;                    (sick_resident ?person)
    ;                    (needs_medication ?person ?t) )
    ;     :effect (not (needs_medication ?person ?t)
    ;     )
    ; )

    ; (:action provide_food
    ;     :parameters (?r - robot ?person - person ?t - things)
    ;     :precondition (hungry_resident ?person)
    ;     :effect (not (hungry_resident ?person)
    ;     )
    ; )


    (:ethical-features
        ; ( PrivacyBreachment ?room - room )
        ( SafetyBreachment ?person - person ?t - things)
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
        ( SafetyBreachment Ben medication )
        :type -
        :rank 2
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Ben lighter )
        :type -
        :rank 9
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Ben key )
        :type -
        :rank 7
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Ben knife )
        :type -
        :rank 9
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Ben scissors )
        :type -
        :rank 9
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Ben nuts )
        :type -
        :rank 7
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Ben shirt )
        :type -
        :rank 1
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Ben pants )
        :type -
        :rank 1
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Ben dress )
        :type -
        :rank 2
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Ben extinguisher )
        :type -
        :rank 5
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Ben shrimp )
        :type -
        :rank 3
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Ben bread )
        :type -
        :rank 1
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Ben wine )
        :type -
        :rank 8
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Ben glasses )
        :type -
        :rank 3
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Ben ben_journal )
        :type -
        :rank 1
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Ben soap )
        :type -
        :rank 3
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Ben emma_photos )
        :type -
        :rank 3
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Ben radio )
        :type -
        :rank 8
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Ben ben_records )
        :type -
        :rank 2
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Ben mohammed_records )
        :type -
        :rank 7
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Ben emma_records )
        :type -
        :rank 7
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Ben cigarette )
        :type -
        :rank 8
    )

; ---------------------------------------------------

    ( :ethical-rank
        :feature
        ( SafetyBreachment Mohammed medication )
        :type -
        :rank 7
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Mohammed lighter )
        :type -
        :rank 9
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Mohammed key )
        :type -
        :rank 7
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Mohammed knife )
        :type -
        :rank 9
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Mohammed scissors )
        :type -
        :rank 9
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Mohammed nuts )
        :type -
        :rank 2
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Mohammed shirt )
        :type -
        :rank 1
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Mohammed pants )
        :type -
        :rank 1
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Mohammed dress )
        :type -
        :rank 2
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Mohammed extinguisher )
        :type -
        :rank 4
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Mohammed shrimp )
        :type -
        :rank 7
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Mohammed bread )
        :type -
        :rank 1
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Mohammed wine )
        :type -
        :rank 8
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Mohammed glasses )
        :type -
        :rank 3
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Mohammed ben_journal )
        :type -
        :rank 6
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Mohammed soap )
        :type -
        :rank 3
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Mohammed emma_photos )
        :type -
        :rank 7
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Mohammed radio )
        :type -
        :rank 8
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Mohammed ben_records )
        :type -
        :rank 7
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Mohammed mohammed_records )
        :type -
        :rank 7
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Mohammed emma_records )
        :type -
        :rank 7
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Mohammed cigarette )
        :type -
        :rank 8
    )

; ---------------------------------------------------


    ( :ethical-rank
        :feature
        ( SafetyBreachment Emma medication )
        :type -
        :rank 4
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Emma lighter )
        :type -
        :rank 9
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Emma key )
        :type -
        :rank 7
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Emma knife )
        :type -
        :rank 9
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Emma scissors )
        :type -
        :rank 9
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Emma nuts )
        :type -
        :rank 2
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Emma shirt )
        :type -
        :rank 1
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Emma pants )
        :type -
        :rank 1
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Emma dress )
        :type -
        :rank 2
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Emma extinguisher )
        :type -
        :rank 4
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Emma shrimp )
        :type -
        :rank 5
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Emma bread )
        :type -
        :rank 1
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Emma wine )
        :type -
        :rank 8
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Emma glasses )
        :type -
        :rank 1
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Emma ben_journal )
        :type -
        :rank 5
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Emma soap )
        :type -
        :rank 3
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Emma emma_photos )
        :type -
        :rank 1
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Emma radio )
        :type -
        :rank 8
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Emma ben_records )
        :type -
        :rank 7
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Emma mohammed_records )
        :type -
        :rank 7
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Emma emma_records )
        :type -
        :rank 1
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Emma cigarette )
        :type -
        :rank 8
    )

    ; ---------------------------------------------------

    ( :ethical-rank
        :feature
        ( SafetyBreachment Sophia medication )
        :type -
        :rank 2
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Sophia lighter )
        :type -
        :rank 8
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Sophia key )
        :type -
        :rank 2
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Sophia knife )
        :type -
        :rank 6
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Sophia scissors )
        :type -
        :rank 6
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Sophia nuts )
        :type -
        :rank 1
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Sophia shirt )
        :type -
        :rank 2
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Sophia pants )
        :type -
        :rank 2
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Sophia dress )
        :type -
        :rank 2
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Sophia extinguisher )
        :type -
        :rank 2
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Sophia shrimp )
        :type -
        :rank 1
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Sophia bread )
        :type -
        :rank 1
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Sophia wine )
        :type -
        :rank 4
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Sophia glasses )
        :type -
        :rank 2
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Sophia ben_journal )
        :type -
        :rank 7
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Sophia soap )
        :type -
        :rank 3
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Sophia emma_photos )
        :type -
        :rank 7
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Sophia radio )
        :type -
        :rank 2
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Sophia ben_records )
        :type -
        :rank 3
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Sophia mohammed_records )
        :type -
        :rank 3
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Sophia emma_records )
        :type -
        :rank 3
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Sophia cigarette )
        :type -
        :rank 8
    )

  ; ---------------------------------------------------

    ( :ethical-rank
        :feature
        ( SafetyBreachment Mark medication )
        :type -
        :rank 7
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Mark lighter )
        :type -
        :rank 9
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Mark key )
        :type -
        :rank 9
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Mark knife )
        :type -
        :rank 9
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Mark scissors )
        :type -
        :rank 9
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Mark nuts )
        :type -
        :rank 2
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Mark shirt )
        :type -
        :rank 1
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Mark pants )
        :type -
        :rank 1
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Mark dress )
        :type -
        :rank 2
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Mark extinguisher )
        :type -
        :rank 4
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Mark shrimp )
        :type -
        :rank 7
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Mark bread )
        :type -
        :rank 1
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Mark wine )
        :type -
        :rank 5
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Mark glasses )
        :type -
        :rank 2
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Mark ben_journal )
        :type -
        :rank 5
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Mark soap )
        :type -
        :rank 5
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Mark emma_photos )
        :type -
        :rank 3
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Mark radio )
        :type -
        :rank 8
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Mark ben_records )
        :type -
        :rank 3
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Mark mohammed_records )
        :type -
        :rank 7
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Mark emma_records )
        :type -
        :rank 3
    )
    ( :ethical-rank
        :feature
        ( SafetyBreachment Mark cigarette )
        :type -
        :rank 7
    )

; ---------------------------------------------------

    ; ( :ethical-rule safetyPickRule
    ;     :parameters (?r - robot ?person - person ?t - things ?room - room)
    ;     :precondition (and 
    ;     (not (robot_has_things ?r ?t))
    ;     (robot_at_room ?r ?room)
    ;     )
    ;     :activation ( pick_things ( ?r ?t ?room ))
    ;     :features ( SafetyBreachment ?person ?t )
    ; )
    
    ( :ethical-rule safetyGiveRule
        :parameters (?r - robot ?p - person ?t - things ?room - room)
        :precondition (and 
        (robot_has_things ?r ?t) 
        (robot_at_room ?r ?room)
        )
        :activation ( give_things ( ?r ?p ?t ))
        :features ( SafetyBreachment ?p ?t )
    )

    ; ( :ethical-rule socialRule
    ;     :parameters (?r - robot ?person - person ?t - things)
    ;     :precondition ()
    ;     :activation ( interact ( ?r ?person ))
    ;     :features ( SocialNeed ?person)
    ; )
)
