(* Hill notation: Carbon first, Hydrogen second, then rest alphabetically *)
let hill_sort (atoms : (string * int) list) : (string * int) list =
  let has_carbon = List.exists (fun (s, _) -> s = "C") atoms in
  let priority sym =
    if has_carbon then
      (match sym with "C" -> 0 | "H" -> 1 | _ -> 2)
    else 2
  in
  List.sort (fun (s1, _) (s2, _) ->
    let p1 = priority s1 and p2 = priority s2 in
    if p1 <> p2 then compare p1 p2
    else String.compare s1 s2
  ) atoms

(* Compute formula from atom list using Hill notation *)
let compute_formula (atoms : Atom.atom list) : string =
  (* Count occurrences of each symbol *)
  let counts = List.fold_left (fun acc a ->
    let sym = a#symbol in
    match List.assoc_opt sym acc with
    | None -> (sym, 1) :: acc
    | Some n -> (sym, n + 1) :: (List.filter (fun (s, _) -> s <> sym) acc)
  ) [] atoms in
  let sorted = hill_sort counts in
  List.fold_left (fun acc (sym, n) ->
    if n = 1 then acc ^ sym
    else acc ^ sym ^ string_of_int n
  ) "" sorted

(* Virtual class molecule *)
class virtual molecule (n : string) (atoms : Atom.atom list) =
object
  method name : string = n
  method formula : string = compute_formula atoms
  method atoms : Atom.atom list = atoms

  method virtual to_string : string
  method virtual equals : molecule -> bool
end

(* Concrete molecules *)
class water =
object
  inherit molecule "Water" [new Atom.hydrogen; new Atom.hydrogen; new Atom.oxygen]
  method to_string = Printf.sprintf "Molecule: %s (Formula: %s)" "Water" (compute_formula [new Atom.hydrogen; new Atom.hydrogen; new Atom.oxygen])
  method equals (other : molecule) = other#formula = "H2O"
end

class carbon_dioxide =
object
  inherit molecule "Carbon Dioxide" [new Atom.carbon; new Atom.oxygen; new Atom.oxygen]
  method to_string = Printf.sprintf "Molecule: %s (Formula: %s)" "Carbon Dioxide" (compute_formula [new Atom.carbon; new Atom.oxygen; new Atom.oxygen])
  method equals (other : molecule) = other#formula = "CO2"
end

class ammonia =
object
  inherit molecule "Ammonia" [new Atom.nitrogen; new Atom.hydrogen; new Atom.hydrogen; new Atom.hydrogen]
  method to_string = Printf.sprintf "Molecule: %s (Formula: %s)" "Ammonia"
    (compute_formula [new Atom.nitrogen; new Atom.hydrogen; new Atom.hydrogen; new Atom.hydrogen])
  method equals (other : molecule) = other#formula = "H3N"
end

class hydrogen_sulfide =
object
  inherit molecule "Hydrogen Sulfide" [new Atom.hydrogen; new Atom.hydrogen; new Atom.sulfur]
  method to_string = Printf.sprintf "Molecule: %s (Formula: %s)" "Hydrogen Sulfide"
    (compute_formula [new Atom.hydrogen; new Atom.hydrogen; new Atom.sulfur])
  method equals (other : molecule) = other#formula = "H2S"
end

class nitrogen_gas =
object
  inherit molecule "Nitrogen Gas" [new Atom.nitrogen; new Atom.nitrogen]
  method to_string = Printf.sprintf "Molecule: %s (Formula: %s)" "Nitrogen Gas"
    (compute_formula [new Atom.nitrogen; new Atom.nitrogen])
  method equals (other : molecule) = other#formula = "N2"
end
