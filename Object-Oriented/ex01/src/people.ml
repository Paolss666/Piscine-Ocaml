class people (name : string) = 
  object
    val name = name
    initializer
      Printf.printf "%s has been created!\n" name
    val htp : int = 100
    method to_string = name  ^ " has " ^ (string_of_int htp)
    method talk = "I’m " ^ name ^ "! Do you know the Doctor?"
    method die = "Aaaarghh!"
  end
