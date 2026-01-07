let rec count_elem elem list = 
  match list with
  | [] -> 0
  | x :: xs ->
    if x = elem then 1 + count_elem elem xs
    else 0

let rec skip n list = 
  match list with
  | [] -> []
  | x :: xs ->
    if n <= 0 then list
    else skip (n -1) xs



let rec encode list = 
  match list with
  | [] -> []
  | x :: xs ->
    let count = 1 + count_elem x xs in
    let list_skipped = skip count list in
    (count, x) :: encode list_skipped


let rec print_result lst =
  match lst with
  | [] -> print_newline ()
  | (num, lettera) :: resto ->
      Printf.printf "(%d, '%c') " num lettera;
      print_result resto

let () =
  let list = ['a'; 'a'; 'a'; 'b'; 'b'; 'c'] in
  let result = encode list in
  print_result result