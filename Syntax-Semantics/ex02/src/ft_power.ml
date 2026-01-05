let rec ft_power n l =
  if l = 0 then
    1
  else if l < 0 then
    0
  else
    n * (ft_power n (l - 1))

let () =
  print_endline "Test 1 - 2^4:";
  print_int (ft_power 2 4);
  print_char '\n';
  
  print_endline "\nTest 2 - 3^0:";
  print_int (ft_power 3 0);
  print_char '\n';
  
  print_endline "\nTest 3 - 0^5:";
  print_int (ft_power 0 5);
  print_char '\n';
  
  print_endline "\nTest 4 - 5^3:";
  print_int (ft_power 5 3);
  print_char '\n'