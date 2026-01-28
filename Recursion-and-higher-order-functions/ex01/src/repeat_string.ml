let repeat_string ?(s="") n = 
  if n < 0 then
      "Error"
  else if s = "" then
    let rec loop i acc = 
      if i >= n then
        acc
      else
        loop (i + 1) (acc ^ "x")
    in
    loop 0 ""
  else
      let rec loop i acc =
        if i >= n then
          acc
        else
          loop (i + 1) (acc ^ s)
      in
      loop 0 ""

let () =
 print_endline(repeat_string  ~s:"toto" 3);
 print_endline(repeat_string ~s:"lol" (-1));
 print_endline(repeat_string 0);
 print_endline(repeat_string ~s:"WTF" 10);
print_endline(repeat_string  3);