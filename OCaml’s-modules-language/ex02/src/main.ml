let () =
  print_endline "=== Color Test ===";
  List.iter (fun c -> 
    Printf.printf "%s " (Color.toString c)
  ) Color.all;
  print_newline ();
  
  print_endline "\n=== Value Test ===";
  List.iter (fun v -> 
    Printf.printf "%s " (Value.toString v)
  ) Value.all;
  print_newline ();
  
  print_endline "\n=== Next/Previous Test ===";
  Printf.printf "next(T2) = %s\n" (Value.toString (Value.next Value.T2));
  Printf.printf "previous(As) = %s\n" (Value.toString (Value.previous Value.As))