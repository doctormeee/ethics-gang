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


        ( hasPosPerson ?P - person ?X1 - xPos ?Y1 - yPos )
        ( hasPosRobot ?R - robot ?X1 - xPos ?Y1 - yPos )
        ( hasDir ?R - robot ?D - direction )
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

    )

    ( :goal
        (and
        ( updated )
        ( hasPos agent x2 y4 )
        (not ( hasCrashed agent ) ) )
    )
)