let print_mol_list (mols : (Molecule.molecule * int) list) =
  let parts = List.map (fun (m, k) ->
    if k = 1 then m#formula
    else string_of_int k ^ " " ^ m#formula
  ) mols in
  String.concat " + " parts

let print_incomplete name alkanes =
  let c = new Alkane_combustion.alkane_combustion alkanes in
  Printf.printf "=== Incomplete combustion of %s ===\n" name;
  let results = c#get_incomplete_results in
  List.iter (fun (k_o2, products) ->
    Printf.printf "%s + %d O2 -> %s\n" name k_o2 (print_mol_list products)
  ) results;
  print_newline ()

let () =
  print_incomplete "CH4" [new Alkane.methane];
  print_incomplete "C2H6" [new Alkane.ethane];
  print_incomplete "C3H8" [new Alkane.make_alkane 3]
