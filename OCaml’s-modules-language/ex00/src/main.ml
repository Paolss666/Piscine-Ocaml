
let () = 
  print_endline "==== TEST VERBOSE ====";
  List.iter (fun suit -> 
    Printf.printf "%s " (Color.toStringVerbose suit)
  ) Color.all;
  
  print_endline "\n==== TEST SHORT ====";
  List.iter (fun suit -> 
    Printf.printf "%s " (Color.toString suit)
  ) Color.all;
  
  Printf.printf "\n";
  Printf.printf "%d\n" (List.length Color.all)