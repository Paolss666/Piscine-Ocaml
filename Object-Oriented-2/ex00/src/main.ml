let () =
  let h = new Atom.hydrogen in
  let c = new Atom.carbon in
  let o = new Atom.oxygen in
  let n = new Atom.nitrogen in
  let he = new Atom.helium in
  let s = new Atom.sulfur in

  Printf.printf "%s\n" h#to_string;
  Printf.printf "%s\n" c#to_string;
  Printf.printf "%s\n" o#to_string;
  Printf.printf "%s\n" n#to_string;
  Printf.printf "%s\n" he#to_string;
  Printf.printf "%s\n" s#to_string;

  Printf.printf "H equals H: %b\n" (h#equals (h :> Atom.atom));
  Printf.printf "H equals C: %b\n" (h#equals (c :> Atom.atom));
  Printf.printf "O equals O: %b\n" (o#equals (o :> Atom.atom))
