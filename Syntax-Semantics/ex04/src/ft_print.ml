let ft_print () =
  let rec loop i j = 
    if i <= 7 then (
      if j <= 8 then (
        if i < j then (
          print_int i;
          print_int j;
          print_char ' ';
          loop i (j + 1)
        )
        else
          loop i (j + 1)
      )
      else
        loop (i + 1)(i + 2)
    )
  in 
  loop 0 1;
  print_char '\n'

let () = 
  ft_print()