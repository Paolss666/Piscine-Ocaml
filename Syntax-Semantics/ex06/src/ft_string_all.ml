let is_digit c = c >= '0' && c <= '9'

let ft_string_all s = 
  let rec loop i =
    if i >= String.length s then
      true
    else if not (is_digit (String.get s i) )then
      false
    else begin
      loop (i + 1)
    end
  in
  loop 0
  

(*let () = 
  let result = ft_string_all "2345678" in
  print_string (string_of_bool result)*)