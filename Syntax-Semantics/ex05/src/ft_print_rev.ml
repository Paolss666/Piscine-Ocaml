let ft_print_rev s =
  let rec loop i =
    if i < 0 then
      print_char '\n'
    else begin
      print_char (String.get s i);
      loop (i - 1)
    end
  in
  loop (String.length s - 1)

let () = 
  ft_print_rev "Hello World";
  ft_print_rev ""