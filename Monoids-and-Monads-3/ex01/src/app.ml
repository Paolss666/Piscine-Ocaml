module App : sig
  type project = string * string * int
  val zero    : project
  val combine : project -> project -> project
  val fail    : project -> project
  val success : project -> project
end = struct
  type project = string * string * int

  let zero = ("", "", 0)

  (* Merge two projects: concatenate names, average grades, derive status *)
  let combine (n1, _, g1) (n2, _, g2) =
    let avg = (g1 + g2) / 2 in
    let status = if avg > 80 then "succeed" else "failed" in
    (n1 ^ n2, status, avg)

  (* Mark project as failed: grade 0, status "failed" *)
  let fail (name, _, _) = (name, "failed", 0)

  (* Mark project as successful: grade 80, status "succeed" *)
  let success (name, _, _) = (name, "succeed", 80)
end
