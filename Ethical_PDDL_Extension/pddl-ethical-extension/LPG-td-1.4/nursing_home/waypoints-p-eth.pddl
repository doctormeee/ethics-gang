(define (problem waypoints-p-eth)
  (:domain waypoints-d-eth)
  (:objects
    ; --------------------------------------------------------------------------------
    ; Rooms...
    StaffRoom SharedReceptionSpace - room
    Room1 Room2 Room3 Room4 Room5 - room 
    Room6 Room7 Room8 Room9 Room10 - room 
    Corridor1 LivingSpace Corridor2 - room 
    DiningRoom Kitchen - room
    ; --------------------------------------------------------------------------------

    ; --------------------------------------------------------------------------------
    ; Doors....
    StaffRoom_to_SharedReceptionSpace SharedReceptionSpace_to_StaffRoom - door
    SharedReceptionSpace_to_Corridor1 Corridor1_to_SharedReceptionSpace - door
    Corridor1_to_LivingSpace LivingSpace_to_Corridor1 - door
    Corridor2_to_LivingSpace LivingSpace_to_Corridor2 - door

    Room1_to_Corridor1 Corridor1_to_Room1 - door
    Room2_to_Corridor1 Corridor1_to_Room2 - door
    Room7_to_Corridor1 Corridor1_to_Room7 - door
    Room8_to_Corridor1 Corridor1_to_Room8 - door

    Room3_to_LivingSpace LivingSpace_to_Room3 - door
    Room4_to_LivingSpace LivingSpace_to_Room4 - door

    Room5_to_Corridor2 Corridor2_to_Room5 - door
    Room6_to_Corridor2 Corridor2_to_Room6 - door
    Room9_to_Corridor2 Corridor2_to_Room9 - door
    Room10_to_Corridor2 Corridor2_to_Room10 - door

    Corridor2_to_DiningRoom DiningRoom_to_Corridor2 - door
    Kitchen_to_DiningRoom DiningRoom_to_Kitchen - door
    ; --------------------------------------------------------------------------------


    ; --------------------------------------------------------------------------------
    ; Waypoints.... (to)
    wp_StaffRoom_to_SharedReceptionSpace wp_SharedReceptionSpace_to_StaffRoom - waypoint
    wp_SharedReceptionSpace_to_Corridor1 wp_Corridor1_to_SharedReceptionSpace - waypoint
    wp_Corridor1_to_LivingSpace wp_LivingSpace_to_Corridor1 - waypoint
    wp_Corridor2_to_LivingSpace wp_LivingSpace_to_Corridor2 - waypoint

    wp_Room1_to_Corridor1 wp_Corridor1_to_Room1 - waypoint
    wp_Room2_to_Corridor1 wp_Corridor1_to_Room2 - waypoint
    wp_Room7_to_Corridor1 wp_Corridor1_to_Room7 - waypoint
    wp_Room8_to_Corridor1 wp_Corridor1_to_Room8 - waypoint

    wp_Room3_to_LivingSpace wp_LivingSpace_to_Room3 - waypoint
    wp_Room4_to_LivingSpace wp_LivingSpace_to_Room4 - waypoint

    wp_Room5_to_Corridor2 Cwp_orridor2_to_Room5 - waypoint
    wp_Room6_to_Corridor2 wp_Corridor2_to_Room6 - waypoint
    wp_Room9_to_Corridor2 wp_Corridor2_to_Room9 - waypoint
    wp_Room10_to_Corridor2 wp_Corridor2_to_Room10 - waypoint

    wp_Corridor2_to_DiningRoom wp_DiningRoom_to_Corridor2 - waypoint
    wp_Kitchen_to_DiningRoom wp_DiningRoom_to_Kitchen - waypoint
    ; --------------------------------------------------------------------------------


    ; --------------------------------------------------------------------------------
    ; Waypoints.... (from)
    wp_StaffRoom_from_SharedReceptionSpace wp_SharedReceptionSpace_from_StaffRoom - waypoint
    wp_SharedReceptionSpace_from_Corridor1 wp_Corridor1_from_SharedReceptionSpace - waypoint
    wp_Corridor1_from_LivingSpace wp_LivingSpace_from_Corridor1 - waypoint
    wp_Corridor2_from_LivingSpace wp_LivingSpace_from_Corridor2 - waypoint

    wp_Room1_from_Corridor1 wp_Corridor1_from_Room1 - waypoint
    wp_Room2_from_Corridor1 wp_Corridor1_from_Room2 - waypoint
    wp_Room7_from_Corridor1 wp_Corridor1_from_Room7 - waypoint
    wp_Room8_from_Corridor1 wp_Corridor1_from_Room8 - waypoint

    wp_Room3_from_LivingSpace wp_LivingSpace_from_Room3 - waypoint
    wp_Room4_from_LivingSpace wp_LivingSpace_from_Room4 - waypoint

    wp_Room5_from_Corridor2 Cwp_orridor2_from_Room5 - waypoint
    wp_Room6_from_Corridor2 wp_Corridor2_from_Room6 - waypoint
    wp_Room9_from_Corridor2 wp_Corridor2_from_Room9 - waypoint
    wp_Room10_from_Corridor2 wp_Corridor2_from_Room10 - waypoint

    wp_Corridor2_from_DiningRoom wp_DiningRoom_from_Corridor2 - waypoint
    wp_Kitchen_from_DiningRoom wp_DiningRoom_from_Kitchen - waypoint
    ; --------------------------------------------------------------------------------

    ; wp_Balcony wp_Kitchen wp_DiningRoom wp_LivingRoom wp_Bathroom - waypoint 
  )
  (:init
  ; define intial state

  (door_connected Bathroom_to_LivingRoom Bathroom LivingRoom wp_Bathroom_to_LivingRoom wp_LivingRoom_from_Bathroom)
  (door_connected LivingRoom_to_Bathroom LivingRoom Bathroom wp_LivingRoom_to_Bathroom wp_Bathroom_from_LivingRoom)

  (door_connected Kitchen_to_LivingRoom Kitchen LivingRoom wp_Kitchen_to_LivingRoom wp_LivingRoom_from_Kitchen)
  (door_connected LivingRoom_to_Kitchen LivingRoom Kitchen wp_LivingRoom_to_Kitchen wp_Kitchen_from_LivingRoom)

  (door_connected Kitchen_to_Balcony Kitchen Balcony wp_Kitchen_to_Balcony wp_Balcony_from_Kitchen)
  (door_connected Balcony_to_Kitchen Balcony Kitchen wp_Balcony_to_Kitchen wp_Kitchen_from_Balcony)

  (door_connected DiningRoom_to_LivingRoom DiningRoom LivingRoom wp_DiningRoom_to_LivingRoom wp_LivingRoom_from_DiningRoom)
  (door_connected LivingRoom_to_DiningRoom LivingRoom DiningRoom wp_LivingRoom_to_DiningRoom wp_DiningRoom_from_LivingRoom)

  (door_connected DiningRoom_to_Balcony DiningRoom Balcony wp_DiningRoom_to_Balcony wp_Balcony_from_DiningRoom)
  (door_connected Balcony_to_DiningRoom Balcony DiningRoom wp_Balcony_to_DiningRoom wp_DiningRoom_from_Balcony)

  (door_connected Bedroom_to_Balcony Bedroom Balcony wp_Bedroom_to_Balcony wp_Balcony_from_Bedroom)
  (door_connected Balcony_to_Bedroom Balcony Bedroom wp_Balcony_to_Bedroom wp_Bedroom_from_Balcony)


  (door_opened Bathroom_to_LivingRoom)
  (door_opened LivingRoom_to_Bathroom)

  (door_opened Kitchen_to_LivingRoom)
  (door_opened LivingRoom_to_Kitchen)
  (door_opened Kitchen_to_Balcony)
  (door_opened Balcony_to_Kitchen)

  (door_opened DiningRoom_to_LivingRoom)
  (door_opened LivingRoom_to_DiningRoom)
  (door_opened DiningRoom_to_Balcony)
  (door_opened Balcony_to_DiningRoom)

  (door_opened Bedroom_to_Balcony)
  (door_opened Balcony_to_Bedroom)
  
  (robot_at leia wp_Bedroom_to_Balcony)
  (robot_at_room leia Bedroom)

  ; (robot_at leia wp_LivingRoom_to_Bathroom)
  ; (robot_at_room leia LivingRoom)


  (waypoint_at wp_Bathroom_to_LivingRoom Bathroom)
  (waypoint_at wp_LivingRoom_to_Bathroom LivingRoom)

  (waypoint_at wp_Kitchen_to_LivingRoom Kitchen)
  (waypoint_at wp_LivingRoom_to_Kitchen LivingRoom)
  (waypoint_at wp_Kitchen_to_Balcony Kitchen)
  (waypoint_at wp_Balcony_to_Kitchen Balcony)

  (waypoint_at wp_DiningRoom_to_LivingRoom DiningRoom)
  (waypoint_at wp_LivingRoom_to_DiningRoom LivingRoom)
  (waypoint_at wp_DiningRoom_to_Balcony DiningRoom)
  (waypoint_at wp_Balcony_to_DiningRoom Balcony)

  (waypoint_at wp_Bedroom_to_Balcony Bedroom)
  (waypoint_at wp_Balcony_to_Bedroom Balcony)


  (waypoint_at wp_Bathroom_from_LivingRoom Bathroom)
  (waypoint_at wp_LivingRoom_from_Bathroom LivingRoom)

  (waypoint_at wp_Kitchen_from_LivingRoom Kitchen)
  (waypoint_at wp_LivingRoom_from_Kitchen LivingRoom)
  (waypoint_at wp_Kitchen_from_Balcony Kitchen)
  (waypoint_at wp_Balcony_from_Kitchen Balcony)

  (waypoint_at wp_DiningRoom_from_LivingRoom DiningRoom)
  (waypoint_at wp_LivingRoom_from_DiningRoom LivingRoom)
  (waypoint_at wp_DiningRoom_from_Balcony DiningRoom)
  (waypoint_at wp_Balcony_from_DiningRoom Balcony)

  (waypoint_at wp_Bedroom_from_Balcony Bedroom)
  (waypoint_at wp_Balcony_from_Bedroom Balcony)



  ; (waypoint_at wp_Balcony Balcony)
  ; (waypoint_at wp_Kitchen Kitchen)
  ; (waypoint_at wp_LivingRoom LivingRoom)
  ; (waypoint_at wp_Bathroom Bathroom)
  ; (waypoint_at wp_DiningRoom DiningRoom)

  )
  (:goal (and
      ; goal state
      (robot_at_room leia Bathroom)
      ; (robot_at_room leia LivingRoom)
    )
  )
)
