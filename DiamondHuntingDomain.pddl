(define (domain DiamondHunting)

    (:requirements :strips :typing :negative-preconditions :fluents)

    (:types
        location avatar door key diamond -object
        blocking_door welcoming_door -door
    )

    (:predicates
        (avatar_at_position ?x ?y) ; avatar's current position
        (forward_pos ?x ?y) ;from left to right and from up to down         
        (backward_pos ?x ?y) ;from right to left and from down to up 
        (blocked ?x ?y) ;avatar can't step in here
        (door_lock ?x ?y) ;the door isn't opened yet so the avatar can't step in here
        (key_at ?k ?x ?y) ;where the specific key is kept
        (door_at ?d ?x ?y) ;where the specific door is located 
        (diamond_at ?d ?x ?y) ;where the specific diamond is kept
        (key_taken ?k) ;whether the specific key is taken by the avatar or not
        (door_opened ?d) ;whether the specific door is opened by the avatar or not
        (lock_key_pair ?d ?k) ;which key is for which door
        (diamond_taken ?d) ;whether the specific diamond is taken by the avatar or not
        (home_at ?x ?y) ;home position is at x10,y10
        (finished) ;whether the the avater get out from the maze acomplishing the task

    )

    (:functions
        (avatar_energy) -number ;initially avatar has an energy which will increase or decrease with completion of task
        (buying_key ?k -key) -number ;to take a specific key avater need a pre-required energy
        (opening_prize ?d -door) -number ;when avater opens a specific door he will get its associated energy
        (diamond_hunt ?d -diamond) -number ;to take a specific diamond avater need a pre-required energy
    )

    ;an avatar can move to any side when her energy is greater than 0, the path is not blocked, and there is no locked door. 
    ;And as the effect of move, the avatar will go to forward or backward, and his current position will be changed accordingly.

    (:action moveleft
        :parameters (?x1 ?x2 ?y1 - location)
        :precondition (and (> (avatar_energy) 0) (not(blocked ?x2 ?y1)) (backward_pos ?x1 ?x2) (avatar_at_position ?x1 ?y1)
            (not(door_lock ?x1 ?y1)))
        :effect (and (forward_pos ?x2 ?x1) (not(avatar_at_position ?x1 ?y1)) (avatar_at_position ?x2 ?y1))
    )

    (:action moveright
        :parameters (?x1 ?x2 ?y1 - location)
        :precondition (and (> (avatar_energy) 0) (not(blocked ?x2 ?y1)) (forward_pos ?x1 ?x2) (avatar_at_position ?x1 ?y1)
            (not(door_lock ?x1 ?y1)))
        :effect (and (backward_pos ?x2 ?x1) (not(avatar_at_position ?x1 ?y1)) (avatar_at_position ?x2 ?y1))
    )

    (:action moveup
        :parameters (?x1 ?y1 ?y2 - location)
        :precondition (and (> (avatar_energy) 0) (not(blocked ?x1 ?y2)) (backward_pos ?y1 ?y2) (avatar_at_position ?x1 ?y1)
            (not(door_lock ?x1 ?y1)))
        :effect (and (forward_pos ?y2 ?y1) (not(avatar_at_position ?x1 ?y1)) (avatar_at_position ?x1 ?y2))
    )

    (:action movedown
        :parameters (?x1 ?y1 ?y2 - location)
        :precondition (and (> (avatar_energy) 0) (not(blocked ?x1 ?y2)) (forward_pos ?y1 ?y2) (avatar_at_position ?x1 ?y1)
            (not(door_lock ?x1 ?y1)))
        :effect (and (backward_pos ?y2 ?y1) (not(avatar_at_position ?x1 ?y1)) (avatar_at_position ?x1 ?y2))
    )

    ;if the avatar reach at the position where the a key is kept and avatar has the pre-required energy to buy the specific key
    ;then the avater will take the key and the pre-required energy for taking the key will be decreased from avatar's energy and 
    ;the key will be removed from the position 

    (:action key_collect
        :parameters (?x1 -location ?y1 -location ?k -key)
        :precondition (and (avatar_at_position ?x1 ?y1) (>= (avatar_energy) (buying_key ?k)) (key_at ?k ?x1 ?y1))
        :effect (and (not (key_at ?k ?x1 ?y1)) (decrease (avatar_energy) (buying_key ?k)) (key_taken ?k))
    )

    ;if the avatar reach at the position where the a door exists, the specific door is locked, and the avatar has collected it's paired key
    ;then the avater will unlock the door and she will gain specific energy and the door lock will be neither at the position 

    (:action unlock_door
        :parameters (?k - key ?d - door ?x1 -location ?y1 -location)
        :precondition (and (door_at ?d ?x1 ?y1) (door_lock ?x1 ?y1)
            (not(door_opened ?d)) (avatar_at_position ?x1 ?y1) (lock_key_pair ?d ?k) (key_taken ?k))
        :effect (and (increase (avatar_energy) (opening_prize ?d)) (not(door_lock ?x1 ?y1))(door_opened ?d))
    )

    ;if the avatar reach at the position where the a diamond is kept and avatar has the pre-required energy to take the specific diamond
    ;then the avater will take the diamond and the diamond will be removed from the position 

    (:action diamond_collect
        :parameters (?x1 ?y1 -location ?d -diamond)
        :precondition (and (avatar_at_position ?x1 ?y1)(diamond_at ?d ?x1 ?y1) (>= (avatar_energy) (diamond_hunt ?d)))
        :effect (and (diamond_taken ?d)
            (not (diamond_at ?d ?x1 ?y1)))
    )

    ;the maze will be completed only after the avatar reaching the home position with two diamonds. and it will true the finished status

    (:action complete_maze
        :parameters (?x1 ?y1 -location)
        :precondition (and (diamond_taken diamond1) (diamond_taken diamond2) (avatar_at_position ?x1 ?y1) (home_at ?x1 ?y1))
        :effect (finished)
    )

)