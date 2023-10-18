(define (problem waypoints-p)
  (:domain waypoints-d)
  (:objects

    ; maindoor_to_corridor corridor_to_maindoor corridor_to_livingroom livingroom_to_corridor - door ; define the doors existing in the initial state

    Bathroom_to_LivingRoom LivingRoom_to_Bathroom Kitchen_to_LivingRoom LivingRoom_to_Kitchen Kitchen_to_Balcony Balcony_to_Kitchen Bedroom_to_Balcony Balcony_to_Bedroom - door
    DiningRoom_to_LivingRoom LivingRoom_to_DiningRoom DiningRoom_to_Balcony Balcony_to_DiningRoom - door

    Balcony Kitchen DiningRoom LivingRoom Bedroom Bathroom - room ; define the rooms existing in the initial state

    wp_BathroomLivingRoomInBathroom wp_BathroomLivingRoomInLivingRoom wp_KitchenLivingRoomInKitchen wp_KitchenLivingRoomInLivingRoom wp_KitchenBalconyInKitchen wp_KitchenBalconyInBalcony wp_BedroomBalconyInBedroom wp_BedroomBalconyInBalcony - waypoint ; corresponds to the "doors"
    wp_DiningRoomLivingRoomInDiningRoom wp_DiningRoomLivingRoomInLivingRoom wp_DiningRoomBalconyInDiningRoom wp_DiningRoomBalconyInBalcony - waypoint 


    wp_Balcony wp_Kitchen wp_DiningRoom wp_LivingRoom wp_Bathroom - waypoint ; corresponds to the "rooms"
  )
  (:init
  ; define intial state

  (door_connected Bathroom_to_LivingRoom Bathroom LivingRoom wp_BathroomLivingRoomInBathroom wp_BathroomLivingRoominLivingRoom)
  (door_connected LivingRoom_to_Bathroom LivingRoom Bathroom wp_BathroomLivingRoominLivingRoom wp_BathroomLivingRoomInBathroom)

  (door_connected Kitchen_to_LivingRoom Kitchen LivingRoom wp_KitchenLivingRoomInKitchen wp_KitchenLivingRoomInLivingRoom)
  (door_connected LivingRoom_to_Kitchen LivingRoom Kitchen wp_KitchenLivingRoomInLivingRoom wp_KitchenLivingRoomInKitchen)

  (door_connected Kitchen_to_Balcony Kitchen Balcony wp_KitchenBalconyInKitchen wp_KitchenBalconyInBalcony)
  (door_connected Balcony_to_Kitchen Balcony Kitchen wp_KitchenBalconyInBalcony wp_KitchenBalconyInKitchen)

  (door_connected DiningRoom_to_LivingRoom DiningRoom LivingRoom wp_DiningRoomLivingRoomInDiningRoom wp_DiningRoomLivingRoomInLivingRoom)
  (door_connected LivingRoom_to_DiningRoom LivingRoom DiningRoom wp_DiningRoomLivingRoomInLivingRoom wp_DiningRoomLivingRoomInDiningRoom)

  (door_connected DiningRoom_to_Balcony DiningRoom Balcony wp_DiningRoomBalconyInDiningRoom wp_DiningRoomBalconyInBalcony)
  (door_connected Balcony_to_DiningRoom Balcony DiningRoom wp_DiningRoomBalconyInBalcony wp_DiningRoomBalconyInDiningRoom)

  (door_connected Bedroom_to_Balcony Bedroom Balcony wp_BedroomBalconyInBedroom wp_BedroomBalconyInBalcony)
  (door_connected Balcony_to_Bedroom Balcony Bedroom wp_BedroomBalconyInBalcony wp_BedroomBalconyInBedroom)


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
  
  (robot_at leia wp_BedroomBalconyInBedroom)
  (robot_at_room leia Bedroom)

  ; (robot_at leia wp_LivingRoom_to_Bathroom)
  ; (robot_at_room leia LivingRoom)


  (waypoint_at wp_BathroomLivingRoomInBathroom Bathroom)
  (waypoint_at wp_BathroomLivingRoomInLivingRoom LivingRoom)

  (waypoint_at wp_KitchenLivingRoomInKitchen Kitchen)
  (waypoint_at wp_KitchenLivingRoomInLivingRoom LivingRoom)
  (waypoint_at wp_KitchenBalconyInKitchen Kitchen)
  (waypoint_at wp_KitchenBalconyInBalcony Balcony)

  (waypoint_at wp_DiningRoomLivingRoomInDiningRoom DiningRoom)
  (waypoint_at wp_DiningRoomLivingRoomInLivingRoom LivingRoom)
  (waypoint_at wp_DiningRoomBalconyInDiningRoom DiningRoom)
  (waypoint_at wp_DiningRoomBalconyInBalcony Balcony)

  (waypoint_at wp_BedroomBalconyInBedroom Bedroom)
  (waypoint_at wp_BedroomBalconyInBalcony Balcony)


  (waypoint_at wp_BathroomLivingRoomInBathroom Bathroom)
  (waypoint_at wp_BathroomLivingRoominLivingRoom LivingRoom)

  (waypoint_at wp_KitchenLivingRoomInKitchen Kitchen)
  (waypoint_at wp_KitchenLivingRoomInLivingRoom LivingRoom)
  (waypoint_at wp_KitchenBalconyInKitchen Kitchen)
  (waypoint_at wp_KitchenBalconyInBalcony Balcony)

  (waypoint_at wp_DiningRoomLivingRoomInDiningRoom DiningRoom)
  (waypoint_at wp_DiningRoomLivingRoomInLivingRoom LivingRoom)
  (waypoint_at wp_DiningRoomBalconyInDiningRoom DiningRoom)
  (waypoint_at wp_DiningRoomBalconyInBalcony Balcony)

  (waypoint_at wp_BedroomBalconyInBedroom Bedroom)
  (waypoint_at wp_BedroomBalconyInBalcony Balcony)



  (waypoint_at wp_Balcony Balcony)
  (waypoint_at wp_Kitchen Kitchen)
  (waypoint_at wp_LivingRoom LivingRoom)
  (waypoint_at wp_Bathroom Bathroom)
  (waypoint_at wp_DiningRoom DiningRoom)

  )
  (:goal (and
      ; goal state
      (robot_at_room leia Bathroom)
      ; (robot_at_room leia LivingRoom)
    )
  )
)