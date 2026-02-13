module type PAIR = sig val pair : (int * int) end
module type VAL = sig val x : int end

module MakeFst (P: PAIR): VAL = struct
  let x = fst P.pair
end

module MakeSnd (P : PAIR): VAL = struct
  let x = snd P.pair
end



let () = 
let module Pair : PAIR = struct let pair = ( 21, 42 ) end in 
let module Fst : VAL = MakeFst (Pair) in 
let module Snd : VAL = MakeSnd (Pair) in 

Printf.printf "Fst.x = %d, Snd.x = %d\n" Fst.x Snd.x
