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
)