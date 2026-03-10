let print_proj ((name, status, grade) : App.App.project) =
  Printf.printf "Project(%s, %s, %d)\n" name status grade

let () =
  let open App.App in

  let p1 = ("libft", "succeed", 90) in
  let p2 = ("push_swap", "succeed", 75) in
  let p3 = ("minishell", "failed", 0) in

  Printf.printf "-- print_proj --\n";
  print_proj p1;
  print_proj p2;
  print_proj p3;

  Printf.printf "\n-- zero --\n";
  print_proj zero;

  Printf.printf "\n-- combine --\n";
  print_proj (combine p1 p2);          (* avg 82 -> succeed *)
  print_proj (combine p1 p3);          (* avg 45 -> failed  *)
  print_proj (combine zero p1);        (* identity: avg 45 -> failed (0+90)/2=45 *)

  Printf.printf "\n-- fail / success --\n";
  print_proj (fail p1);
  print_proj (success p3)
