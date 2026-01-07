let rec is_in elem lst = 
  match lst with
  | [] -> false
  | x :: xs ->
    if x = elem then true
    else is_in elem xs


let rec crossover lst lst1 = 
  match lst with
  | [] -> []
  | x :: xs ->
    if is_in x lst1 then x :: crossover xs lst1
    else crossover xs lst1


let rec print_list lst =
  match lst with
  | [] -> print_newline ()
  | x :: xs ->
      print_int x;
      print_string " ";
      print_list xs

let () =
  print_endline "Test 1:";
  let result1 = crossover [1; 2; 3; 4] [3; 4; 5; 6] in
  print_list result1;
  
  print_endline "Test 2:";
  let result2 = crossover [1; 2] [3; 4] in
  print_list result2;  
  
  print_endline "Test 3:";
  let result3 = crossover [] [1; 2; 3] in
  print_list result3;  
  
  print_endline "Test 4:";
  let result4 = crossover ['a'; 'b'; 'c'] ['b'; 'c'; 'd'] in
  List.iter (fun c -> Printf.printf "%c " c) result4;
  print_newline ()