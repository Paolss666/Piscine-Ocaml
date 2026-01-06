let repeat_x n = 
  if n < 0 then
    "Error"
  else
    let rec loop i acc =
      if i >= n then
        acc
      else
        loop (i + 1) (acc ^ "x")
    in
    loop 0 ""

let () =
 print_endline(repeat_x 3);
 print_endline(repeat_x (-1));
 print_endline(repeat_x 10);
 print_endline(repeat_x 0)