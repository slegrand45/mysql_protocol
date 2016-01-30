
type error_packet = {
  error_errno : int;
  error_sqlstate : string;
  error_message : string;
}

let error_packet_to_string p = 
  let s = "" in
  let s = s ^ (Printf.sprintf "error_errno : %u\n" p.error_errno) in
  let s = s ^ (Printf.sprintf "error_sqlstate : %s\n" p.error_sqlstate) in
  let s = s ^ (Printf.sprintf "error_message : %s\n" p.error_message) in
  s

let error_packet bits = 
  bitmatch bits with
  | { errno : 2*8 : int, unsigned, littleendian;
      "#" : 1*8 : string;
      state : 5*8 : string;
      message : -1 : string } -> (
        {
          error_errno = errno;
          error_sqlstate = state;
          error_message = message;
        }
      )
