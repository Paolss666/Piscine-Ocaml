let print_reaction (mols : (Molecule.molecule * int) list) =
  let parts = List.map (fun (m, k) ->
    if k = 1 then m#formula
    else string_of_int k ^ " " ^ m#formula
  ) mols in
  String.concat " + " parts

let () =
  (* Test methane combustion: CH4 + 2 O2 -> CO2 + 2 H2O *)
  let c1 = new Alkane_combustion.alkane_combustion [new Alkane.methane] in
  Printf.printf "Methane balanced: %b\n" c1#is_balanced;
  let b1 = c1#balance in
  Printf.printf "After balance: %b\n" b1#is_balanced;
  Printf.printf "Start:  %s\n" (print_reaction b1#get_start);
  Printf.printf "Result: %s\n" (print_reaction b1#get_result);
  print_newline ();

  (* Test ethane combustion: 2 C2H6 + 7 O2 -> 4 CO2 + 6 H2O *)
  let c2 = new Alkane_combustion.alkane_combustion [new Alkane.ethane] in
  let b2 = c2#balance in
  Printf.printf "Ethane combustion:\n";
  Printf.printf "Start:  %s\n" (print_reaction b2#get_start);
  Printf.printf "Result: %s\n" (print_reaction b2#get_result);
  print_newline ();

  (* Test octane combustion *)
  let c3 = new Alkane_combustion.alkane_combustion [new Alkane.octane] in
  let b3 = c3#balance in
  Printf.printf "Octane combustion:\n";
  Printf.printf "Start:  %s\n" (print_reaction b3#get_start);
  Printf.printf "Result: %s\n" (print_reaction b3#get_result);
  print_newline ();

  (* Test mixed: methane + ethane *)
  let c4 = new Alkane_combustion.alkane_combustion [new Alkane.methane; new Alkane.ethane] in
  let b4 = c4#balance in
  Printf.printf "Methane + Ethane combustion:\n";
  Printf.printf "Start:  %s\n" (print_reaction b4#get_start);
  Printf.printf "Result: %s\n" (print_reaction b4#get_result);
  print_newline ();

  (* Test unbalanced exception *)
  (try
    let _ = c1#get_start in ()
  with Alkane_combustion.Not_balanced ->
    Printf.printf "Exception raised on unbalanced reaction: OK\n")
