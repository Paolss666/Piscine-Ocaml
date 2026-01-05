
let rec print_range current last =
  if current <= last then
    begin
      print_char (char_of_int current);
      print_range (current + 1) last
    end

let ft_print_alphabet () =
  print_range (int_of_char 'a') (int_of_char 'z');
  print_char '\n'



let () =

ft_print_alphabet();