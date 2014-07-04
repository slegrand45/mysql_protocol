
type handshake = {
    packet_length : int;
    packet_number : int;
    protocol_version : int;
    server_version : string;
    thread_id : Int64.t;
    scramble_buff_1 : Bitstring.t;
    server_capabilities : Mp_capabilities.capabilities list;
    server_language : Mp_charset.charset;
    server_status : int;
    length_scramble : int;
    scramble_buff_2 : Bitstring.t
  }

let handshake_to_string handshake = 
  let s = "" in
  let s = s ^ (Printf.sprintf "packet_length : %u\n" handshake.packet_length) in
  let s = s ^ (Printf.sprintf "packet_number : %u\n" handshake.packet_number) in
  let s = s ^ (Printf.sprintf "protocol_version : %u\n" handshake.protocol_version) in
  let s = s ^ (Printf.sprintf "server_version : %s\n" handshake.server_version) in
  let s = s ^ (Printf.sprintf "thread_id : %Lu\n" handshake.thread_id) in
  let s = s ^ (Printf.sprintf "scramble_buff_1 : %s\n" (Bitstring.string_of_bitstring handshake.scramble_buff_1)) in
  let s = s ^ (Printf.sprintf "server_capabilities : %s\n" (Mp_capabilities.capabilities_to_string handshake.server_capabilities)) in
  let s = s ^ (Printf.sprintf "server_language : %s\n" (Mp_charset.charset_to_string handshake.server_language)) in
  let s = s ^ (Printf.sprintf "server_status : %u\n" handshake.server_status) in
  let s = s ^ (Printf.sprintf "length_scramble : %u\n" handshake.length_scramble) in
  let s = s ^ (Printf.sprintf "scramble_buff_2 : %s\n" (Bitstring.string_of_bitstring handshake.scramble_buff_2)) in
  s
;;

let handshake_initialisation ic oc =
  let (packet_length, packet_number, bits) = Mp_packet.extract_packet ic oc in
       bitmatch bits with
     | { protocol_version : 1*8 : int, unsigned, bigendian; (* always = 10 ?? (see send_server_handshake_packet function in sql_acl.cc) *)
	 rest : -1 : bitstring } -> 
	   (
	    let (rest, server_version) = Mp_string.null_terminated_string rest "" in
	    bitmatch rest with
	  | { thread_id : 4*8 : int, unsigned, littleendian;
              scramble_buff_1 : 8*8 : bitstring;
              0x00 : 1*8 : int, unsigned, bigendian;
              server_capabilities : 2*8 : bitstring;
              server_language : 1*8 : int, unsigned, bigendian;
              server_status : 2*8 : int, unsigned, bigendian; 
              server_capabilities_upper : 2 * 8 : bitstring; (* server capabilities (two upper bytes) *)
	      length_scramble : 1 * 8 : int, unsigned, bigendian; (* length of the scramble *)
	      0x00 : 1 * 8 : int, unsigned, bigendian;
	      0x00 : 1 * 8 : int, unsigned, bigendian;
	      0x00 : 1 * 8 : int, unsigned, bigendian;
	      0x00 : 1 * 8 : int, unsigned, bigendian;
	      0x00 : 1 * 8 : int, unsigned, bigendian;
	      0x00 : 1 * 8 : int, unsigned, bigendian;
	      0x00 : 1 * 8 : int, unsigned, bigendian;
	      0x00 : 1 * 8 : int, unsigned, bigendian;
	      0x00 : 1 * 8 : int, unsigned, bigendian;
	      0x00 : 1 * 8 : int, unsigned, bigendian;
	      rest : -1 : bitstring } ->
		(* thread_id is a 4 bytes unsigned integer (AND NOT a length coded binary) *)
                let thread_id = Int64.of_int32 thread_id in
		let server_language = Mp_charset.number_charset server_language in
		let server_capabilities = Mp_capabilities.decode_server_capabilities 
		    (Bitstring.concat [server_capabilities; server_capabilities_upper]) in
		(*
		  scramble_buff_2 = rest of the plugin provided data (at least 12 bytes)
		  \0 byte, terminating the second part of a scramble
		 *)
		let (_, scramble_buff_2) = Mp_string.null_terminated_string rest "" in
		let scramble_buff_2 = Bitstring.bitstring_of_string scramble_buff_2 in
		let handshake = 
		  { packet_length = packet_length;
		    packet_number = packet_number;
		    protocol_version = protocol_version;
		    server_version = server_version;
		    thread_id = thread_id;
		    scramble_buff_1 = scramble_buff_1;
		    server_capabilities = server_capabilities;
		    server_language = server_language;
		    server_status = server_status;
		    length_scramble = length_scramble;
		    scramble_buff_2 = scramble_buff_2;
		  }
		in
		handshake
	   )
;;
