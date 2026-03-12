let random_string n =
  let gen () =
    let chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz" in
    chars.[Random.int (String.length chars)]
  in
  String.init n (fun _ -> gen ())

class dalek =
  object (self)
    val _name = "Dalek" ^ (random_string 3)
    val mutable _hp = 100
    val mutable _shield = true

    initializer
      print_endline (_name ^ " has been created !")

    method to_string = _name ^ " has " ^ (string_of_int _hp) ^ " HP"

    method talk =
      let phrases = [|
        "Explain! Explain!";
        "Exterminate! Exterminate!";
        "I obey!";
        "You are the Doctor! You are the enemy of the Daleks!"
      |] in
      print_endline phrases.(Random.int (Array.length phrases))

    method exterminate (target: People.people) =
      print_endline (_name ^ " exterminate " ^ target#get_name);
      target#die

    method die =
      print_endline "Emergency Temporal Shift!";
      _hp <- 0

    method take_damage (attack : int) =
      if _shield then begin
        _shield <- false;
        print_endline "The dalek's shield absorbed the attack !"
      end else begin
        _hp <- _hp - attack;
        if _hp <= 0 then
          self#die
        else
          Printf.printf "The dalek takes %d damage and has now %d HP.\n" attack _hp
      end
  end