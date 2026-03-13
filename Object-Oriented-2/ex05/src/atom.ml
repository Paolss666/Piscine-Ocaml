(* Virtual class atom *)
class virtual atom (n : string) (s : string) (num : int) =
object
  method name : string = n
  method symbol : string = s
  method atomic_number : int = num

  method virtual to_string : string
  method virtual equals : atom -> bool
  method get_atomic_number : int = num
  method get_symbol : string = s
  method get_name : string = n
end

(* Concrete atoms *)
class hydrogen =
object (self)
  inherit atom "Hydrogen" "H" 1
  method to_string = Printf.sprintf "Atom: %s (Symbol: %s, Atomic Number: %d)" self#get_name self#get_symbol self#get_atomic_number
  method equals (other : atom) = other#get_symbol = "H"
end

class carbon =
object (self)
  inherit atom "Carbon" "C" 6
  method to_string = Printf.sprintf "Atom: %s (Symbol: %s, Atomic Number: %d)"  self#get_name self#get_symbol self#get_atomic_number
  method equals (other : atom) = other#get_symbol = "C"
end

class oxygen =
object (self)
  inherit atom "Oxygen" "O" 8
  method to_string = Printf.sprintf "Atom: %s (Symbol: %s, Atomic Number: %d)" self#get_name self#get_symbol self#get_atomic_number
  method equals (other : atom) = other#get_symbol = "O"
end

class nitrogen =
object (self)
  inherit atom "Nitrogen" "N" 7
  method to_string = Printf.sprintf "Atom: %s (Symbol: %s, Atomic Number: %d)"  self#get_name self#get_symbol self#get_atomic_number
  method equals (other : atom) = other#get_symbol = "N"
end

class helium =
object (self)
  inherit atom "Helium" "He" 2
  method to_string = Printf.sprintf "Atom: %s (Symbol: %s, Atomic Number: %d)"  self#get_name self#get_symbol self#get_atomic_number
  method equals (other : atom) = other#get_symbol = "He"
end

class sulfur =
object (self)
  inherit atom "Sulfur" "S" 16
  method to_string = Printf.sprintf "Atom: %s (Symbol: %s, Atomic Number: %d)"  self#get_name self#get_symbol self#get_atomic_number
  method equals (other : atom) = other#get_symbol = "S"
end
