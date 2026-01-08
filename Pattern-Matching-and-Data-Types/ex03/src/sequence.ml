(* sequence 1 -> 11 -> 21 -> 1211 -> 111221*)


let rec count elem str pos = 
  if pos >= String.length str then 0
  else if String.get str pos = elem then 1 + count elem str (pos + 1)
  else 0


let read_string str = 
  let rec aux pos acc = 
    if pos >= String.length str then acc
    else
      let current_char = String.get str pos in 
      let cnt = count current_char str pos in
      let new_acc = string_of_int cnt ^ String.make 1 current_char in (*make ->number of char and char*)
      aux (pos + cnt) (acc ^ new_acc)
      in aux 0 ""


let rec sequence n = 
  if n <= 0 then ""
  else if n = 1 then "1"
  else read_string (sequence (n - 1))


let () =
  let one = sequence 1 in
  Printf.printf "Sequence(1): %s\n" one;
  let two = sequence 2 in
  Printf.printf "Sequence(2): %s\n" two;
  let three = sequence 3 in
  Printf.printf "Sequence(3): %s\n" three;
  let five = sequence 5 in
  Printf.printf "Sequence(5): %s\n" five;
  let six = 6 in
  let result = sequence six in
  Printf.printf "Sequence(%d): %s\n" six result;
  let seven = 7 in
  let result = sequence seven in
  Printf.printf "Sequence(%d): %s\n" seven result;
  let eight = 8 in
  let result = sequence eight in
  Printf.printf "Sequence(%d): %s\n" eight result;