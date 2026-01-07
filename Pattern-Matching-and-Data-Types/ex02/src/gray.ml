let gray n = 
  let rec prefix_all pre lst = 
    List.map (String.cat pre) lst
  in

  let rec gerate = 
    function 
    | 1 -> ["0"; "1"]
    | n ->
      let prev = gerate (n - 1) in
      List.append 
        (prefix_all "0" prev) 
        (prefix_all "1" (List.rev prev))
  in
  gerate n


let () =
  print_endline "Gray(1):";
  List.iter (Printf.printf "%s ") (gray 1);
  print_newline ();
  
  print_endline "\nGray(2):";
  List.iter (Printf.printf "%s ") (gray 2);
  print_newline ();
  
  print_endline "\nGray(3):";
  List.iter (Printf.printf "%s ") (gray 3);
  print_newline ()
