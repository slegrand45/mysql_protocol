
type com_type = 
    Authentication (* see Mp_authentication *)
  | Init_db
  | Change_user
  | Query
  | Prepare
  | Execute
  | Fetch
  | Close_statement
  | Ping
  | Quit

let com_string statement code =
  let length = String.length statement in
  let bits = BITSTRING {
      code : 1*8 : int, unsigned;
      statement : length*8 : string
    } 
  in
  let bits = Mp_packet.make_packet (-1) bits in
  bits

let com_bitstring bits code =
  let bits = BITSTRING {
      code : 1*8 : int, unsigned;
      bits : -1 : bitstring
    } 
  in
  let bits = Mp_packet.make_packet (-1) bits in
  bits

let com_code code =
  let bits = BITSTRING {
      code : 1*8 : int, unsigned
    } 
  in
  let bits = Mp_packet.make_packet (-1) bits in
  bits

let com_init_db database =
  com_string database 0x02

let com_change_user bits =
  com_bitstring bits 0x11

let com_query query =
  com_string query 0x03

let com_prepare statement =
  com_string statement 0x16

let com_execute bits =
  com_bitstring bits 0x17

let com_fetch bits =
  com_bitstring bits 0x1c

let com_close_statement bits =
  com_bitstring bits 0x19

let com_quit =
  com_code 0x01

let com_ping =
  com_code 0x0e
