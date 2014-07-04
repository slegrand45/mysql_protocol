
type eof_packet = {
    eof_field_count : int;
    eof_warning_count : int;
    eof_status_flags : int
  }
;;

let eof_packet_empty = 
  {
   eof_field_count = 0xfe;
   eof_warning_count = 0;
   eof_status_flags = 0
 }
;;

let eof_packet_to_string p = 
  let s = "" in
  let s = s ^ (Printf.sprintf "eof_field_count : %u\n" p.eof_field_count) in
  let s = s ^ (Printf.sprintf "eof_warning_count : %u\n" p.eof_warning_count) in
  let s = s ^ (Printf.sprintf "eof_status_flags : %u\n" p.eof_status_flags) in
  s
;;

type flag_server = 
    Server_more_results_exists
  | Server_status_cursor_exists
  | Server_status_last_row_sent
;;

let flag_server_to_int f = 
  match f with
    Server_more_results_exists -> 8
  | Server_status_cursor_exists -> 64
  | Server_status_last_row_sent -> 128
;;

let status_has_flag status flag = 
  let code = flag_server_to_int flag in
  if ((status land code) <> 0) then
    true
  else
    false
;;

let eof_packet_bits bits =
  (* field_count is always 0xfe *)
  let length = Bitstring.bitstring_length bits in
  if (length = 0) then
    (* the first byte 0xfe has already been eat *)
    { eof_field_count = 0xfe; eof_warning_count = 0; eof_status_flags = 0 }
  else if (length = 8) then (
    (* we only have the first byte 0xfe *)
    bitmatch bits with
      | { 0xfe : 1*8 : int, unsigned, littleendian } ->
	  { eof_field_count = 0xfe; eof_warning_count = 0; eof_status_flags = 0 }
    )
  else if (length = 32) then (
    (* complete EOF packet but the first byte 0xfe has already been eat *)
    bitmatch bits with
      | { warning_count : 2*8 : int, unsigned, littleendian;
	  status_flags : 2*8 : int, unsigned, littleendian } ->
	    { eof_field_count = 0xfe; eof_warning_count = warning_count; eof_status_flags = status_flags }
    )
  else if (length = 40) then (
    (* complete EOF packet including the first byte 0xfe *)
    bitmatch bits with
      | { 0xfe : 1*8 : int, unsigned, littleendian;
	  warning_count : 2*8 : int, unsigned, littleendian;
	  status_flags : 2*8 : int, unsigned, littleendian } ->
	    { eof_field_count = 0xfe; eof_warning_count = warning_count; eof_status_flags = status_flags }
    )
  else (
    failwith "Bad EOF packet"
   )
;;

let eof_packet_chan ic oc =
  let (_, _, bits) = Mp_packet.extract_packet ic oc in
  eof_packet_bits bits
;;
