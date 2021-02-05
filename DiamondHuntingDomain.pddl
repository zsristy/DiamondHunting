(define (domain DiamondHunting)

    (:requirements :strips :typing :negative-preconditions)
    (:types
        location avatar door key diamond -object
    )

    (:predicates
        (avatar_at_position ?x ?y)
        (forward_pos ?x ?y)
        (backward_pos ?x ?y)
        (blocked ?x ?y)
        (door_lock ?x ?y)
    )

    

)