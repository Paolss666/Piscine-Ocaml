
type nucleobase = A | T | C | G | None

type deoxyribose = string

type phosphate = string

type nucleotide = {
  nucleobase : nucleobase;
  deoxyribose : deoxyribose;
  phosphate : phosphate;
}

let generate_nucleotide ( c : char) : nucleotide =
  let base = match c with
    | 'A' -> A
    | 'T' -> T
    | 'C' -> C
    | 'G' -> G
    | _   -> None

  in
  {
    nucleobase = base;
    deoxyribose = "deoxyribose";
    phosphate = "phosphate";
  }

let nucleobase_to_string nb =
  match nb with
  | A -> "A"
  | T -> "T"
  | C -> "C"
  | G -> "G"
  | None -> "None"

let print_nucleotide n =
  Printf.printf "{ phosphate: %s, deoxyribose: %s, nucleobase: %s }\n"
    n.phosphate
    n.deoxyribose
    (nucleobase_to_string n.nucleobase)

let () =
  print_endline "=== Test generate_nucleotide ===\n";
  
  (* Test con 'A' *)
  print_string "Input: 'A' -> ";
  let n1 = generate_nucleotide 'A' in
  print_nucleotide n1;
  
  (* Test con 'T' *)
  print_string "Input: 'T' -> ";
  let n2 = generate_nucleotide 'T' in
  print_nucleotide n2;
  
  (* Test con 'C' *)
  print_string "Input: 'C' -> ";
  let n3 = generate_nucleotide 'C' in
  print_nucleotide n3;
  
  (* Test con 'G' *)
  print_string "Input: 'G' -> ";
  let n4 = generate_nucleotide 'G' in
  print_nucleotide n4;
  
  (* Test con carattere invalido *)
  print_string "\nInput: 'X' (invalido) -> ";
  let n5 = generate_nucleotide 'X' in
  print_nucleotide n5;
  
  print_string "Input: 'Z' (invalido) -> ";
  let n6 = generate_nucleotide 'Z' in
  print_nucleotide n6;
  
  print_string "Input: '1' (invalido) -> ";
  let n7 = generate_nucleotide '1' in
  print_nucleotide n7;