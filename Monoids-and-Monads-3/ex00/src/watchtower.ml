(* Brian Beckman's clock monoid - 12-hour clock arithmetic *)
module Watchtower : sig
  type hour = int
  val zero : hour
  val add  : hour -> hour -> hour
  val sub  : hour -> hour -> hour
end = struct
  type hour = int
  let zero = 0

  let add h1 h2 = (h1 + h2) mod 12

  let sub h1 h2 = ((h1 - h2) mod 12 + 12) mod 12
end
 (* set of thins pus a rule for combine the thinks and that rules obais at some rules *)