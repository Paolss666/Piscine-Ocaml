let examples_of_file (file_name : string) : (float array * string) list =
  (* Check if file ends with .csv *)
  let len = String.length file_name in
  if len < 4 || String.sub file_name (len - 4) 4 <> ".csv" then begin
    Printf.printf "File %s is not a CSV file.\n" file_name;
    []
  end
  else if not (Sys.file_exists file_name) then begin
    Printf.printf "File %s does not exist.\n" file_name;
    []
  end
  else
    let examples = ref [] in
    let ic = open_in file_name in
    (try
      while true do
        let line = input_line ic in
        let parts = String.split_on_char ',' line in
        let len_parts = List.length parts in
        if len_parts > 0 then
          let class_label = List.nth parts (len_parts - 1) in
          let features = List.init (len_parts - 1) (fun i -> 
            float_of_string (List.nth parts i)
          ) in
          let feature_array = Array.of_list features in
          examples := (feature_array, class_label) :: !examples
      done;
      []
    with End_of_file ->
      close_in ic;
      List.rev !examples
    )

let () =
  if Array.length Sys.argv <> 2 then
    Printf.printf "Usage: %s <file_name>\n" Sys.argv.(0)
  else 
    let file_name = Sys.argv.(1) in
    let examples = examples_of_file file_name in
    Printf.printf "Loaded %d examples\n" (List.length examples);
    (*
    List.iter (fun (features, label) ->
      Printf.printf "Label: %s, Features: [" label;
      Array.iter (fun f -> Printf.printf "%f; " f) features;
      Printf.printf "]\n"
    ) examples *)