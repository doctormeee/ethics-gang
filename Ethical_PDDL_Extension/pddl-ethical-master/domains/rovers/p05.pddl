(define (problem grounded-STRIPS-ROVERPROB2435)
(:domain grounded-STRIPS-ROVER)
(:init
(EMPTY-ROVER1STORE)
(AVAILABLE-ROVER1)
(AT-ROVER1-WAYPOINT0)
(EMPTY-ROVER0STORE)
(AVAILABLE-ROVER0)
(AT-ROVER0-WAYPOINT0)
(CHANNEL_FREE-GENERAL)
(AT_SOIL_SAMPLE-WAYPOINT3)
(AT_SOIL_SAMPLE-WAYPOINT2)
(AT_ROCK_SAMPLE-WAYPOINT1)
(AT_SOIL_SAMPLE-WAYPOINT1)
(AT_ROCK_SAMPLE-WAYPOINT0)
)
(:goal
(and
(COMMUNICATED_IMAGE_DATA-OBJECTIVE0-COLOUR)
(COMMUNICATED_IMAGE_DATA-OBJECTIVE2-HIGH_RES)
(COMMUNICATED_IMAGE_DATA-OBJECTIVE0-HIGH_RES)
(COMMUNICATED_ROCK_DATA-WAYPOINT1)
(COMMUNICATED_ROCK_DATA-WAYPOINT0)
(COMMUNICATED_SOIL_DATA-WAYPOINT2)
(COMMUNICATED_SOIL_DATA-WAYPOINT1)
)
)
)
