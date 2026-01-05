let ft_print_comb () =
  let rec loop i j k first =
    if i <= 7 then
      begin
        if j <= 8 then
          begin
            if k <= 9 then
              begin
                if i < j && j < k then
                  begin
                    if not first then
                      print_string ", ";
                    print_int i;
                    print_int j;
                    print_int k;
                    loop i j (k + 1) false
                  end
                else
                  loop i j (k + 1) first
              end
            else
              loop i (j + 1) (j + 2) first
          end
        else
          loop (i + 1) (i + 2) (i + 3) first
      end
  in
  loop 0 1 2 true;
  print_char '\n'

let () =
  ft_print_comb ()