(define (domain nursing-home)
    (:objects 
        ; Rooms
        room1 room2 
        private-bathroom1 private-bathroom2 
        corridor-block1 corridor-block2 corridor-block3 corridor-block4 corridor-block5 corridor-block6
        reception-security
        nurse-main-station
        laundry
        common-toilet
        medical-area
        board-game-room
        living-area
        dining
        kitchen

        ; Items
        medication 
        clothing 
        journal-ben journal-emma journal-mohammed ; Assumed all residents have a journal each
        wallet-ben wallet-emma wallet-mohammed wallet-sophia wallet-mark ; Assumed all described personas have a wallet each
        medical-record-ben medical-record-emma medical-record-mohammed 
        photo-album
        pharmacy-key
        toiletry ; wondering if this should be communal or resident-separated
        phone-ben phone-emma phone-mohammed phone-sophia phone-mark
        radio
        knife ; should add other weapons
        lighter
        alcohol
        peanuts shrimp food sweets ; elaboration needed
        fire-extinguisher
        
        ; People
        ; Staff nurses
        sophia

        ; Residents
        ben emma mohammed

        ; Non-residents (guests/family members/friends/volunteers)
        mark

        ; Cleaners
        ; Security staff

        ; Robot grippers
        gripper-left gripper-right
    )

    (:predicates 
        (ROOM ?x) (CONNECTED ?x ?y)
        (PERSON ?x) (ITEM ?x) 
        (HUNGRY ?x) (INJURED ?x) (SICK ?x) (NEEDS-MEDICATION ?x)
        (GRIPPER ?x) (ROBOT-AT-ROOM ?x) (CARRY ?x ?y)
        (ITEM-AT-ROOM ?x ?y)
    )

    (:init 
        ; Rooms
        (ROOM room1) (ROOM room2) 
        (ROOM private-bathroom1) (ROOM private-bathroom2) 
        (ROOM corridor-block1) (ROOM corridor-block2) (ROOM corridor-block3) (ROOM corridor-block4) (ROOM corridor-block5) (ROOM corridor-block6) 
        (ROOM reception-security)
        (ROOM nurse-main-station)
        (ROOM laundry)
        (ROOM common-toilet)
        (ROOM medical-area)
        (ROOM board-game-room)
        (ROOM living-area)
        (ROOM dining)
        (ROOM kitchen)

        ; Floor plan
        (CONNECTED private-bathroom1 room1) ; (CONNECTED room1 private-bathroom1)?
        (CONNECTED room1 corridor-block3)
        (CONNECTED corridor-block3 room2)
        (CONNECTED room2 private-bathroom2)
        (CONNECTED corridor-block3 corridor-block2)
        (CONNECTED corridor-block2 nurse-main-station)
        (CONNECTED nurse-main-station corridor-block1)
        (CONNECTED corridor-block1 reception-security)
        (CONNECTED nurse-main-station corridor-block4)
        (CONNECTED corridor-block4 laundry)
        (CONNECTED nurse-main-station corridor-block5)
        (CONNECTED corridor-block5 medical-area)
        (CONNECTED corridor-block5 corridor-block6)
        (CONNECTED corridor-block6 dining)
        (CONNECTED dining kitchen)
        (CONNECTED corridor-block6 living-area)
        (CONNECTED living-area common-toilet)
        (CONNECTED living-area board-game-room)

        ; People
        (PERSON sophia)
        (PERSON ben) (PERSON emma) (PERSON mohammed)
        (PERSON mark)
    )
)