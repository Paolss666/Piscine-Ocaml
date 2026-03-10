(* Exception raised when a filter predicate is not satisfied *)
exception Predicate_not_satisfied

(* The Try monad: represents a computation that may succeed or fail *)
type 'a t =
  | Success of 'a
  | Failure of exn

(* Wrap a pure value into a successful computation *)
let return x = Success x

(* Chain a computation: apply f only on Success, propagate Failure *)
let bind m f =
  match m with
  | Failure e -> Failure e
  | Success v -> (try f v with e -> Failure e)

(* Handle a failure: apply f only on Failure, propagate Success *)
let recover m f =
  match m with
  | Success _ -> m
  | Failure e -> (try f e with e -> Failure e)

(* Filter: convert to Failure if the predicate is not satisfied *)
let filter m pred =
  match m with
  | Failure _ -> m
  | Success v ->
      if pred v then m
      else Failure Predicate_not_satisfied

(* Flatten a nested Try: Success(Failure e) is treated as Failure e *)
let flatten = function
  | Failure e        -> Failure e
  | Success (Failure e) -> Failure e
  | Success (Success v) -> Success v
