
class dalek =
  object(self)
  val name = "Dalek" ^ (string_of_int (Random.int 1000))
  val mutable htp = 100
  val mutable shield = true
  initializer
    print_endline (name ^ " has been created !")
  
  method to_string = name ^ " has " ^ (string_of_int htp) ^ " HP"


  method talk =
      let phrases = [|
        "Explain! Explain!";
        "Exterminate! Exterminate!";
        "I obey!";
        "You are the Doctor! You are the enemy of the Daleks!"
      |] in
      print_endline phrases.(Random.int (Array.length phrases))

  method exerminate (target: People.people) =
    print_endline (name ^ " exerminate "^ target#get_name);
    shield <- false;
    target#die

    method die = 
    print_endline "Emergency Temporal Shift!";
    htp <- 0
  end

