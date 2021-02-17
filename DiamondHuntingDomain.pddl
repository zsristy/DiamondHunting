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

    (:action moveleft
        :parameters (?x1 ?x2 ?y1 - location)
        :precondition (and (not(blocked ?x2 ?y1)) (backward_pos ?x1 ?x2) (avatar_at_position ?x1 ?y1) (not(door_lock ?x1 ?y1)))
        :effect (and (forward_pos ?x2 ?x1) (not(avatar_at_position ?x1 ?y1)) (avatar_at_position ?x2 ?y1))
    )

    (:action moveright
        :parameters (?x1 ?x2 ?y1 - location)
        :precondition (and (not(blocked ?x2 ?y1)) (forward_pos ?x1 ?x2) (avatar_at_position ?x1 ?y1)(not(door_lock ?x1 ?y1)) )
        :effect (and (backward_pos ?x2 ?x1) (not(avatar_at_position ?x1 ?y1)) (avatar_at_position ?x2 ?y1))
    )

    (:action moveup
        :parameters (?x1 ?y1 ?y2 - location)
        :precondition (and (not(blocked ?x1 ?y2)) (backward_pos ?y1 ?y2) (avatar_at_position ?x1 ?y1)(not(door_lock ?x1 ?y1)) )
        :effect (and (forward_pos ?y2 ?y1) (not(avatar_at_position ?x1 ?y1)) (avatar_at_position ?x1 ?y2))
    )

    (:action movedown
        :parameters (?x1 ?y1 ?y2 - location)
        :precondition (and (not(blocked ?x1 ?y2)) (forward_pos ?y1 ?y2) (avatar_at_position ?x1 ?y1)(not(door_lock ?x1 ?y1)) )
        :effect (and (backward_pos ?y2 ?y1) (not(avatar_at_position ?x1 ?y1)) (avatar_at_position ?x1 ?y2))
    )

)