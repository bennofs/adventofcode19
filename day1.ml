open Base
open Stdio

let calculate_fuel mass =
  max 0 ((mass / 3) - 2)

let rec fix_fuel fuel = if fuel = 0
  then 0
  else fuel + fix_fuel (calculate_fuel fuel)

let process_line (normal, fixed) line =
  let fuel = calculate_fuel (Int.of_string line)
  in (normal + fuel, fixed + fix_fuel fuel)

let (normal, fixed) = In_channel.fold_lines stdin ~init:(0, 0) ~f:process_line
let () = printf "%d %d\n" normal fixed
