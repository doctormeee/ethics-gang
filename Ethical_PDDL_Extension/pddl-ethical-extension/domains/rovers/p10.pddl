(define (problem grounded-STRIPS-ROVERPROB8271)
(:domain grounded-STRIPS-ROVER)
(:init
(EMPTY-ROVER3STORE)
(AVAILABLE-ROVER3)
(AT-ROVER3-WAYPOINT1)
(EMPTY-ROVER2STORE)
(AVAILABLE-ROVER2)
(AT-ROVER2-WAYPOINT3)
(EMPTY-ROVER1STORE)
(AVAILABLE-ROVER1)
(AT-ROVER1-WAYPOINT0)
(EMPTY-ROVER0STORE)
(AVAILABLE-ROVER0)
(AT-ROVER0-WAYPOINT4)
(CHANNEL_FREE-GENERAL)
(AT_ROCK_SAMPLE-WAYPOINT6)
(AT_SOIL_SAMPLE-WAYPOINT6)
(AT_ROCK_SAMPLE-WAYPOINT4)
(AT_SOIL_SAMPLE-WAYPOINT4)
(AT_ROCK_SAMPLE-WAYPOINT3)
(AT_SOIL_SAMPLE-WAYPOINT3)
(AT_ROCK_SAMPLE-WAYPOINT1)
(AT_ROCK_SAMPLE-WAYPOINT0)
(AT_SOIL_SAMPLE-WAYPOINT0)
)
(:goal
(and
(COMMUNICATED_IMAGE_DATA-OBJECTIVE3-LOW_RES)
(COMMUNICATED_IMAGE_DATA-OBJECTIVE2-COLOUR)
(COMMUNICATED_IMAGE_DATA-OBJECTIVE3-COLOUR)
(COMMUNICATED_ROCK_DATA-WAYPOINT1)
(COMMUNICATED_ROCK_DATA-WAYPOINT0)
(COMMUNICATED_ROCK_DATA-WAYPOINT3)
(COMMUNICATED_ROCK_DATA-WAYPOINT4)
(COMMUNICATED_SOIL_DATA-WAYPOINT4)
(COMMUNICATED_SOIL_DATA-WAYPOINT3)
(COMMUNICATED_SOIL_DATA-WAYPOINT0)
(COMMUNICATED_SOIL_DATA-WAYPOINT6)
)
)
)
