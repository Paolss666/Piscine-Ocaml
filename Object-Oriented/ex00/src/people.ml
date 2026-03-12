class people (name : string) = 
  object
    val name = name
    initializer
      Printf.printf "%s has been created!\n" name
    val mutable hp : int = 100
    method to_string = name  ^ " has " ^ (string_of_int hp)
    method talk = "I’m " ^ name ^ "! Do you know the Doctor?"
    method die = "Aaaarghh!"
    method damage = "Aie it's hurt " ^ (string_of_int (hp - 42))
  end
