class people (name : string) = 
  object
    val _name = name
    initializer
      Printf.printf "%s has been created!\n" name
    val mutable _hp : int = 100
    method get_name = _name
    method to_string = _name  ^ " has " ^ (string_of_int _hp)
    method talk = "I’m " ^ _name ^ "! Do you know the Doctor?"
    method die = 
      if _hp <= 0 then
        print_endline "Aaaarghh! Im already dead !"
      else
      _hp <- 0;
      print_endline "Aaaarghh!"
  end
