(define (problem grounded-STRIPS-ROVERPROB6232)
(:domain grounded-STRIPS-ROVER)
(:init
(EMPTY-ROVER1STORE)
(AVAILABLE-ROVER1)
(AT-ROVER1-WAYPOINT2)
(EMPTY-ROVER0STORE)
(AVAILABLE-ROVER0)
(AT-ROVER0-WAYPOINT3)
(CHANNEL_FREE-GENERAL)
(AT_ROCK_SAMPLE-WAYPOINT3)
(AT_SOIL_SAMPLE-WAYPOINT3)
(AT_SOIL_SAMPLE-WAYPOINT2)
(AT_ROCK_SAMPLE-WAYPOINT1)
)
(:goal
(and
(COMMUNICATED_IMAGE_DATA-OBJECTIVE0-HIGH_RES)
(COMMUNICATED_ROCK_DATA-WAYPOINT1)
(COMMUNICATED_SOIL_DATA-WAYPOINT3)
)
)
)
