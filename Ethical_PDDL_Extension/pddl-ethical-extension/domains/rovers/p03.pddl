(define (problem grounded-STRIPS-ROVERPROB3726)
(:domain grounded-STRIPS-ROVER)
(:init
(EMPTY-ROVER1STORE)
(AVAILABLE-ROVER1)
(AT-ROVER1-WAYPOINT3)
(EMPTY-ROVER0STORE)
(AVAILABLE-ROVER0)
(AT-ROVER0-WAYPOINT1)
(CHANNEL_FREE-GENERAL)
(AT_ROCK_SAMPLE-WAYPOINT2)
(AT_SOIL_SAMPLE-WAYPOINT2)
(AT_ROCK_SAMPLE-WAYPOINT1)
(AT_ROCK_SAMPLE-WAYPOINT0)
)
(:goal
(and
(COMMUNICATED_IMAGE_DATA-OBJECTIVE0-COLOUR)
(COMMUNICATED_ROCK_DATA-WAYPOINT0)
(COMMUNICATED_SOIL_DATA-WAYPOINT2)
)
)
)
