let string_to_list s : char list =
  let rec aux i acc =
    if i < 0 then acc
    else aux (i - 1) (s.[i] :: acc)
  in
  aux (String.length s - 1) []


let rec count_consecutive elem list = 
  match list with
  | [] -> 0
  | x :: xs ->
      if x = elem then 1 + count_consecutive elem xs
      else 0

let rec skip n list = 
  match list with
  | [] -> []
  | x :: xs ->
      if n <= 0 then list
      else skip (n - 1) xs

let rec encode list = 
  match list with
  | [] -> []
  | x :: xs ->
      let count = 1 + count_consecutive x xs in
      let list_skipped = skip count list in
      (count, x) :: encode list_skipped


let rec print_result lst =
  match lst with
  | [] -> print_newline ()
  | (num, c) :: suiv ->
      Printf.printf "(%d, '%c') " num c;
      print_result suiv


let () =
  let str = "aaabbb" in
  let list = string_to_list str in
(*   print_string "to list: ";
  print_result (List.mapi (fun i c -> (1, c)) list); *)
  let result = encode list in
  print_string "to string: ";
  print_result result;
  

  let list2 = ['a'; 'a'; 'a'; 'b'; 'b'; 'c'] in
  let result2 = encode list2 in
  print_string "to list: ";
  print_result result2