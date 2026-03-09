(* Deduplicate alkane list by n, counting occurrences *)
let count_alkanes (alkanes : Alkane.alkane list) : (int * int) list =
  List.fold_left (fun acc a ->
    let n = a#n in
    match List.assoc_opt n acc with
    | None -> (n, 1) :: acc
    | Some k -> (n, k + 1) :: (List.filter (fun (x, _) -> x <> n) acc)
  ) [] alkanes

(* Compute smallest integer balanced coefficients *)
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
    let start =
      List.map (fun (n, k) ->
        ((new Alkane.make_alkane n :> Molecule.molecule), k)
      ) scaled
      @ [((new Molecule.oxygen_gas :> Molecule.molecule), o2_coeff)]
    in
    let result = [
      ((new Molecule.carbon_dioxide :> Molecule.molecule), co2_coeff);
      ((new Molecule.water :> Molecule.molecule), h2o_coeff)
    ] in
    (start, result)

  method balance =
    let (start, result) = self#build_balanced in
    ({< _is_balanced = true; _start_mols = start; _result_mols = result >}
     :> Reaction.reaction)

  (* Incomplete combustion: CnH(2n+2) + k*O2 -> a*CO2 + b*CO + c*C + d*H2O *)
  (* Vary k from k_min to k_max (below complete combustion) *)
  method get_incomplete_results : (int * (Molecule.molecule * int) list) list =
    let raw_counts = count_alkanes _alkanes in
    let n_total = List.fold_left (fun acc (n, k) -> acc + n * k) 0 raw_counts in
    let d = List.fold_left (fun acc (n, k) -> acc + (n+1) * k) 0 raw_counts in
    (* total_o_times_2 = 2 * (theoretical O2 for complete combustion) *)
    let total_o_times_2 = List.fold_left (fun acc (n, k) -> acc + k * (3*n+1)) 0 raw_counts in
    (* k_max: largest integer O2 strictly below complete combustion *)
    let k_max = (total_o_times_2 - 1) / 2 in
    (* k_min: smallest k such that we have enough O for H2O *)
    let k_min = (d + 1) / 2 in

    let make_products a b c =
      (if a > 0 then [((new Molecule.carbon_dioxide :> Molecule.molecule), a)] else []) @
      (if b > 0 then [((new Molecule.carbon_monoxide :> Molecule.molecule), b)] else []) @
      (if c > 0 then [((new Molecule.carbon_solid :> Molecule.molecule), c)] else []) @
      [((new Molecule.water :> Molecule.molecule), d)]
    in

    let rec collect_a m a_min a_max k =
      if a_min > a_max then []
      else
        let b = m - 2 * a_min in
        let c = n_total + a_min - m in
        let rest = collect_a m (a_min + 1) a_max k in
        if b = 0 && c = 0 then rest
        else (k, make_products a_min b c) :: rest
    in

    let rec collect_k k =
      if k > k_max then []
      else
        let m = 2 * k - d in
        (if m < 0 then []
        else
          let a_max = m / 2 in
          let a_min = max 0 (m - n_total) in
          collect_a m a_min a_max k)
        @ collect_k (k + 1)
    in
    collect_k k_min
end
