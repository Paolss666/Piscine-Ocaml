let rec iter (f : int -> int) (x : int) (n : int) : int =
  if n < 0 then
    -1
  else if n = 0 then
    x
  else
    iter f (f x) (n - 1)


let () = 
  print_endline (string_of_int (iter (fun a -> a * a) 2 4));
  print_endline (string_of_int (iter (fun a -> a * 2) 2 4));
  print_endline (string_of_int (iter (fun a -> a - 1) 10 0));
  print_endline (string_of_int (iter (fun a -> a * a) 2 3));