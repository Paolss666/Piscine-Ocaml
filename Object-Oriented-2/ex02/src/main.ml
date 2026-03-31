let () =
  let m = new Alkane.methane in
  let e = new Alkane.ethane in
  let o = new Alkane.octane in
  let propane = new Alkane.make_alkane 3 in
  let dodecane = new Alkane.make_alkane 12 in
  (* let zero = new Alkane.make_alkane 0 in *)

  Printf.printf "%s\n" m#to_string;
  Printf.printf "%s\n" e#to_string;
  Printf.printf "%s\n" o#to_string;
  Printf.printf "%s\n" propane#to_string;
  Printf.printf "%s\n" dodecane#to_string;
  Printf.printf "%s\n" zero#to_string;

  Printf.printf "Methane formula: %s\n" m#formula;
  Printf.printf "Methane equals Methane: %b\n" (m#equals (m :> Molecule.molecule)); (* upcast *)
  Printf.printf "Methane equals Ethane: %b\n" (m#equals (e :> Molecule.molecule))
