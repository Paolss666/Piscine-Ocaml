let jokes (): unit =
  let array = [|
    "Why do programmers prefer dark mode? Because light attracts bugs!";
    "How many programmers does it take to change a light bulb? None. It's a hardware problem!";
    "Why do Java developers wear glasses? Because they don't see sharp!";
    "What is a programmer's favorite hangout place? Foo Bar!";
    "Why do programmers hate nature? It has too many bugs!";
    "What do you call a group of 8 hobbits? A hobbyte!"
  |] in 
  Random.self_init ();
  let idx = Random.int (Array.length array) in
  let question = array.(idx) in
  Printf.printf "%s\n" question




let () = jokes() 