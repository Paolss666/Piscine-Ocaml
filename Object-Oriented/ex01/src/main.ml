let () =
  let rose = new People.people "Rose Tyler"  in
  let doctor = new Doctor.doctor "The Doctor" 90 rose in

  print_endline "\n--- to_string ---";
  print_endline doctor#to_string;

  print_endline "\n--- talk ---";
  doctor#talk;

  print_endline "\n--- travel_in_time ---";
  doctor#travel_in_time 900 1963;

  print_endline "\n--- use_sonic_screwdriver ---";
  doctor#use_sonic_screwdriver;

  print_endline "\n--- take damage until regeneration ---";
  doctor#take_domage 80;
  doctor#take_domage 30;

  print_endline "\n--- final state ---";
  print_endline doctor#to_string