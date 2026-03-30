(* Count atoms in a (molecule * int) list *)
let count_atoms (mols : (Molecule.molecule * int) list) : (string * int) list =
  List.fold_left (fun acc (mol, coeff) ->
    List.fold_left (fun acc2 a ->
      let sym = a#symbol in
      match List.assoc_opt sym acc2 with
      | None -> (sym, coeff) :: acc2
      | Some n -> (sym, n + coeff) :: (List.filter (fun (s, _) -> s <> sym) acc2)
    ) acc mol#atoms
  ) [] mols

(* assoc_opt
  returns the value associated with a key in a list of pairs, or None if the key is not found *)

let check_balanced (start_mols : (Molecule.molecule * int) list) (result_mols : (Molecule.molecule * int) list) : bool =
  let start_atoms = count_atoms start_mols in
  let result_atoms = count_atoms result_mols in
  List.for_all (fun (sym, n) ->
    match List.assoc_opt sym result_atoms with
    | None -> false
    | Some m -> n = m
  ) start_atoms &&
  List.for_all (fun (sym, n) ->
    match List.assoc_opt sym start_atoms with
    | None -> false
    | Some m -> n = m
  ) result_atoms

(* Virtual reaction class *)
class virtual reaction
    (start_mols : (Molecule.molecule * int) list)
    (result_mols : (Molecule.molecule * int) list) =
object
  val _start_mols = start_mols
  val _result_mols = result_mols

  method virtual get_start : (Molecule.molecule * int) list
  method virtual get_result : (Molecule.molecule * int) list
  method virtual balance : reaction
  method virtual is_balanced : bool
end
