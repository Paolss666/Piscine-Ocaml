let () =
  let w = new Molecule.water in
  let co2 = new Molecule.carbon_dioxide in
  let nh3 = new Molecule.ammonia in
  let h2s = new Molecule.hydrogen_sulfide in
  let n2 = new Molecule.nitrogen_gas in

  Printf.printf "%s\n" w#to_string;
  Printf.printf "%s\n" co2#to_string;
  Printf.printf "%s\n" nh3#to_string;
  Printf.printf "%s\n" h2s#to_string;
  Printf.printf "%s\n" n2#to_string;

  Printf.printf "Water equals Water: %b\n" (w#equals (w :> Molecule.molecule));
  Printf.printf "Water equals CO2: %b\n" (w#equals (co2 :> Molecule.molecule))
