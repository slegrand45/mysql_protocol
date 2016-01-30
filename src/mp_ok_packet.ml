
type ok_packet = {
  ok_affected_rows : Int64.t;
  ok_insert_id : Int64.t;
  ok_server_status : int;
  ok_warning_count : int;
  ok_message : string;
}

let ok_packet_to_string p = 
  let s = "" in
  let s = s ^ (Printf.sprintf "ok_affected_rows : %Lu\n" p.ok_affected_rows) in
  let s = s ^ (Printf.sprintf "ok_insert_id : %Lu\n" p.ok_insert_id) in
  let s = s ^ (Printf.sprintf "ok_server_status : %u\n" p.ok_server_status) in
  let s = s ^ (Printf.sprintf "ok_warning_count : %u\n" p.ok_warning_count) in
  let s = s ^ (Printf.sprintf "ok_message : %s\n" p.ok_message) in
  s

let ok_packet bits = 
  let (affected_rows, rest) = Mp_binary.length_coded_binary bits in
  let (insert_id, rest) = Mp_binary.length_coded_binary rest in
  if (Bitstring.bitstring_length rest > 0) then (
    bitmatch rest with
    | { server_status : 2*8 : int, unsigned, bigendian;
        warning_count : 2*8 : int, unsigned, bigendian;
        message : -1 : string } -> (
          {
            ok_affected_rows = affected_rows;
            ok_insert_id = insert_id;
            ok_server_status = server_status;
            ok_warning_count = warning_count;
            ok_message = message;
          }
      )
  )
  else (
    {
      ok_affected_rows = affected_rows;
      ok_insert_id = insert_id;
      ok_server_status = 0;
      ok_warning_count = 0;
      ok_message = "";
    }
  )
