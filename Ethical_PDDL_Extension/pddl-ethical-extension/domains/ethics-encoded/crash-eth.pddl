(define (problem crash-eth)
    (:domain crash-d-eth)
     ( :objects
        ; two cars in total
        c1 c2 - car
        ; the floorplan is as drawn below
        ;               (forward/backward)
        ; x1y4 x2y4     |
        ; x1y3 x2y3     |
        ; x1y2 x2y2     |    
        ; x1y1 x2y1     |_ _ (left/right)
        x1 x2 - xPos
        y1 y2 y3 y4 - yPos
    )
    ( :init
        ( updated )

        ( hasPos agent x1 y1 )
        ( hasPos c1 x2 y1 )
        ( hasPos c2 x2 y3 )

        ( hasDir agent straight )
        ( hasDir c1 straight )

        ( nextX straight x1 x1 )
        ( nextX straight x2 x2 )
        ( nextX right x1 x2 )
        ( nextX right x2 x2 )
        ( nextX left x1 x1 )
        ( nextX left x2 x1 )

        ( nextY y1 y2 )
        ( nextY y2 y3 )
        ( nextY y3 y4 )


        ( nextY y4 y4 )
    )

    ( :goal
        (and
        ( updated )
        ( hasPos agent x2 y4 )
        (not ( hasCrashed agent ) ) )
    )
)