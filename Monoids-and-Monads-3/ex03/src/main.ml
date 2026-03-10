let print_try label show = function
  | Try.Success v  -> Printf.printf "%s = Success(%s)\n" label (show v)
  | Try.Failure e  -> Printf.printf "%s = Failure(%s)\n" label (Printexc.to_string e)

let () =
  Printf.printf "-- return --\n";
  print_try "return 42"   string_of_int   (Try.return 42);
  print_try "return true" string_of_bool  (Try.return true);

  Printf.printf "\n-- bind --\n";
  let safe_div x y =
    if y = 0 then raise Division_by_zero
    else Try.return (x / y)
  in
  print_try "bind (return 10) (safe_div 10)" string_of_int
    (Try.bind (Try.return 10) (safe_div 10));
  print_try "bind (return 0) (safe_div 10) [div by zero]" string_of_int
    (Try.bind (Try.return 0) (safe_div 10));
  print_try "bind Failure [propagated]" string_of_int
    (Try.bind (Try.Failure Not_found) (safe_div 10));

  Printf.printf "\n-- recover --\n";
  let default_on_error _e = Try.return (-1) in
  print_try "recover Success" string_of_int
    (Try.recover (Try.return 5) default_on_error);
  print_try "recover Failure" string_of_int
    (Try.recover (Try.Failure Not_found) default_on_error);

  Printf.printf "\n-- filter --\n";
  print_try "filter (>0) on Success 5"   string_of_int
    (Try.filter (Try.return 5)  (fun x -> x > 0));
  print_try "filter (>0) on Success -1"  string_of_int
    (Try.filter (Try.return (-1)) (fun x -> x > 0));
  print_try "filter on Failure [propagated]" string_of_int
    (Try.filter (Try.Failure Not_found) (fun x -> x > 0));

  Printf.printf "\n-- flatten --\n";
  print_try "flatten (Success (Success 42))" string_of_int
    (Try.flatten (Try.Success (Try.Success 42)));
  print_try "flatten (Success (Failure e))" string_of_int
    (Try.flatten (Try.Success (Try.Failure Not_found)));
  print_try "flatten (Failure e)" string_of_int
    (Try.flatten (Try.Failure Division_by_zero))
