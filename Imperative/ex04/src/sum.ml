let sum ( n: float) ( m: float) : float =
  let result = ref 0.0 in 
  result := n +. m;
  !result



let () =
  let n = 1.0 in
  let m = 5.4 in
  let result1 = sum n m in
  let l = 4.3 in
  let p = 2.2 in
  let result = sum l p in
  Printf.printf "The sum from %.1f to %.1f is %.1f\n" l p result;
  Printf.printf "The sum from %.1f to %.1f is %.1f\n" n m result1;