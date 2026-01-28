let () =
let module StringKey = struct
  type t = string
  let hash = Hashtbl.hash
  let equal = String.equal
end in

let module StringHashtbl = Hashtbl.Make(StringKey) in

Printf.printf "Using custom StringHashtbl:\n";
let ht = StringHashtbl.create 5 in
let values = [ "Hello"; "world"; "42"; "Ocaml"; "H" ] in
let pairs = List.map (fun s -> (s, String.length s)) values in
List.iter (fun (k,v) -> StringHashtbl.add ht k v) pairs;
StringHashtbl.iter (fun k v -> Printf.printf "k = \"%s\", v = %d\n" k v) ht

let ( ) =
Printf.printf "\nUsing built-in Hashtbl:\n";
let ht = Hashtbl.create 5 in
let values = [ "Hello"; "world"; "42"; "Ocaml"; "H" ] in
let pairs = List.map (fun s -> (s, String.length s))
  values in
List.iter (fun (k,v) -> Hashtbl.add ht k v) pairs;
Hashtbl.iter (fun k v -> Printf.printf "k = \"%s\", v = %d\n" k v) ht