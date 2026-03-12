class doctor (name : string) (age : int)  (sidekick : People.people) =
  object (self)
    val _name : string = name
    val mutable _age : int = age
    val _sidekick : People.people = sidekick
    val mutable _hp : int = 100

    initializer 
      print_endline ("The " ^ _name ^ " doctor is born !") 
    

    method get_hp = _hp
    method to_string = _name ^ " " ^ (string_of_int _age) ^ " years old with " ^ (string_of_int _hp) ^ " HP and a sidekick named " ^ sidekick#to_string
    method talk = print_endline("Hi, I'm the Doctor !")
    method travel_in_time (start : int) (arrival : int) =
      let tmp_age = ref _age in
      if arrival < start then
       print_endline "The doctor is traveling to the past !"
      else 
        tmp_age  := !tmp_age + (arrival - start);
      print_endline {|
        ___________
       |  _______  |
       | |  TAR  | |
       | |  DIS  | |
       | |_______| |
       |___________|
       |  []   []  |
       |   _____   |
       |  | ~~~ |  |
       |  |_____|  |
       |___________|
          ||   ||
      |};
      Printf.printf "Traveled from %d to %d. Doctor is now %d years old.\n" start arrival !tmp_age
    
    method use_sonic_screwdriver =
      print_endline "Whiiiiwhiiiwhiii Whiiiiwhiiiwhiii Whiiiiwhiiiwhiii"
    
    method take_domage (attack : int) =
      _hp <- _hp - attack;
      if _hp <= 0 then begin
          print_endline "The doctor will die !";
          self#regenerate;
          print_endline "The doctor has regenerated !"
        end
      else
        Printf.printf "The doctor takes %d damage and has now %d HP.\n" attack _hp
    method private regenerate =  
      if (_hp == 100) then 
        print_endline "The doctor is already at full health !"
      else
      _hp <- 100;
    
    method do_damage (attack : int) (dalek: Dalek.dalek) =
      if attack < 0 || self#get_hp <= 0 then
        print_endline "The doctor can't attack !"
      else
        dalek#take_damage attack;

    end
