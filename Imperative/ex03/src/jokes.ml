let jokes text : unit =
  (* reading from a file.txt *)
  let array = ref [||] in
  let ic = open_in text in
   (try
    while true do
      let line = input_line ic in
      array := Array.append !array [|line|]
    done 
  with End_of_file ->
    close_in ic;
  );

  Random.self_init ();
  let idx = Random.int (Array.length !array) in
  let question = !array.(idx) in
  Printf.printf "%s\n" question




let () =
if Array.length Sys.argv <> 2 then
  Printf.printf "Usage: %s <jokes_file>\n" Sys.argv.(0)
else if not (Sys.argv.(1) = "jokes.txt") then
  Printf.printf "Please provide a valid jokes file (jokes.txt)\n"
else
  jokes Sys.argv.(1)