module Calc_int   = Calc.Calc(Calc.INT)
module Calc_float = Calc.Calc(Calc.FLOAT)

let () =
  (* Examples from the subject *)
  print_endline (string_of_int   (Calc_int.power 3 3));
  print_endline (string_of_float (Calc_float.power 3.0 3));
  print_endline (string_of_int   (Calc_int.mul   (Calc_int.add 20 1) 2));
  print_endline (string_of_float (Calc_float.mul (Calc_float.add 20.0 1.0) 2.0));

  Printf.printf "\n-- INT --\n";
  Printf.printf "add 10 5 = %d\n" (Calc_int.add 10 5);
  Printf.printf "sub 10 5 = %d\n" (Calc_int.sub 10 5);
  Printf.printf "mul 3 4  = %d\n" (Calc_int.mul 3 4);
  Printf.printf "div 10 3 = %d\n" (Calc_int.div 10 3);
  Printf.printf "power 2 10 = %d\n" (Calc_int.power 2 10);
  Printf.printf "fact 5  = %d\n"  (Calc_int.fact 5);
  Printf.printf "fact 0  = %d\n"  (Calc_int.fact 0);

  Printf.printf "\n-- FLOAT --\n";
  Printf.printf "add 1.5 2.5 = %g\n"  (Calc_float.add 1.5 2.5);
  Printf.printf "power 2.0 8 = %g\n"  (Calc_float.power 2.0 8);
  Printf.printf "fact 6.0    = %g\n"  (Calc_float.fact 6.0)