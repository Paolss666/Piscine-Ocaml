
type 'a ft_ref = { mutable contents : 'a }

let return x = { contents = x }

let get r = r.contents

let set r x = r.contents <- x

let bind r f = f (get r)


let () =
  let r = return 5 in
  Printf.printf "Initial value: %d\n" (get r);
  set r 10;
  Printf.printf "Updated value: %d\n" (get r);
  let result = bind r (fun x -> x * 2) in
  Printf.printf "Result of bind: %d\n" result