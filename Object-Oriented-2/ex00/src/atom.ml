(* Virtual class atom *)
class virtual atom (n : string) (s : string) (num : int) =
object
  method name : string = n
  method symbol : string = s
  method atomic_number : int = num

  method virtual to_string : string
  method virtual equals : atom -> bool
end

(* Concrete atoms *)
class hydrogen =
object
  inherit atom "Hydrogen" "H" 1
  method to_string = Printf.sprintf "Atom: %s (Symbol: %s, Atomic Number: %d)" "Hydrogen" "H" 1
  method equals (other : atom) = other#symbol = "H"
end

class carbon =
object
  inherit atom "Carbon" "C" 6
  method to_string = Printf.sprintf "Atom: %s (Symbol: %s, Atomic Number: %d)" "Carbon" "C" 6
  method equals (other : atom) = other#symbol = "C"
end

class oxygen =
object
  inherit atom "Oxygen" "O" 8
  method to_string = Printf.sprintf "Atom: %s (Symbol: %s, Atomic Number: %d)" "Oxygen" "O" 8
  method equals (other : atom) = other#symbol = "O"
end

class nitrogen =
object
  inherit atom "Nitrogen" "N" 7
  method to_string = Printf.sprintf "Atom: %s (Symbol: %s, Atomic Number: %d)" "Nitrogen" "N" 7
  method equals (other : atom) = other#symbol = "N"
end

class helium =
object
  inherit atom "Helium" "He" 2
  method to_string = Printf.sprintf "Atom: %s (Symbol: %s, Atomic Number: %d)" "Helium" "He" 2
  method equals (other : atom) = other#symbol = "He"
end

class sulfur =
object
  inherit atom "Sulfur" "S" 16
  method to_string = Printf.sprintf "Atom: %s (Symbol: %s, Atomic Number: %d)" "Sulfur" "S" 16
  method equals (other : atom) = other#symbol = "S"
end
