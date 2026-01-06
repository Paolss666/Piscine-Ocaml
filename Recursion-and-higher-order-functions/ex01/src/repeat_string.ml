let repeat_string s n = 
  if n < 0 then
    "Error"
  else
    let rec loop i acc =
      if i >= n then
        acc
      else
        loop (i + 1) (acc ^ s)
    in
    loop 0 ""

let () =
 print_endline(repeat_string "lol" 3);
 print_endline(repeat_string "lol" (-1));
 print_endline(repeat_string "" 0);
 print_endline(repeat_string "WTF" 10);