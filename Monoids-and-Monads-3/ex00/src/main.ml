let () =
  (* zero is the identity element *)
  Printf.printf "zero = %d\n" Watchtower.Watchtower.zero;

  (* add: clock arithmetic modulo 12 *)
  Printf.printf "add 3 5 = %d\n"  (Watchtower.Watchtower.add 3 5);   (* 8  *)
  Printf.printf "add 9 5 = %d\n"  (Watchtower.Watchtower.add 9 5);   (* 2  *)
  Printf.printf "add 11 1 = %d\n" (Watchtower.Watchtower.add 11 1);  (* 0  *)

  (* zero is a neutral element *)
  Printf.printf "add 7 zero = %d\n" (Watchtower.Watchtower.add 7 Watchtower.Watchtower.zero); (* 7 *)

  (* sub: inverse of add *)
  Printf.printf "sub 5 3 = %d\n"  (Watchtower.Watchtower.sub 5 3);   (* 2  *)
  Printf.printf "sub 3 5 = %d\n"  (Watchtower.Watchtower.sub 3 5);   (* 10 *)
  Printf.printf "sub 9 9 = %d\n"  (Watchtower.Watchtower.sub 9 9)    (* 0  *)
