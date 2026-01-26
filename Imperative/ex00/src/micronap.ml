let my_sleep n = 
  let rem = ref n in
  while !rem > 0 do
    Unix.sleep 1;
    rem := !rem - 1
  done

let () =
  if Array.length Sys.argv < 2 then
      exit 1
  else 
    let n = int_of_string Sys.argv.(1)  in
    if n < 0 then
      exit 1
    else
      my_sleep n ;