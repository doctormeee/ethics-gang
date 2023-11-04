(define (problem waypoints-p)
  (:domain waypoints-d)
  (:objects

    ; maindoor_to_corridor corridor_to_maindoor corridor_to_livingroom livingroom_to_corridor - door ; define the doors existing in the initial state

    Bathroom_to_LivingRoom LivingRoom_to_Bathroom Kitchen_to_LivingRoom LivingRoom_to_Kitchen Kitchen_to_Balcony Balcony_to_Kitchen Bedroom_to_Balcony Balcony_to_Bedroom - door
    DiningRoom_to_LivingRoom LivingRoom_to_DiningRoom DiningRoom_to_Balcony Balcony_to_DiningRoom - door

    Balcony Kitchen DiningRoom LivingRoom Bedroom Bathroom - room ; define the rooms existing in the initial state

    wp_Bathroom_to_LivingRoom wp_LivingRoom_to_Bathroom wp_Kitchen_to_LivingRoom wp_LivingRoom_to_Kitchen wp_Kitchen_to_Balcony wp_Balcony_to_Kitchen wp_Bedroom_to_Balcony wp_Balcony_to_Bedroom - waypoint ; corresponds to the "doors"
    wp_Bathroom_from_LivingRoom wp_LivingRoom_from_Bathroom wp_Kitchen_from_LivingRoom wp_LivingRoom_from_Kitchen wp_Kitchen_from_Balcony wp_Balcony_from_Kitchen wp_Bedroom_from_Balcony wp_Balcony_from_Bedroom - waypoint 

    wp_DiningRoom_to_LivingRoom wp_LivingRoom_to_DiningRoom wp_DiningRoom_to_Balcony wp_Balcony_to_DiningRoom - waypoint 
    wp_DiningRoom_from_LivingRoom wp_LivingRoom_from_DiningRoom wp_DiningRoom_from_Balcony wp_Balcony_from_DiningRoom - waypoint 


    wp_Balcony wp_Kitchen wp_DiningRoom wp_LivingRoom wp_Bathroom - waypoint ; corresponds to the "rooms"
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