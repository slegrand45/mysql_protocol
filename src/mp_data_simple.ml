
let split_date_string v = 
  let t = Array.make 3 "" in
  let i = ref 0 in
  let f c = 
    match c with 
    | '0'..'9' ->
	t.(!i) <- t.(!i) ^ (String.make 1 c)
    | '-' -> 
	incr i
    | _ ->
	assert false
  in
  let () = String.iter f v in
  (* if empty, default to 0 *)
  let default i e = 
    if (e = "") then t.(i) <- "0"
  in
  let () = Array.iteri default t in
  t
;;

let split_time_string v = 
  let t = Array.make 4 "" in
  let i = ref 0 in
  let sign = ref Mp_data.Positive in
  let f c = 
    match c with 
    | '-' -> 
	sign := Mp_data.Negative 
    | '0'..'9' ->
	t.(!i) <- t.(!i) ^ (String.make 1 c)
    | ':' | '.' -> 
	incr i
    | _ ->
	assert false
  in
  let () = String.iter f v in
  (* if empty, default to 0 *)
  let default i e = 
    if (e = "") then t.(i) <- "0"
  in
  let () = Array.iteri default t in
  (!sign, t)
;;

let split_datetime_string v = 
  let sep = String.index v ' ' in
  let part_date = String.sub v 0 sep in
  let part_time = String.sub v (sep + 1) ((String.length v) - (String.length part_date) - 1) in
  let split_date = split_date_string part_date in
  (* sign time is not used for datetime/timestamp *)
  let (_, split_time) = split_time_string part_time in
  (split_date, split_time)
;;

let data_value_to_native_value v field = 
  let field_type = field.Mp_field_packet.field_type in
  let field_flags = field.Mp_field_packet.field_flags in
  match field_type with
  | Mp_field_packet.Field_type_decimal -> (
      Mp_data.Decimal (Num.num_of_string v)
     )
  | Mp_field_packet.Field_type_tiny -> (
      Mp_data.Tinyint (int_of_string v)
     )
  | Mp_field_packet.Field_type_short -> (
      Mp_data.Smallint (int_of_string v)
     )
  | Mp_field_packet.Field_type_long -> (
      Mp_data.Longint (Int64.of_string v)
     )
  | Mp_field_packet.Field_type_float -> (
      Mp_data.Float (float_of_string v)
     )
  | Mp_field_packet.Field_type_double -> (
      Mp_data.Double (float_of_string v)
     )
  | Mp_field_packet.Field_type_null -> (
      Mp_data.Null
     )
  | Mp_field_packet.Field_type_longlong -> (
      Mp_data.Longlongint (Big_int.big_int_of_string v)
     )
  | Mp_field_packet.Field_type_int24 -> (
      Mp_data.Int24 (int_of_string v)
     )
  | Mp_field_packet.Field_type_date 
  | Mp_field_packet.Field_type_newdate -> (* TODO : newdate : add to tests *) (
      let split = split_date_string v in
      let part_year = int_of_string (split.(0)) in
      let part_month = int_of_string (split.(1)) in
      let part_day = int_of_string (split.(2)) in
      Mp_data.Date (part_year, part_month, part_day)
     )
  | Mp_field_packet.Field_type_time -> (
      let (sign, split) = split_time_string v in
      let part_hour = int_of_string(split.(0)) in
      let part_min = int_of_string(split.(1)) in
      let part_sec = int_of_string(split.(2)) in
      let part_subsec = Int64.of_string (split.(3)) in
      Mp_data.Time (sign, part_hour, part_min, part_sec, part_subsec)
     )
  | Mp_field_packet.Field_type_datetime 
  | Mp_field_packet.Field_type_timestamp -> (
      let (split_date, split_time) = split_datetime_string v in
      let part_year = int_of_string (split_date.(0)) in
      let part_month = int_of_string (split_date.(1)) in
      let part_day = int_of_string (split_date.(2)) in
      let part_hour = int_of_string (split_time.(0)) in
      let part_min = int_of_string (split_time.(1)) in
      let part_sec = int_of_string (split_time.(2)) in
      let part_subsec = Int64.of_string (split_time.(3)) in
      match field_type with 
      | Mp_field_packet.Field_type_datetime -> (
	  Mp_data.Datetime ((part_year, part_month, part_day), (part_hour, part_min, part_sec, part_subsec))
	 )
      | Mp_field_packet.Field_type_timestamp -> (
	  Mp_data.Timestamp ((part_year, part_month, part_day), (part_hour, part_min, part_sec, part_subsec))
	 )
      | _ -> assert false
     )
  | Mp_field_packet.Field_type_year -> (
      Mp_data.Year (int_of_string v)
     )
  | Mp_field_packet.Field_type_varchar -> (
      Mp_data.Varchar v (* TODO : add to tests *)
     )
  | Mp_field_packet.Field_type_bit -> (
      Mp_data.Bit (Bitstring.bitstring_of_string v)
     )
  | Mp_field_packet.Field_type_newdecimal -> (
      (* 
	 TODO : keep also the original data (as string or two integer parts)
	 because a round is automatically made
       *)
      let decimals = field.Mp_field_packet.field_decimals in
      let length = String.length v in
      let part_i_s = String.sub v 0 (length - 1 - decimals) in
      let part_d_s = String.sub v (length - decimals) decimals in
      let i = part_i_s ^ part_d_s in
      let i = Big_int.big_int_of_string i in
      let i = Num.num_of_big_int i in
      let div = Big_int.power_int_positive_int 10 decimals in
      let div = Num.num_of_big_int div in
      Mp_data.Decimal (Num.div_num i div)
     )
  | Mp_field_packet.Field_type_enum ->
      Mp_data.Enum v
  | Mp_field_packet.Field_type_set ->
      Mp_data.Set v
  | Mp_field_packet.Field_type_tiny_blob
  | Mp_field_packet.Field_type_medium_blob
  | Mp_field_packet.Field_type_long_blob
  | Mp_field_packet.Field_type_blob -> (
      let b = Buffer.create (String.length v) in
      let () = Buffer.add_string b v in
      Mp_data.Blob b
     )
  | Mp_field_packet.Field_type_var_string -> (
      if (List.mem Mp_field_packet.Field_flag_binary field_flags) then
	let b = Buffer.create (String.length v) in
	let () = Buffer.add_string b v in
	Mp_data.Varbinary b
      else
	Mp_data.Varstring v
     )
  | Mp_field_packet.Field_type_string -> (
      if (List.mem Mp_field_packet.Field_flag_enum field_flags) then
	Mp_data.Enum v
      else if (List.mem Mp_field_packet.Field_flag_set field_flags) then
	Mp_data.Set v
      else if (List.mem Mp_field_packet.Field_flag_binary field_flags) then
	let b = Buffer.create (String.length v) in
	let () = Buffer.add_string b v in
	Mp_data.Binary b
      else 
	Mp_data.String v
     )
  | Mp_field_packet.Field_type_geometry -> (
      Mp_data.Geometry (Bitstring.bitstring_of_string v)
     )
;;
