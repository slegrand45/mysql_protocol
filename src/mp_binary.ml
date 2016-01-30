let length_coded_binary bits = 
  bitmatch bits with
  | { byte1 : 1*8 : int, unsigned, bigendian;
      rest : -1 : bitstring } -> (
        let length = Bitstring.bitstring_length rest in
        if byte1 <= 250 then (* one byte integer *) 
          (Int64.of_int byte1, rest)
          (* 251 : NULL value and only in a row data packet
            this special value is handled in the row data packet function *)
        else if byte1 = 251 then (* NULL value *)
          (Int64.of_int byte1, rest)
        else if byte1 = 252 then (* two bytes integer *)
          let () = 
            if (length < 2*8) then (
              failwith (Printf.sprintf "Bad length (2 bytes expected but %u bits available) in length coded binary" length)
            )
          in
          bitmatch rest with
          | { i : 2*8 : int, unsigned, littleendian;
              rest : -1 : bitstring } -> 
                (Int64.of_int i, rest)
        else if byte1 = 253 then (* three bytes integer *)
          let () = 
            if (length < 3*8) then (
              failwith (Printf.sprintf "Bad length (3 bytes expected but %u bits available) in length coded binary" length)
            )
          in
          bitmatch rest with
          | { i : 3*8 : int, unsigned, littleendian;
              rest : -1 : bitstring } -> 
              (Int64.of_int i, rest)
        else if byte1 = 254 then (* height bytes integer *)
          let () = 
            if (length < 8*8) then (
              failwith (Printf.sprintf "Bad length (8 bytes expected but %u bits available) in length coded binary" length)
            )
          in
          bitmatch rest with
          | { i : 8*8 : int, unsigned, littleendian; (* /!\ unsigned 64 bits *)
              rest : -1 : bitstring } -> 
              (i, rest)
        else (
          failwith (Printf.sprintf "Unknown byte1 = %u in length coded binary" byte1)
        )
    )

let build_length_coded_binary length =
  if (length <= 250) then
    BITSTRING 
      { length : 1*8 : int, unsigned, littleendian }
  else if (length <= 65536) then
    BITSTRING 
      { 252 : 1*8 : int, unsigned, littleendian;
        length : 2*8 : int, unsigned, littleendian }
  else if (length <= 16777216) then
    BITSTRING 
      { 253 : 1*8 : int, unsigned, littleendian;
        length : 3*8 : int, unsigned, littleendian }
  else 
    let length = Int64.of_int length in
    BITSTRING 
      { 254 : 1*8 : int, unsigned, littleendian;
        length : 8*8 : int, unsigned, littleendian }
