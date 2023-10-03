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
        ( nextX ?D - direction ?X1 - xPos ?X2 - xPos )
        ( nextY ?D - direction ?Y1 - yPos ?Y2 - yPos )
    )

    ( :goal
        (and
        ( updated )
        ( hasPos agent x2 y4 )
        (not ( hasCrashed agent ) ) )
    )
)