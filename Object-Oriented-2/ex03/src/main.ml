let () =
  Printf.printf "Reaction class structure defined.\n";
  Printf.printf "count_atoms works on molecule lists.\n";

  let w = (new Molecule.water :> Molecule.molecule) in
  let co2 = (new Molecule.carbon_dioxide :> Molecule.molecule) in
  let atoms_start = Reaction.count_atoms [(w, 2); (co2, 1)] in
  List.iter (fun (sym, n) ->
    Printf.printf "  %s: %d\n" sym n
  ) (Molecule.hill_sort atoms_start);

  (* 
      C: 1 (da CO₂) = 1 
      H: 2×2 (da H₂O×2) = 4
      O: 2 (da H₂O×2) + 2 (da CO₂) = 4 
  *)