(* Abstract arithmetic monoid signature *)
module type MONOID = sig
  type element
  val zero1 : element          (* additive identity: 0   *)
  val zero2 : element          (* multiplicative identity: 1 *)
  val add   : element -> element -> element
  val sub   : element -> element -> element
  val mul   : element -> element -> element
  val div   : element -> element -> element
end

(* Integer arithmetic monoid *)
module INT : MONOID with type element = int = struct
  type element = int
  let zero1 = 0
  let zero2 = 1
  let add x y = x + y
  let sub x y = x - y
  let mul x y = x * y
  let div x y = x / y
end

(* Float arithmetic monoid *)
module FLOAT : MONOID with type element = float = struct
  type element = float
  let zero1 = 0.0
  let zero2 = 1.0
  let add x y = x +. y
  let sub x y = x -. y
  let mul x y = x *. y
  let div x y = x /. y
end

(* Functor: builds a calculator from any arithmetic monoid *)
module Calc (M : MONOID) = struct
  let add = M.add
  let sub = M.sub
  let mul = M.mul
  let div = M.div

  (* x^n using the multiplicative identity as base case *)
  let rec power x n =
    if n <= 0 then M.zero2
    else M.mul x (power x (n - 1))

  (* n! using the additive identity as termination condition *)
  let rec fact x =
    if x = M.zero1 then M.zero2
    else M.mul x (fact (M.sub x M.zero2))
end
