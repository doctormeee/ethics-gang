(define (problem grounded-STRIPS-TPP)
(:domain grounded-STRIPS-TPP-PROPOSITIONAL)
(:init
(AT-TRUCK3-DEPOT1)
(AT-TRUCK2-DEPOT1)
(AT-TRUCK1-DEPOT1)
(ON-SALE-GOODS9-MARKET2-LEVEL1)
(ON-SALE-GOODS8-MARKET2-LEVEL2)
(ON-SALE-GOODS6-MARKET2-LEVEL1)
(ON-SALE-GOODS4-MARKET2-LEVEL1)
(ON-SALE-GOODS3-MARKET2-LEVEL1)
(ON-SALE-GOODS2-MARKET2-LEVEL2)
(ON-SALE-GOODS1-MARKET2-LEVEL1)
(ON-SALE-GOODS7-MARKET1-LEVEL2)
(ON-SALE-GOODS5-MARKET1-LEVEL2)
(ON-SALE-GOODS4-MARKET1-LEVEL1)
(ON-SALE-GOODS3-MARKET1-LEVEL1)
(ON-SALE-GOODS1-MARKET1-LEVEL1)
(LOADED-GOODS9-TRUCK3-LEVEL0)
(LOADED-GOODS9-TRUCK2-LEVEL0)
(LOADED-GOODS9-TRUCK1-LEVEL0)
(LOADED-GOODS8-TRUCK3-LEVEL0)
(LOADED-GOODS8-TRUCK2-LEVEL0)
(LOADED-GOODS8-TRUCK1-LEVEL0)
(LOADED-GOODS7-TRUCK3-LEVEL0)
(LOADED-GOODS7-TRUCK2-LEVEL0)
(LOADED-GOODS7-TRUCK1-LEVEL0)
(LOADED-GOODS6-TRUCK3-LEVEL0)
(LOADED-GOODS6-TRUCK2-LEVEL0)
(LOADED-GOODS6-TRUCK1-LEVEL0)
(LOADED-GOODS5-TRUCK3-LEVEL0)
(LOADED-GOODS5-TRUCK2-LEVEL0)
(LOADED-GOODS5-TRUCK1-LEVEL0)
(LOADED-GOODS4-TRUCK3-LEVEL0)
(LOADED-GOODS4-TRUCK2-LEVEL0)
(LOADED-GOODS4-TRUCK1-LEVEL0)
(LOADED-GOODS3-TRUCK3-LEVEL0)
(LOADED-GOODS3-TRUCK2-LEVEL0)
(LOADED-GOODS3-TRUCK1-LEVEL0)
(LOADED-GOODS2-TRUCK3-LEVEL0)
(LOADED-GOODS2-TRUCK2-LEVEL0)
(LOADED-GOODS2-TRUCK1-LEVEL0)
(LOADED-GOODS1-TRUCK3-LEVEL0)
(LOADED-GOODS1-TRUCK2-LEVEL0)
(LOADED-GOODS1-TRUCK1-LEVEL0)
(STORED-GOODS9-LEVEL0)
(STORED-GOODS8-LEVEL0)
(STORED-GOODS7-LEVEL0)
(STORED-GOODS6-LEVEL0)
(STORED-GOODS5-LEVEL0)
(STORED-GOODS4-LEVEL0)
(STORED-GOODS3-LEVEL0)
(STORED-GOODS2-LEVEL0)
(STORED-GOODS1-LEVEL0)
(READY-TO-LOAD-GOODS9-MARKET2-LEVEL0)
(READY-TO-LOAD-GOODS8-MARKET2-LEVEL0)
(READY-TO-LOAD-GOODS7-MARKET1-LEVEL0)
(READY-TO-LOAD-GOODS6-MARKET2-LEVEL0)
(READY-TO-LOAD-GOODS5-MARKET1-LEVEL0)
(READY-TO-LOAD-GOODS4-MARKET2-LEVEL0)
(READY-TO-LOAD-GOODS4-MARKET1-LEVEL0)
(READY-TO-LOAD-GOODS3-MARKET2-LEVEL0)
(READY-TO-LOAD-GOODS3-MARKET1-LEVEL0)
(READY-TO-LOAD-GOODS2-MARKET2-LEVEL0)
(READY-TO-LOAD-GOODS1-MARKET2-LEVEL0)
(READY-TO-LOAD-GOODS1-MARKET1-LEVEL0)
)
(:goal
(and
(STORED-GOODS9-LEVEL1)
(STORED-GOODS8-LEVEL2)
(STORED-GOODS7-LEVEL1)
(STORED-GOODS6-LEVEL1)
(STORED-GOODS5-LEVEL2)
(STORED-GOODS4-LEVEL2)
(STORED-GOODS3-LEVEL2)
(STORED-GOODS2-LEVEL2)
(STORED-GOODS1-LEVEL1)
)
)
)
