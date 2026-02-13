
let eu_dist (arr : float array) (arr1 : float array) : float =
  let sum_s = ref 0.0 in 
  for i = 0 to (Array.length arr -1) do
    let dif = arr.(i) -. arr1.(i) in
    sum_s := !sum_s +. (dif *. dif)
  done;
  sqrt !sum_s

let () =
  let point1 = [|1.0; 2.0; 3.2|] in
  let point2 = [|4.0; 6.0; 5.0|] in
  let distance = eu_dist point1 point2 in
  Printf.printf "Euclidean distance: %f\n" distance;

  let point2 = [|-1.0; 3.0; 5.3|] in
  let point3 = [|1.5; -4.3; 7.3|] in
  let euc_dist = eu_dist point2 point3 in 
  Printf.printf "Euclidean distance: %f\n" euc_dist;