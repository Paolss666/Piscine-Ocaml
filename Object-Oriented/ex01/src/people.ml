class people (name : string) = 
  object
    val _name = name
    initializer
      Printf.printf "%s has been created!\n" _name
    val mutable _hp : int = 100
    method to_string = _name  ^ " has " ^ (string_of_int _hp)
    method talk = "I’m " ^ _name ^ "! Do you know the Doctor?"
    method die = "Aaaarghh!"
  end
