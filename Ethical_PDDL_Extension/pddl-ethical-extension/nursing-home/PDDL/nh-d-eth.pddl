(define (domain nh-d-eth)
    ( :requirements :strips :typing :equality :negative-preconditions :conditional-effects :ethical)

    ( :types
        robot direction person item flavour xPos yPos - object
    )

    ( :constants
        agent - robot
        left right forward backward - direction
    )

    ( :predicates
        ( hasPosPerson ?P - person ?X1 - xPos ?Y1 - yPos )
        ( hasPosRobot ?R - robot ?X1 - xPos ?Y1 - yPos )
        ( hasDir ?R - robot ?D - direction )
        ( hasHeartProblem ?P1 - person )
        ( hasDiabetes ?P1 - person )
        ( hasHighBloodPressure ?P1 - person )

        ( isNotChef ?P1 - person )
        ( isResident ?P1 - person )

        ; robot moving directions and resulting positions
        ( nextX ?D - direction ?X1 - xPos ?X2 - xPos )
        ( nextY ?D - direction ?Y1 - yPos ?Y2 - yPos )

        ( updated )

    )

    ; direction change of the robot
    ( :action setDir
        :parameters (?D1 - direction )
        :precondition ( updated )
        :effect (and
        (not ( hasDir agent left ) )
        (not ( hasDir agent right ) )
        (not ( hasDir agent forward ) )
        (not ( hasDir agent backward ) )
        ( hasDir agent ?D1 ) )
    )

    ; stop the robot
    ( :action setStop
        :parameters ()
        :precondition ( updated )
        :effect (and
        (not ( hasDir agent left ) )
        (not ( hasDir agent right ) )
        (not ( hasDir agent forward ) )
        (not ( hasDir agent backward ) ) )
    )

    ; yet to be modified, needs all the actions... not sure what this action means actually
    ; it;s seems it's checking whether the robot has position change or if there is any state change in the 
    ; scenario
    ;  YES IT'S ACTUALLY UPDATING THE STATE OF CARS IN THAT SCENARIO, NEED TO FIGURE OUT WHAT OUR STATES ARE LIKE
    ( :action update
        :parameters ()
        :precondition (not ( updated ) )
        :effect (and
        ( updated )
            ( forall
                (?C1 - car ?C2 - car ?Y1 - yPos ?X1 - xPos )
                ( when
                (and
                (not (= ?C1 ?C2 ) )
                (not (= ?C1 agent ) )
                (not (= ?C2 agent ) )
                (not ( hasCrashed ?C1 ) )
                ( hasPos ?C1 ?X1 ?Y1 )
                ( hasPos ?C2 ?X1 ?Y1 ) )
                (and
                ( hasCrashed ?C1 )
                ( hasCrashed ?C2 )
                ) ) )
            ( forall
                (?C1 - car ?Y1 - yPos ?X1 - xPos )
                ( when
                (and
                (not (= ?C1 agent ) )
                ( hasPos agent ?X1 ?Y1 )
                ( hasPos ?C1 ?X1 ?Y1 ) )
                (and
                ( hasBumped agent )
                ( hasBumped ?C1 )


                (not ( hasDir ?C1 left ) )
                (not ( hasDir ?C1 straight ) )
                (not ( hasDir ?C1 right ) )
        ) ) ) )
    )

    ; robot moves to a particular position following the directio set
    ( :action go
        :parameters ()
        :precondition ( updated )
        :effect (and
        (not ( updated ) )
        ( forall
            ; Y1, X1 current Y and X position; Y2, X2 next Y and X position after moving towards direction D1
            (?R1 - robot ?D1 - direction ?Y1 - yPos ?Y2 - yPos ?X1 - xPos ?X2 - xPos )
            ( when
            (and
                ( hasPos ?C1 ?X1 ?Y1 )
                ( hasDir ?C1 ?D1 )
                ( nextX ?D1 ?X1 ?X2 )
                ( nextY ?Y1 ?Y2 ) )
            (and
                (not ( hasPos ?C1 ?X1 ?Y1 ) )
                ( hasPos ?C1 ?X2 ?Y2 ) ) ) )
            )
        )

    (:ethical-features
        ( danger ?P1 - person ?I1 - item )
        ( food ?P1 - person ?F1 - flavour)
        ( responsibleAgent )
    )
        

    (:ethical-rank
        :feature
        ( danger agent key)
        type -
        rank 1
    )
    
    (:ethical-rank
        :feature
        ( food p1 oily)
        type -
        rank 3
    )
    (:ethical-rank
        :feature
        ( food p1 sweet)
        type -
        rank 3
    )
    (:ethical-rank
        :feature
        ( food p1 salty)
        type -
        rank 3
    )
    (:ethical-rank
        :feature
        ( danger p1 knives)
        :type -
        :rank 10
    )
    (:ethical-rank
        :feature
        ( danger p1 alcohol)
        :type -
        :rank 7
    )
    (:ethical-rank
        :feature
        ( danger p1 lighter)
        :type -
        :rank 8
    )
    (:ethical-rank
        :feature
        ( danger p1 keys)
        :type -
        :rank 4
    )
    (:ethical-rank
        :feature
        ( danger p1 cigarettes)
        :type -
        :rank 9
    )
    (:ethical-rank
        :feature
        ( danger p1 medication)
        :type -
        :rank 1
    )
    (:ethical-rank
        :feature
        ( danger p2 medication)
        :type -
        :rank 9
    )
    (:ethical-rank
        :feature
        ( damageRail c2 )
        type -
        rank 1
    )
    (:ethical-rank
        :feature
        ( danger agent low )
        type -
        rank 2
    )
    (:ethical-rank
        :feature
        ( danger c1 low )
        type -
        rank 2
    )
    (:ethical-rank
        :feature
        ( danger c2 low )
        type -
        rank 2
    )
    (:ethical-rank
        :feature
        ( danger agent high )
        type -
        rank 4
    )
    (:ethical-rank
        :feature
        ( danger c1 high )
        type -
        rank 3


    )
    (:ethical-rank
        :feature
        ( danger c2 high )
        type -
        rank 3
    )
    (:ethical-rank
        :feature
        ( responsibleAgent )
        type -
        rank 4
    ) 

    ( :ethical-rule allergicRule
        :parameters (?F1 - flavour)
        :precondition ( )
        :activation null
        :features ( danger ?C1 high )
    )
    ( :ethical-rule sweetRule
        :parameters (?F1 - flavour)
        :precondition ( )
        :activation null
        :features ( danger ?C1 low )
    )
    ( :ethical-rule saltyRule
        :parameters (?F1 - flavour)
        :precondition ( )
        :activation null
        :features ( danger ?C1 low )
    )

    ; ?F1 - flavour may not be required?
    ( :ethical-rule rejectOilyFoodRule
        :parameters ( ?P1 - person ?F1 - flavour)
        :precondition ( ( hasHeartProblem ?P1 ) )
        :activation null
        :features ( food p1 oily )
    )
    ( :ethical-rule rejectSweetFoodRule
        :parameters ( ?P1 - person ?F1 - flavour)
        :precondition ( ( hasDiabetes ?P1 ) )
        :activation null
        :features ( food p1 sweet)
    )
    ( :ethical-rule rejectSaltyFoodRule
        :parameters ( ?P1 - person ?F1 - flavour)
        :precondition ( ( hasHighBloodPressure ?P1 ) )
        :activation null
        :features ( food p1 salty )
    )
    ( :ethical-rule rejectOilyFoodRule
        :parameters ( ?P1 - person ?F1 - flavour)
        :precondition ( ( hasHeartProblem ?P1 ) )
        :activation null
        :features ( food p1 oily )
    )
    ( :ethical-rule rejectKnifeRule
        :parameters ( ?P1 - person ?I1 - item)
        :precondition ( ( isNotChef ?P1 ) )
        :activation null
        :features ( food p1 oily )
    )
    ( :ethical-rule rejectKeyRule
        :parameters ( ?P1 - person ?I1 - item)
        :precondition ( ( isResident ?P1 ) )
        :activation null
        :features ( danger p1 key )
    )
    ( :ethical-rule rejectCigaretteRule
        :parameters ( ?P1 - person ?I1 - item)
        :precondition ( )
        :activation null
        :features ( danger p1 cigarettes)
    )
    ( :ethical-rule rejectMedicationRule
        :parameters ( ?P1 - person ?I1 - item)
        :precondition ( ( isPerson ?P2 ) )
        :activation null
        :features ( danger p1 medications )
    )
    ( :ethical-rule rejectLighterRule
        :parameters ( ?P1 - person ?I1 - item)
        :precondition ( ( isNotChef ?P1 ) )
        :activation null
        :features ( danger p1 lighter )
    )
    ( :ethical-rule rejectAlcoholRule
        :parameters ( ?P1 - person ?I1 - item)
        :precondition ( ( ) )
        :activation null
        :features ( danger p1 alcohol )
    )
 )
