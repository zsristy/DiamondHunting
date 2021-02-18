(define (problem DiamondHunting-Problem)

    (:domain DiamondHunting)

    (:objects
       x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 - location 
       y1 y2 y3 y4 y5 y6 y7 y8 y9 y10 - location
    
    key1  key2 key3 key4 key5 - key
    door1  door2  door3 door4 door5 - door
    diamond1 diamond2 - diamond
    )

    (:INIT
        (avatar_at_position x1 y1)
	       (lock_key_pair door1 key1)
           (lock_key_pair door2 key2)
           (lock_key_pair door3 key3)
           (lock_key_pair door4 key4)
           (lock_key_pair door5 key5)
      
            (forward_pos x1 x2)
            (forward_pos x2 x3)
            (forward_pos x3 x4)
            (forward_pos x4 x5)
            (forward_pos x5 x6)
            (forward_pos x6 x7)
            (forward_pos x7 x8)
            (forward_pos x8 x9)
            (forward_pos x9 x10)
            
            
            (forward_pos y1 y2)
            (forward_pos y2 y3)
            (forward_pos y3 y4)
            (forward_pos y4 y5)
            (forward_pos y5 y6)
            (forward_pos y6 y7)
            (forward_pos y7 y8)
            (forward_pos y8 y9)
            (forward_pos y9 y10)
            


            (backward_pos x2 x1)
            (backward_pos x3 x2)
            (backward_pos x4 x3)
            (backward_pos x5 x4)
            (backward_pos x6 x5)
            (backward_pos x7 x6)
            (backward_pos x8 x7)
            (backward_pos x9 x8)
            (backward_pos x10 x9)
                       

            (backward_pos y2 y1)
            (backward_pos y3 y2)
            (backward_pos y4 y3)
            (backward_pos y5 y4)
            (backward_pos y6 y5)
            (backward_pos y7 y6)
            (backward_pos y8 y7)
            (backward_pos y9 y8)
            (backward_pos y10 y9) 
            

            (blocked x2 y4)
            (blocked x2 y5)
            (blocked x2 y6)
            (key_at key1 x2 y7)
            (blocked x2 y8)
            (blocked x2 y9)
            (blocked x2 y10)
            
            
            (blocked x3 y1)
            (door_at door1 x3 y2)
(door_lock x3 y2)
            (blocked x3 y3)
            (key_at key3 x3 y4)
            (blocked x3 y5)
            (blocked x3 y7)
            
            
            (blocked x4 y1)
            (blocked x4 y3)
            (blocked x4 y5)
            (door_at door3 x4 y6)
(door_lock x4 y6)
            (diamond_at diamond1 x4 y9)
            
            
            (key_at key2 x5 y1)
            (blocked x5 y3)
            (door_at door2 x5 y4)
(door_lock x5 y4)
            (blocked x5 y5)
            (blocked x5 y6)
            (blocked x5 y8)
            (blocked x5 y9)
            (blocked x5 y10)
            
            
 	        (blocked x6 y1)
            (blocked x6 y5)
            (blocked x6 y6)
            (blocked x6 y8)
            
            
 	        (blocked x7 y1)
 	        (blocked x7 y2)
            (blocked x7 y3)
            (key_at key4 x7 y9)
            (blocked x7 y10)
            
            
            (blocked x8 y6)
            (blocked x8 y8)
            (door_at door4 x8 y9)
(door_lock x8 y9)


            (blocked x9 y2)
 	        (blocked x9 y3)
            (blocked x9 y6)
            (key_at key5 x9 y9)
            (blocked x9 y10)
            
            
            
            (door_at door5 x10 y1)
(door_lock x10 y1)
            (diamond_at diamond2 x10 y2)
            (blocked x10 y3)
            )

    (:goal(and 
            (avatar_at_position x4 y9)
            (diamond_taken diamond1)
            )

    )
)