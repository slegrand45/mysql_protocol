
(* for time data *)
type sign = Positive | Negative;;

type native_data = 
    Null
  | Tinyint of int
  | Smallint of int
  | Int of int 
  | Longint of Int64.t 
  | Longlongint of Big_int.big_int
  | Decimal of Num.num
  | Date of (int * int * int) (* year, month, day *)
  | Time of (sign * int * int * int * Int64.t) (* sign * hour, min, sec, microsec *)
  | Datetime of ((int * int * int) * (int * int * int * Int64.t)) (* (year, month, day), (hour, min, sec, microsec) *)
  | Timestamp of ((int * int * int) * (int * int * int * Int64.t)) (* (year, month, day), (hour, min, sec, microsec) *)
  | Float of float
  | Double of float
  | Int24 of int
  | Year of int
  | Varchar of string
  | String of string
  | Varstring of string
  | Blob of Buffer.t (* TODO : add a Text type ? *)
  | Binary of Buffer.t
  | Varbinary of Buffer.t
  | Enum of string
  | Set of string
  | Bit of Bitstring.t
  | Geometry of Bitstring.t
;;

let sign_to_string s = 
  match s with
  | Positive -> "+"
  | Negative -> "-"
;;

let type_to_string nv = 
  match nv with
    Null -> "Null"
  | Tinyint _ -> "Tinyint"
  | Smallint _ -> "Smallint"
  | Int _ -> "Int"
  | Int24 _ -> "Int24"
  | Year _ -> "Year"
  | Longint _ -> "Longint"
  | Longlongint _ -> "Longlongint"
  | Decimal _ -> "Decimal"
  | Date _ -> "Date"
  | Time _ -> "Time"
  | Datetime _ -> "Datetime"
  | Timestamp _ -> "Timestamp"
  | Float _ -> "Float"
  | Double _ -> "Double"
  | Varchar _ -> "Varchar"
  | String _ -> "String"
  | Varstring _ -> "Varstring"
  | Enum _ -> "Enum"
  | Set _ -> "Set"
  | Blob _ -> "Blob"
  | Binary _ -> "Binary"
  | Varbinary _ -> "Varbinary"
  | Bit _ -> "Bit"
  | Geometry _ -> "Geometry"
;;

let to_string nv = 
  match nv with
    Null -> "NULL"
  | Tinyint v 
  | Smallint v 
  | Int v 
  | Int24 v 
  | Year v -> string_of_int v
  | Longint v -> Int64.to_string v
  | Longlongint v -> Big_int.string_of_big_int v
  | Decimal v -> Num.string_of_num v
  | Date v -> (
      let (year, month, day) = v in
      Printf.sprintf "%u-%u-%u" year month day
     )
  | Time v -> (
      let (sign, hour, min, sec, subsec) = v in
      Printf.sprintf "%s%u:%u:%u.%Lu" (sign_to_string sign) hour min sec subsec
     )
  | Datetime v 
  | Timestamp v -> (
      let ((year, month, day), (hour, min, sec, subsec)) = v in
      Printf.sprintf "%u-%u-%u %u:%u:%u.%Lu" year month day hour min sec subsec
     )
  | Float v -> string_of_float v
  | Double v -> string_of_float v
  | Varchar v
  | String v
  | Varstring v 
  | Enum v 
  | Set v -> v
  | Blob v 
  | Binary v 
  | Varbinary v -> Buffer.contents v
  | Bit v -> (
      bitmatch v with
      | { b1  : 1; b2  : 1; b3  : 1; b4  : 1; b5  : 1; b6  : 1; b7  : 1; b8  : 1;  
	  b9  : 1; b10 : 1; b11 : 1; b12 : 1; b13 : 1; b14 : 1; b15 : 1; b16 : 1; 
	  b17 : 1; b18 : 1; b19 : 1; b20 : 1; b21 : 1; b22 : 1; b23 : 1; b24 : 1;  
	  b25 : 1; b26 : 1; b27 : 1; b28 : 1; b29 : 1; b30 : 1; b31 : 1; b32 : 1;  
	  b33 : 1; b34 : 1; b35 : 1; b36 : 1; b37 : 1; b38 : 1; b39 : 1; b40 : 1;  
	  b41 : 1; b42 : 1; b43 : 1; b44 : 1; b45 : 1; b46 : 1; b47 : 1; b48 : 1;  
	  b49 : 1; b50 : 1; b51 : 1; b52 : 1; b53 : 1; b54 : 1; b55 : 1; b56 : 1;  
	  b57 : 1; b58 : 1; b59 : 1; b60 : 1; b61 : 1; b62 : 1; b63 : 1; b64 : 1 } ->
	    (
	     let f b = 
	       match b with
	       | true -> "1"
	       | false -> "0"
	     in
	     Printf.sprintf "%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s"
	       (f b1)  (f b2)  (f b3)  (f b4)  (f b5)  (f b6)  (f b7)  (f b8) 
	       (f b9)  (f b10) (f b11) (f b12) (f b13) (f b14) (f b15) (f b16)
	       (f b17) (f b18) (f b19) (f b20) (f b21) (f b22) (f b23) (f b24)
	       (f b25) (f b26) (f b27) (f b28) (f b29) (f b30) (f b31) (f b32)
	       (f b33) (f b34) (f b35) (f b36) (f b37) (f b38) (f b39) (f b40)
	       (f b41) (f b42) (f b43) (f b44) (f b45) (f b46) (f b47) (f b48)
	       (f b49) (f b50) (f b51) (f b52) (f b53) (f b54) (f b55) (f b56)
	       (f b57) (f b58) (f b59) (f b60) (f b61) (f b62) (f b63) (f b64)
	    )
      | { _ } -> assert false
     )
  | Geometry v -> Bitstring.string_of_bitstring v
;;

let eq d1 d2 = 
  match d1, d2 with
  | Null, Null -> true
  | Null, _ | _, Null -> false
  | Tinyint v1, Tinyint v2 -> v1 = v2
  | Tinyint _, _ | _, Tinyint _ -> false
  | Smallint v1, Smallint v2 -> v1 = v2
  | Smallint _, _ | _, Smallint _ -> false
  | Int v1, Int v2 -> v1 = v2
  | Int _, _ | _, Int _ -> false
  | Date v1, Date v2 -> v1 = v2
  | Date _, _ | _, Date _ -> false
  | Time v1, Time v2 -> v1 = v2
  | Time _, _ | _, Time _ -> false
  | Datetime v1, Datetime v2 -> v1 = v2
  | Datetime _, _ | _, Datetime _ -> false
  | Timestamp v1, Timestamp v2 -> v1 = v2
  | Timestamp _, _ | _, Timestamp _ -> false
  | Float v1, Float v2 -> v1 = v2
  | Float _, _ | _, Float _ -> false
  | Double v1, Double v2 -> v1 = v2
  | Double _, _ | _, Double _ -> false
  | Int24 v1, Int24 v2 -> v1 = v2
  | Int24 _, _ | _, Int24 _ -> false
  | Year v1, Year v2 -> v1 = v2
  | Year _, _ | _, Year _ -> false
  | Varchar v1, Varchar v2 -> v1 = v2
  | Varchar _, _ | _, Varchar _ -> false
  | String v1, String v2 -> v1 = v2
  | String _, _ | _, String _ -> false
  | Varstring v1, Varstring v2 -> v1 = v2
  | Varstring _, _ | _, Varstring _ -> false
  | Enum v1, Enum v2 -> v1 = v2
  | Enum _, _ | _, Enum _ -> false
  | Set v1, Set v2 -> v1 = v2
  | Set _, _ | _, Set _ -> false
  | Longint v1, Longint v2 -> 
      if (Int64.compare v1 v2 = 0) then true else false
  | Longint _, _ | _, Longint _ -> false
  | Longlongint v1, Longlongint v2 ->
      if (Big_int.compare_big_int v1 v2 = 0) then true else false
  | Longlongint _, _ | _, Longlongint _ -> false
  | Decimal v1, Decimal v2 -> Num.eq_num v1 v2
  | Decimal _, _ | _, Decimal _ -> false
  | Blob v1, Blob v2 -> Buffer.contents v1 = Buffer.contents v2
  | Blob _, _ | _, Blob _ -> false
  | Binary v1, Binary v2 -> Buffer.contents v1 = Buffer.contents v2
  | Binary _, _ | _, Binary _ -> false
  | Varbinary v1, Varbinary v2 -> Buffer.contents v1 = Buffer.contents v2
  | Varbinary _, _ | _, Varbinary _ -> false
  | Bit v1, Bit v2 -> Bitstring.equals v1 v2
  | Bit _, _ | _, Bit _ -> false
  | Geometry v1, Geometry v2 -> Bitstring.equals v1 v2
  (* | Geometry _, _ | _, Geometry _ -> false *)
;;
