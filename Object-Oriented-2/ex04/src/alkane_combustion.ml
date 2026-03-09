(* Deduplicate alkane list by n, counting occurrences *)
let count_alkanes (alkanes : Alkane.alkane list) : (int * int) list =
  List.fold_left (fun acc a ->
    let n = a#n in
    match List.assoc_opt n acc with
    | None -> (n, 1) :: acc
    | Some k -> (n, k + 1) :: (List.filter (fun (x, _) -> x <> n) acc)
  ) [] alkanes

(* Compute smallest integer balanced coefficients *)
(* CnH(2n+2) + (3n+1)/2 O2 -> n CO2 + (n+1) H2O *)
(* If sum of k*(3n+1) is odd, multiply everything by 2 *)
let compute_coeffs (alkane_counts : (int * int) list) =
  let total_o = List.fold_left (fun acc (n, k) -> acc + k * (3*n+1)) 0 alkane_counts in
  let mult = if total_o mod 2 = 0 then 1 else 2 in
  let scaled = List.map (fun (n, k) -> (n, mult * k)) alkane_counts in
  let o2 = mult * total_o / 2 in
  let co2 = List.fold_left (fun acc (n, k) -> acc + k * n) 0 scaled in
  let h2o = List.fold_left (fun acc (n, k) -> acc + k * (n+1)) 0 scaled in
  (scaled, o2, co2, h2o)

exception Not_balanced

class alkane_combustion (alkanes : Alkane.alkane list) =
object(self)
  inherit Reaction.reaction [] []

  val _alkanes = alkanes
  val _is_balanced = false

  method is_balanced = _is_balanced

  method get_start =
    if not _is_balanced then raise Not_balanced
    else _start_mols

  method get_result =
    if not _is_balanced then raise Not_balanced
    else _result_mols

  method private build_balanced =
    let counts = count_alkanes _alkanes in
    let (scaled, o2_coeff, co2_coeff, h2o_coeff) = compute_coeffs counts in
    (* Build start: alkanes + O2 *)
    let start =
      List.map (fun (n, k) ->
        ((new Alkane.make_alkane n :> Molecule.molecule), k)
      ) scaled
      @ [((new Molecule.oxygen_gas :> Molecule.molecule), o2_coeff)]
    in
    (* Build result: CO2 + H2O *)
    let result = [
      ((new Molecule.carbon_dioxide :> Molecule.molecule), co2_coeff);
      ((new Molecule.water :> Molecule.molecule), h2o_coeff)
    ] in
    (start, result)

  method balance =
    let (start, result) = self#build_balanced in
    ({< _is_balanced = true; _start_mols = start; _result_mols = result >}
     :> Reaction.reaction)
end
