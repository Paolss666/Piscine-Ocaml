module type FIXED = sig
  type t
  val of_float : float -> t
  val of_int : int -> t
  val to_float : t -> float
  val to_int : t -> int
  val to_string : t -> string
  val zero : t
  val one : t
  val succ : t -> t
  val pred : t -> t
  val min : t -> t -> t
  val max : t -> t -> t
  val gth : t -> t -> bool
  val lth : t -> t -> bool
  val gte : t -> t -> bool
  val lte : t -> t -> bool
  val eqp : t -> t -> bool
  val eqs : t -> t -> bool
  val add : t -> t -> t
  val sub : t -> t -> t
  val mul : t -> t -> t
  val div : t -> t -> t
  val foreach : t -> t -> (t -> unit) -> unit
end

module Make (Config : sig val bits : int end) : FIXED = struct
  type t = int
  
  let scale = 1 lsl Config.bits  (* 2^bits, es: 2^4 = 16 *)
  let scale_f = float_of_int scale
  
  let of_float f = int_of_float (f *. scale_f)
  let of_int i = i * scale
  let to_float x = float_of_int x /. scale_f
  let to_int x = x / scale
  
  let to_string x = 
    Printf.sprintf "%.2f" (to_float x)
  
  let zero = 0
  let one = scale
  
  let succ x = x + scale
  let pred x = x - scale
  
  let min x y = if x < y then x else y
  let max x y = if x > y then x else y
  let gth x y = x > y
  let lth x y = x < y
  let gte x y = x >= y
  let lte x y = x <= y
  let eqp x y = x == y  (* physical equality *)
  let eqs x y = x = y   (* structural equality *)
  
  let add x y = x + y
  let sub x y = x - y
  
  let mul x y = (x * y) / scale
  
  let div x y = (x * scale) / y
  
  let foreach start stop f =
    let rec loop current =
      if current < stop then begin
        f current;
        loop (succ current)
      end
    in
    loop start
end

module Fixed4 : FIXED = Make (struct let bits = 4 end)
module Fixed8 : FIXED = Make (struct let bits = 8 end)

let () =
  let x8 = Fixed8.of_float 21.10 in
  let y8 = Fixed8.of_float 21.32 in
  let r8 = Fixed8.add x8 y8 in
  print_endline (Fixed8.to_string r8);
  
  Fixed4.foreach (Fixed4.zero) (Fixed4.one) (fun f -> 
    print_endline (Fixed4.to_string f)
  );

  let f4_a = Fixed4.of_float 21.05 in 
  let f4_b = Fixed4.of_int 10 in 
  Printf.printf "Fixed4.of_float 21.5 = %s\n" (Fixed4.to_string f4_a);
  Printf.printf "Fixed4.of_int 10 = %s\n" (Fixed4.to_string f4_b);
  Printf.printf "Fixed4.to_float (21.5) = %.2f\n" (Fixed4.to_float f4_a);
  Printf.printf "Fixed4.to_int (21.5) = %d\n\n" (Fixed4.to_int f4_a);
  
  Printf.printf "--- COST ---\n";
  Printf.printf "Fixed4.zero = %s\n" (Fixed4.to_string Fixed4.zero);
  Printf.printf "Fixed4.one = %s\n\n" (Fixed4.to_string Fixed4.one);
  
  Printf.printf "--- SUCC/PRED ---\n";
  let x = Fixed4.of_float 5.5 in
  Printf.printf "x = %s\n" (Fixed4.to_string x);
  Printf.printf "succ(x) = %s\n" (Fixed4.to_string (Fixed4.succ x));
  Printf.printf "pred(x) = %s\n\n" (Fixed4.to_string (Fixed4.pred x));
  
  Printf.printf "--- ADD ---\n";
  let x8 = Fixed8.of_float 21.10 in
  let y8 = Fixed8.of_float 21.32 in
  let r8 = Fixed8.add x8 y8 in
  Printf.printf "21.10 + 21.32 = %s\n\n" (Fixed8.to_string r8);
  
  Printf.printf "--- SUB ---\n";
  let a = Fixed4.of_float 100.5 in
  let b = Fixed4.of_float 30.25 in
  let diff = Fixed4.sub a b in
  Printf.printf "100.5 - 30.25 = %s\n\n" (Fixed4.to_string diff);



  Printf.printf "----- DIV ----\n";
  let dv1 = Fixed4.of_float 2.2 in
  let dv2 = Fixed4.of_float 22.22 in
  let div = Fixed4.div dv2 dv1 in 
  Printf.printf "22.22 / 2.2 = %s\n\n" (Fixed4.to_string div);


  Printf.printf "----- OPERATORS  ----\n";
  let c1 = Fixed8.of_float 10.5 in
  let c2 = Fixed8.of_float 20.3 in
  let c3 = Fixed8.of_float 10.5 in
  Printf.printf "10.5 > 20.3 = %b\n" (Fixed8.gth c1 c2);
  Printf.printf "10.5 < 20.3 = %b\n" (Fixed8.lth c1 c2);
  Printf.printf "10.5 >= 10.5 = %b\n" (Fixed8.gte c1 c3);
  Printf.printf "10.5 <= 10.5 = %b\n" (Fixed8.lte c1 c3);
  Printf.printf "10.5 == 10.5 (physical) = %b\n" (Fixed8.eqp c1 c3);
  Printf.printf "10.5 = 10.5 (structural) = %b\n\n" (Fixed8.eqs c1 c3);
  

  Printf.printf "--- TEST ---\n";
  Printf.printf "Fixed4 (4 bits): 1/16 = %s\n" 
    (Fixed4.to_string (Fixed4.of_float (1.0 /. 16.0)));
    
  let neg1 = Fixed8.of_float (-5.5) in
  let neg2 = Fixed8.of_float 3.2 in
  Printf.printf "-5.5 + 3.2 = %s\n" (Fixed8.to_string (Fixed8.add neg1 neg2));

  Printf.printf "--- FOREACH (Fixed8: 10. to 0.5) ---\n";
  let half8 = Fixed8.of_float 10. in
  let count = ref 0 in
  Fixed8.foreach (Fixed8.zero) half8 (fun f -> 
    Printf.printf "%s " (Fixed8.to_string f);
    incr count;
    if !count mod 5 = 0 then Printf.printf "\n"
  );