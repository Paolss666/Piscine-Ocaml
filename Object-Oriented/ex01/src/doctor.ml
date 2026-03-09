class doctor (name : string) (age : int)  (sidekick : People.people) =
  object (self)
    val nameb : string = name
    val mutable age : int = age
    val sidekick : People.people = sidekick
    val mutable htp : int = 100

    initializer 
      print_endline ("The doctor is born !")

    method to_string = name ^ " " ^ (string_of_int age) ^ " years old with " ^ (string_of_int htp) ^ " HP and a sidekick named " ^ sidekick#to_string
    method talk = "Hi, I'm the Doctor !"
    method travel_in_time (start : int) (arrival : int) =
      age <- age + (arrival - start);
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
      Printf.printf "Traveled from %d to %d. Doctor is now %d years old.\n" start arrival age
    
    method use_sonic_screwdriver =
      print_endline "Whiiiiwhiiiwhiii Whiiiiwhiiiwhiii Whiiiiwhiiiwhiii"
    
    method take_domage (attack : int) =
      htp <- htp - attack;
      if htp <= 0 then begin
          print_endline "The doctor will die !";
          self#regenerate;
          print_endline "The doctor has regenerated !"
        end
      else
        Printf.printf "The doctor takes %d damage and has now %d HP.\n" attack htp
    method private regenerate =  
      if (htp == 100) then 
        print_endline "The doctor is already at full health !"
      else
      htp <- 100;
  
    end