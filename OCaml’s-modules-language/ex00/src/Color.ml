type t = Spade | Heart | Diamond | Club


let toStringVerbose : t -> string = function
  | Spade -> "Spade"
  | Heart -> "Heart"
  | Diamond -> "Diamond"
  | Club -> "Club"


let toString : t -> string =
  function
  | Spade -> "S"
  | Heart -> "H"
  | Diamond -> "D"
  | Club -> "C"


let all : t list  = [Spade; Heart; Diamond; Club]