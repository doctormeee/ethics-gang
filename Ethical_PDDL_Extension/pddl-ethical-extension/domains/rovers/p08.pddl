(define (problem grounded-STRIPS-ROVERPROB1423)
(:domain grounded-STRIPS-ROVER)
(:init
(EMPTY-ROVER3STORE)
(AVAILABLE-ROVER3)
(AT-ROVER3-WAYPOINT3)
(EMPTY-ROVER2STORE)
(AVAILABLE-ROVER2)
(AT-ROVER2-WAYPOINT2)
(EMPTY-ROVER1STORE)
(AVAILABLE-ROVER1)
(AT-ROVER1-WAYPOINT2)
(EMPTY-ROVER0STORE)
(AVAILABLE-ROVER0)
(AT-ROVER0-WAYPOINT2)
(CHANNEL_FREE-GENERAL)
(AT_ROCK_SAMPLE-WAYPOINT5)
(AT_ROCK_SAMPLE-WAYPOINT4)
(AT_SOIL_SAMPLE-WAYPOINT4)
(AT_ROCK_SAMPLE-WAYPOINT3)
(AT_SOIL_SAMPLE-WAYPOINT3)
(AT_ROCK_SAMPLE-WAYPOINT2)
(AT_SOIL_SAMPLE-WAYPOINT1)
)
(:goal
(and
(COMMUNICATED_IMAGE_DATA-OBJECTIVE2-LOW_RES)
(COMMUNICATED_IMAGE_DATA-OBJECTIVE0-HIGH_RES)
(COMMUNICATED_IMAGE_DATA-OBJECTIVE0-LOW_RES)
(COMMUNICATED_ROCK_DATA-WAYPOINT4)
(COMMUNICATED_ROCK_DATA-WAYPOINT5)
(COMMUNICATED_SOIL_DATA-WAYPOINT4)
(COMMUNICATED_SOIL_DATA-WAYPOINT3)
(COMMUNICATED_SOIL_DATA-WAYPOINT1)
)
)
)
