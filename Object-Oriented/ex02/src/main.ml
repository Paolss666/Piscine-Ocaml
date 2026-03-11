let () =
  Random.self_init ();

  (* --- Create characters --- *)
  let rose    = new People.people "Rose Tyler" in
  let doctor  = new Doctor.doctor "The Doctor" 900 rose in
  let dalek   = new Dalek.dalek in

  print_endline "\n========== TO STRING ==========";
  print_endline doctor#to_string;
  print_endline rose#to_string;
  print_endline dalek#to_string;

  print_endline "\n========== TALK ==========";
  doctor#talk;
  dalek#talk;

  print_endline "\n========== SONIC SCREWDRIVER ==========";
  doctor#use_sonic_screwdriver;

  print_endline "\n========== TRAVEL IN TIME ==========";
  doctor#travel_in_time 900 1963;

  print_endline "\n========== EXTERMINATE ==========";
  dalek#exerminate rose;

  print_endline "\n========== DOCTOR TAKES DAMAGE ==========";
  doctor#take_domage 60;
  doctor#take_domage 60;  (* triggers regeneration *)

  print_endline "\n========== DALEK DIES ==========";
  dalek#die;

  print_endline "\n========== FINAL STATES ==========";
  print_endline doctor#to_string;
  print_endline dalek#to_string