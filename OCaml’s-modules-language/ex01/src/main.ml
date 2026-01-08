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
  List.iter (fun card -> 
    let next = Value.next card in
    Printf.printf "Next of %d is %s\n" (Value.toInt card) (Value.toStringVerbose next)
  ) Value.all;

  List.iter (fun card -> 
    let previous = Value.previous card in
    Printf.printf "Prev of %d is %s\n" (Value.toInt card) (Value.toStringVerbose previous)
  ) Value.all;
