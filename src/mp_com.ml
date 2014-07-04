
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
;;

let com_string ic oc statement code = 
  let length = String.length statement in
  let bits = BITSTRING {
    code : 1*8 : int, unsigned;
    statement : length*8 : string
  } 
  in
  let bits = Mp_packet.make_packet (-1) bits in
    bits
;;

let com_bitstring ic oc bits code =
  let bits = BITSTRING {
    code : 1*8 : int, unsigned;
    bits : -1 : bitstring
  } 
  in
  let bits = Mp_packet.make_packet (-1) bits in
  bits
;;

let com_code ic oc code =
  let bits = BITSTRING {
    code : 1*8 : int, unsigned
  } 
  in
  let bits = Mp_packet.make_packet (-1) bits in
    bits
;;

let com_init_db ic oc database =
  com_string ic oc database 0x02
;;

let com_change_user ic oc bits =
  com_bitstring ic oc bits 0x11
;;

let com_query ic oc query =
  com_string ic oc query 0x03
;;

let com_prepare ic oc statement =
  com_string ic oc statement 0x16
;;

let com_execute ic oc bits =
  com_bitstring ic oc bits 0x17
;;

let com_fetch ic oc bits =
  com_bitstring ic oc bits 0x1c
;;

let com_close_statement ic oc bits =
  com_bitstring ic oc bits 0x19
;;

let com_quit ic oc =
  com_code ic oc 0x01
;;

let com_ping ic oc =
  com_code ic oc 0x0e
;;
