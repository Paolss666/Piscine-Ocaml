let is_eq c l = c = l

let ft_is_palindrome s =
  let rec loop i l =
    if i >= String.length s then
      true
    else if not (is_eq (String.get s i) (String.get s l) )then
      false
    else begin
      loop (i + 1) (l - 1)
    end
  in
  loop 0 (String.length s -1)
  

let () = 
  let result = ft_is_palindrome "radar" in
  print_string (string_of_bool result)