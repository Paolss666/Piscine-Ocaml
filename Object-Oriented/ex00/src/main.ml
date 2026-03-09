let () = 
  let people = new People.people "TONY" in
  print_endline (people#to_string);
  print_endline (people#talk);
  print_endline (people#die)