(define (problem waypoints-p-eth)
  (:domain waypoints-d-eth)
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


  ; -----------------------------------------------------------------------------------------------
    Ben Mohammed Emma Sophia Mark - person

    medication lighter key knife scissors nuts shirt pants dress extinguisher shrimp bread wine glasses ben_journal soap emma_photos radio ben_records mohammed_records emma_records cigarette - things


  )
  (:init
  ; define intial state

  (robot_has_things leia medication)
  (robot_has_things leia lighter)
  (robot_has_things leia key)
  (robot_has_things leia knife)
  (robot_has_things leia scissors)
  (robot_has_things leia nuts)
  (robot_has_things leia shirt)
  (robot_has_things leia pants)

  (robot_has_things leia dress)
  (robot_has_things leia extinguisher)
  (robot_has_things leia shrimp)
  (robot_has_things leia bread)
  (robot_has_things leia wine)
  (robot_has_things leia glasses)
  (robot_has_things leia ben_journal)
  (robot_has_things leia soap)
  (robot_has_things leia emma_photos)
  (robot_has_things leia radio)
  (robot_has_things leia ben_records)
  (robot_has_things leia mohammed_records)
  (robot_has_things leia emma_records)
  (robot_has_things leia cigarette)

  (person_needs_things Ben knife)
  (person_needs_things Ben scissors)

  (person_needs_things Mohammed knife)
  (person_needs_things Mohammed scissors)

  (person_needs_things Emma knife)
  (person_needs_things Emma scissors)

  ; (not (sick_resident Ben))
  ; (not (sick_resident Mohammed))
  ; (not (sick_resident Emma))

  ; (not (needs_medication Ben medication))
  ; (not (needs_medication Mohammed medication))
  ; (not (needs_medication Emma medication))

  ; (not (hungry_resident Ben))
  ; (not (hungry_resident Mohammed))
  ; (not (hungry_resident Emma))

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
  (robot_has_things leia knife)

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
      ; (robot_at_room leia Bathroom)
      (content_person Ben)
      (content_person Mohammed)
      (content_person Emma)
      ; (robot_at_room leia LivingRoom)
    )
  )
)