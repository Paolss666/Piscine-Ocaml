(* Alkane names for n = 1..12 *)
let alkane_names = [|
  ""; "methane"; "ethane"; "propane"; "butane"; "pentane";
  "hexane"; "heptane"; "octane"; "nonane"; "decane"; "undecane"; "dodecane"
|]

(* Build atom list for CnH(2n+2) *)
let build_alkane_atoms (n : int) : Atom.atom list =
  let carbons = List.init n (fun _ -> (new Atom.carbon : Atom.atom)) in
  let hydrogens = List.init (2 * n + 2) (fun _ -> (new Atom.hydrogen : Atom.atom)) in
  carbons @ hydrogens

(* Virtual alkane class *)
class virtual alkane (n : int) =
object
  val _n = n
  method n : int = n
  inherit Molecule.molecule (alkane_names.(n)) (build_alkane_atoms n)

  method virtual to_string : string
  method virtual equals : Molecule.molecule -> bool
end

(* Generic alkane constructor *)
class make_alkane (n : int) =
object
    inherit alkane n
  initializer 
    if n < 1 || n > 12 then failwith "Alkane n must be between 1 and 12 inclusive"
  method to_string =
    Printf.sprintf "Alkane: %s (Formula: %s, n=%d)" alkane_names.(n)
      (Molecule.compute_formula (build_alkane_atoms n)) n
  method equals (other : Molecule.molecule) =
    other#formula = Molecule.compute_formula (build_alkane_atoms n)
end

class methane =
object
  inherit make_alkane 1
end

class ethane =
object
  inherit make_alkane 2
end

class octane =
object
  inherit make_alkane 8
end
