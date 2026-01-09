let () = 
  List.iter (fun suit -> 
    Printf.printf "%s " (Value.toStringVerbose suit)
  ) Value.all;

  print_endline "\n==== TEST SHORT ====";

  List.iter (fun suit ->
    Printf.printf "%s " (Value.toString suit)
  ) Value.all;

  List.iter (fun card -> print_int (Value.toInt card); print_char ' ') Value.all;


  print_endline "\n==== TEST LENGTH ====";

  Printf.printf "Length of all:  %d\n" (List.length Value.all);

  print_endline "\n==== TEST PREV - NEXT ====";
  
  let next_tests = Value.T2 in
  let previous_tests = Value.T7 in

  let next = Value.next next_tests in
  Printf.printf "Next of %s is %s\n" (Value.toStringVerbose next_tests) (Value.toStringVerbose next);
  
  let previous = Value.previous previous_tests in
  Printf.printf "Prev of %s is %s\n" (Value.toStringVerbose previous_tests) (Value.toStringVerbose previous); 

  List.iter (fun card -> 
    let previous = Value.previous card in
    Printf.printf "Prev of %d is %s\n" (Value.toInt card) (Value.toStringVerbose previous)
  ) Value.all;