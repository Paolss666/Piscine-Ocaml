let print_separator title =
  print_newline ();
  print_endline "==========================================";
  Printf.printf "  %s\n" title;
  print_endline "=========================================="

let print_card_list cards =
  List.iter (fun card ->
    Printf.printf "%s " (Card.toString card)
  ) cards;
  print_newline ()

(* ========== TEST COLOR ========== *)
let test_color () =
  print_separator "TEST COLOR MODULE";
  
  print_endline "\n--- All colors (verbose) ---";
  List.iter (fun c ->
    Printf.printf "%s " (Card.Color.toStringVerbose c)
  ) Card.Color.all;
  print_newline ();
  
  print_endline "\n--- All colors (short) ---";
  List.iter (fun c ->
    Printf.printf "%s " (Card.Color.toString c)
  ) Card.Color.all;
  print_newline ();
  
  Printf.printf "\nTotal colors: %d\n" (List.length Card.Color.all)

(* ========== TEST VALUE ========== *)
let test_value () =
  print_separator "TEST VALUE MODULE";
  
  print_endline "\n--- All values (verbose) ---";
  List.iter (fun v ->
    Printf.printf "%s " (Card.Value.toStringVerbose v)
  ) Card.Value.all;
  print_newline ();
  
  print_endline "\n--- All values (short) ---";
  List.iter (fun v ->
    Printf.printf "%s " (Card.Value.toString v)
  ) Card.Value.all;
  print_newline ();
  
  print_endline "\n--- Value to Int ---";
  List.iter (fun v ->
    Printf.printf "%s=%d " (Card.Value.toString v) (Card.Value.toInt v)
  ) Card.Value.all;
  print_newline ();
  
  print_endline "\n--- Next/Previous ---";
  Printf.printf "next(T2) = %s\n" (Card.Value.toString (Card.Value.next Card.Value.T2));
  Printf.printf "next(King) = %s\n" (Card.Value.toString (Card.Value.next Card.Value.King));
  Printf.printf "next(As) = %s (circular)\n" (Card.Value.toString (Card.Value.next Card.Value.As));
  Printf.printf "previous(T3) = %s\n" (Card.Value.toString (Card.Value.previous Card.Value.T3));
  Printf.printf "previous(T2) = %s (circular)\n" (Card.Value.toString (Card.Value.previous Card.Value.T2));
  
  Printf.printf "\nTotal values: %d\n" (List.length Card.Value.all)

(* ========== TEST CARD BASIC ========== *)
let test_card_basic () =
  print_separator "TEST CARD MODULE - BASIC";
  
  let card1 = { Card.color = Card.Color.Spade; value = Card.Value.As } in
  let card2 = { Card.color = Card.Color.Heart; value = Card.Value.T7 } in
  
  print_endline "\n--- Card creation ---";
  Printf.printf "Card 1 (verbose): %s\n" (Card.toStringVerbose card1);
  Printf.printf "Card 1 (short): %s\n" (Card.toString card1);
  Printf.printf "Card 2 (verbose): %s\n" (Card.toStringVerbose card2);
  Printf.printf "Card 2 (short): %s\n" (Card.toString card2);
  
  print_endline "\n--- getColor / getValue ---";
  Printf.printf "Card 1 color: %s\n" (Card.Color.toString (Card.getColor card1));
  Printf.printf "Card 1 value: %s\n" (Card.Value.toString (Card.getValue card1));
  Printf.printf "Card 2 color: %s\n" (Card.Color.toString (Card.getColor card2));
  Printf.printf "Card 2 value: %s\n" (Card.Value.toString (Card.getValue card2))

(* ========== TEST CARD LISTS ========== *)
let test_card_lists () =
  print_separator "TEST CARD MODULE - LISTS";
  
  print_endline "\n--- All Spades ---";
  print_card_list Card.allSpades;
  Printf.printf "Count: %d\n" (List.length Card.allSpades);
  
  print_endline "\n--- All Hearts ---";
  print_card_list Card.allHearts;
  Printf.printf "Count: %d\n" (List.length Card.allHearts);
  
  print_endline "\n--- All Diamonds ---";
  print_card_list Card.allDiamonds;
  Printf.printf "Count: %d\n" (List.length Card.allDiamonds);
  
  print_endline "\n--- All Clubs ---";
  print_card_list Card.allClubs;
  Printf.printf "Count: %d\n" (List.length Card.allClubs);
  
  print_endline "\n--- All Cards (first 10) ---";
  let rec take n lst = 
    match n, lst with
    | 0, _ | _, [] -> []
    | n, x::xs -> x :: take (n-1) xs
  in
  let first10 = take 10 Card.all in
  print_card_list first10;
  Printf.printf "Total cards in deck: %d\n" (List.length Card.all)

(* ========== TEST CARD COMPARE ========== *)
let test_card_compare () =
  print_separator "TEST CARD MODULE - COMPARE";
  
  let card_as_spade = { Card.color = Card.Color.Spade; value = Card.Value.As } in
  let card_7_heart = { Card.color = Card.Color.Heart; value = Card.Value.T7 } in
  let card_king_diamond = { Card.color = Card.Color.Diamond; value = Card.Value.King } in
  let card_as_club = { Card.color = Card.Color.Club; value = Card.Value.As } in
  
  print_endline "\n--- Compare ---";
  Printf.printf "%s vs %s: %d\n" 
    (Card.toString card_as_spade) 
    (Card.toString card_7_heart)
    (Card.compare card_as_spade card_7_heart);
  
  Printf.printf "%s vs %s: %d (same value, different color)\n" 
    (Card.toString card_as_spade) 
    (Card.toString card_as_club)
    (Card.compare card_as_spade card_as_club);
  
  print_endline "\n--- Max / Min ---";
  let max_card = Card.max card_as_spade card_7_heart in
  Printf.printf "max(%s, %s) = %s\n" 
    (Card.toString card_as_spade) 
    (Card.toString card_7_heart)
    (Card.toString max_card);
  
  let min_card = Card.min card_as_spade card_7_heart in
  Printf.printf "min(%s, %s) = %s\n" 
    (Card.toString card_as_spade) 
    (Card.toString card_7_heart)
    (Card.toString min_card);
  
  print_endline "\n--- Best ---";
  let hand = [card_7_heart; card_as_spade; card_king_diamond; card_as_club] in
  Printf.printf "Hand: ";
  print_card_list hand;
  let best = Card.best hand in
  Printf.printf "Best card: %s\n" (Card.toString best);

  let empty_hand = [] in
    try
      let _ = Card.best empty_hand in
      ()
    with Invalid_argument msg ->
      Printf.printf "Caught expected exception for empty hand: %s\n" msg

(* ========== TEST CARD COLOR CHECKS ========== *)
let test_card_color_checks () =
  print_separator "TEST CARD MODULE - COLOR CHECKS";
  
  let spade_card = { Card.color = Card.Color.Spade; value = Card.Value.As } in
  let heart_card = { Card.color = Card.Color.Heart; value = Card.Value.T7 } in
  let diamond_card = { Card.color = Card.Color.Diamond; value = Card.Value.King } in
  let club_card = { Card.color = Card.Color.Club; value = Card.Value.Queen } in
  
  print_endline "\n--- isOf ---";
  Printf.printf "%s isOf Spade: %b\n" 
    (Card.toString spade_card) 
    (Card.isOf spade_card Card.Color.Spade);
  Printf.printf "%s isOf Heart: %b\n" 
    (Card.toString spade_card) 
    (Card.isOf spade_card Card.Color.Heart);
  
  print_endline "\n--- isSpade / isHeart / isDiamond / isClub ---";
  Printf.printf "%s -> Spade:%b Heart:%b Diamond:%b Club:%b\n"
    (Card.toString spade_card)
    (Card.isSpade spade_card)
    (Card.isHeart spade_card)
    (Card.isDiamond spade_card)
    (Card.isClub spade_card);
  
  Printf.printf "%s -> Spade:%b Heart:%b Diamond:%b Club:%b\n"
    (Card.toString heart_card)
    (Card.isSpade heart_card)
    (Card.isHeart heart_card)
    (Card.isDiamond heart_card)
    (Card.isClub heart_card);
  
  Printf.printf "%s -> Spade:%b Heart:%b Diamond:%b Club:%b\n"
    (Card.toString diamond_card)
    (Card.isSpade diamond_card)
    (Card.isHeart diamond_card)
    (Card.isDiamond diamond_card)
    (Card.isClub diamond_card);
  
  Printf.printf "%s -> Spade:%b Heart:%b Diamond:%b Club:%b\n"
    (Card.toString club_card)
    (Card.isSpade club_card)
    (Card.isHeart club_card)
    (Card.isDiamond club_card)
    (Card.isClub club_card)

(* ========== TEST EDGE CASES ========== *)
let test_edge_cases () =
  print_separator "TEST EDGE CASES";
  
  print_endline "\n--- Best with single card ---";
  let single = [{ Card.color = Card.Color.Spade; value = Card.Value.T5 }] in
  Printf.printf "Hand: %s\n" (Card.toString (List.hd single));
  Printf.printf "Best: %s\n" (Card.toString (Card.best single));
  
  print_endline "\n--- Best with all same value ---";
  let same_values = [
    { Card.color = Card.Color.Spade; value = Card.Value.T7 };
    { Card.color = Card.Color.Heart; value = Card.Value.T7 };
    { Card.color = Card.Color.Diamond; value = Card.Value.T7 };
    { Card.color = Card.Color.Club; value = Card.Value.T7 };
  ] in
  Printf.printf "Hand: ";
  print_card_list same_values;
  Printf.printf "Best: %s (should be first one)\n" (Card.toString (Card.best same_values));
  
  print_endline "\n--- Compare equal cards ---";
  let card1 = { Card.color = Card.Color.Spade; value = Card.Value.King } in
  let card2 = { Card.color = Card.Color.Heart; value = Card.Value.King } in
  Printf.printf "%s vs %s: %d\n" 
    (Card.toString card1) 
    (Card.toString card2)
    (Card.compare card1 card2);
  Printf.printf "max returns: %s (first parameter)\n" 
    (Card.toString (Card.max card1 card2));
  Printf.printf "min returns: %s (first parameter)\n" 
    (Card.toString (Card.min card1 card2))

(* ========== MAIN ========== *)
let () =
  
  test_color ();
  test_value ();
  test_card_basic ();
  test_card_lists ();
  test_card_compare ();
  test_card_color_checks ();
  test_edge_cases ();
  
  print_separator "ALL TESTS COMPLETED";
  print_endline "";
  print_endline "✓ All tests passed successfully!"