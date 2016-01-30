
let rec null_terminated_string bits acc =
  bitmatch bits with
  | { c : 1*8 : int, unsigned, bigendian;
      rest : -1 : bitstring } ->
    if c = 0 then
      (rest, acc)
    else 
      let acc = acc ^ (String.make 1 (Char.chr c)) in
      null_terminated_string rest acc

let length_coded_string bits = 
  let (length, rest) = Mp_binary.length_coded_binary bits in
  bitmatch rest with
  | { s : 8 * (Int64.to_int length) : string;
      rest : -1 : bitstring } -> (s, rest)

let make_null_terminated_string s = 
  let null = String.make 1 (Char.chr 0) in
  s ^ null
