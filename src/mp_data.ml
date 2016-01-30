type sign = Positive | Negative

type sql =
  | Null
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

type t = sql

exception Wrong_type of string

let data_null = Null

let data_tinyint v = Tinyint v

let data_smallint v = Smallint v

let data_int v = Int v

let data_longint v = Longint v

let data_longlongint v = Longlongint v

let data_decimal v = Decimal v

let data_date v = Date v

let data_time v = Time v

let data_datetime v = Datetime v

let data_timestamp v = Timestamp v

let data_float v = Float v

let data_double v = Double v

let data_int24 v = Int24 v

let data_year v = Year v

let data_varchar v = Varchar v

let data_string v = String v

let data_varstring v = Varstring v

let data_blob v = Blob v

let data_binary v = Binary v

let data_varbinary v = Varbinary v

let data_enum v = Enum v

let data_set v = Set v

let data_bit v = Bit v

let data_geometry v = Geometry v

let sign_to_string s = 
  match s with
  | Positive -> "+"
  | Negative -> "-"

let type_to_string = function
  | Null -> "Null"
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

let to_string = function
  | Null -> "NULL"
  | Tinyint v -> string_of_int v
  | Smallint v -> string_of_int v
  | Int v -> string_of_int v
  | Int24 v -> string_of_int v
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
  | Datetime v -> (
      let ((year, month, day), (hour, min, sec, subsec)) = v in
      Printf.sprintf "%u-%u-%u %u:%u:%u.%Lu" year month day hour min sec subsec
    )
  | Timestamp v -> (
      let ((year, month, day), (hour, min, sec, subsec)) = v in
      Printf.sprintf "%u-%u-%u %u:%u:%u.%Lu" year month day hour min sec subsec
    )
  | Float v -> string_of_float v
  | Double v -> string_of_float v
  | Varchar v -> v
  | String v -> v
  | Varstring v -> v
  | Enum v -> v
  | Set v -> v
  | Blob v -> Buffer.contents v
  | Binary v -> Buffer.contents v
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

let to_ocaml_int v =
  let ex = Wrong_type "Unable to convert to int" in
  match v with
  | Null -> None
  | Tinyint v -> Some v
  | Smallint v -> Some v
  | Int v -> Some v
  | Int24 v -> Some v
  | Year v -> Some v
  | Longint _ -> raise ex
  | Longlongint _ -> raise ex
  | Decimal _ -> raise ex
  | Date _ -> raise ex
  | Time _ -> raise ex
  | Datetime _ -> raise ex
  | Timestamp _ -> raise ex
  | Float _ -> raise ex
  | Double _ -> raise ex
  | Varchar _ -> raise ex
  | String _ -> raise ex
  | Varstring _ -> raise ex
  | Enum _ -> raise ex
  | Set _ -> raise ex
  | Blob _ -> raise ex
  | Binary _ -> raise ex
  | Varbinary _ -> raise ex
  | Bit _ -> raise ex
  | Geometry _ -> raise ex

let to_ocaml_int64 v =
  let ex = Wrong_type "Unable to convert to Int64" in
  match v with
  | Null -> None
  | Longint v -> Some v
  | Tinyint _ -> raise ex
  | Smallint _ -> raise ex
  | Int _ -> raise ex
  | Int24 _ -> raise ex
  | Year _  -> raise ex
  | Longlongint _ -> raise ex
  | Decimal _ -> raise ex
  | Date _ -> raise ex
  | Time _ -> raise ex
  | Datetime _ -> raise ex
  | Timestamp _ -> raise ex
  | Float _ -> raise ex
  | Double _ -> raise ex
  | Varchar _ -> raise ex
  | String _ -> raise ex
  | Varstring _ -> raise ex
  | Enum _ -> raise ex
  | Set _ -> raise ex
  | Blob _ -> raise ex
  | Binary _ -> raise ex
  | Varbinary _ -> raise ex
  | Bit _ -> raise ex
  | Geometry _ -> raise ex

let to_ocaml_big_int v =
  let ex = Wrong_type "Unable to convert to Big_int" in
  match v with
  | Null -> None
  | Longlongint v -> Some v
  | Tinyint _ -> raise ex
  | Smallint _ -> raise ex
  | Int _ -> raise ex
  | Int24 _ -> raise ex
  | Year _ -> raise ex
  | Longint _ -> raise ex
  | Decimal _ -> raise ex
  | Date _ -> raise ex
  | Time _ -> raise ex
  | Datetime _ -> raise ex
  | Timestamp _ -> raise ex
  | Float _ -> raise ex
  | Double _ -> raise ex
  | Varchar _ -> raise ex
  | String _ -> raise ex
  | Varstring _ -> raise ex
  | Enum _ -> raise ex
  | Set _ -> raise ex
  | Blob _ -> raise ex
  | Binary _ -> raise ex
  | Varbinary _ -> raise ex
  | Bit _ -> raise ex
  | Geometry _ -> raise ex

let to_ocaml_num v =
  let ex = Wrong_type "Unable to convert to Num" in
  match v with
  | Null -> None
  | Decimal v -> Some v
  | Tinyint _ -> raise ex
  | Smallint _ -> raise ex
  | Int _ -> raise ex
  | Int24 _ -> raise ex
  | Year _ -> raise ex
  | Longint _ -> raise ex
  | Longlongint _ -> raise ex
  | Date _ -> raise ex
  | Time _ -> raise ex
  | Datetime _ -> raise ex
  | Timestamp _ -> raise ex
  | Float _ -> raise ex
  | Double _ -> raise ex
  | Varchar _ -> raise ex
  | String _ -> raise ex
  | Varstring _ -> raise ex
  | Enum _ -> raise ex
  | Set _ -> raise ex
  | Blob _ -> raise ex
  | Binary _ -> raise ex
  | Varbinary _ -> raise ex
  | Bit _ -> raise ex
  | Geometry _ -> raise ex

let to_ocaml_date v =
  let ex = Wrong_type "Unable to convert to date" in
  match v with
  | Null -> None
  | Date v -> Some v
  | Tinyint _ -> raise ex
  | Smallint _ -> raise ex
  | Int _ -> raise ex
  | Int24 _ -> raise ex
  | Year _ -> raise ex
  | Longint _ -> raise ex
  | Longlongint _ -> raise ex
  | Decimal _ -> raise ex
  | Time _ -> raise ex
  | Datetime _ -> raise ex
  | Timestamp _ -> raise ex
  | Float _ -> raise ex
  | Double _ -> raise ex
  | Varchar _ -> raise ex
  | String _ -> raise ex
  | Varstring _ -> raise ex
  | Enum _ -> raise ex
  | Set _ -> raise ex
  | Blob _ -> raise ex
  | Binary _ -> raise ex
  | Varbinary _ -> raise ex
  | Bit _ -> raise ex
  | Geometry _ -> raise ex

let to_ocaml_time v =
  let ex = Wrong_type "Unable to convert to time" in
  match v with
  | Null -> None
  | Time v -> Some v
  | Tinyint _ -> raise ex
  | Smallint _ -> raise ex
  | Int _ -> raise ex
  | Int24 _ -> raise ex
  | Year _ -> raise ex
  | Longint _ -> raise ex
  | Longlongint _ -> raise ex
  | Decimal _ -> raise ex
  | Date _ -> raise ex
  | Datetime _ -> raise ex
  | Timestamp _ -> raise ex
  | Float _ -> raise ex
  | Double _ -> raise ex
  | Varchar _ -> raise ex
  | String _ -> raise ex
  | Varstring _ -> raise ex
  | Enum _ -> raise ex
  | Set _ -> raise ex
  | Blob _ -> raise ex
  | Binary _ -> raise ex
  | Varbinary _ -> raise ex
  | Bit _ -> raise ex
  | Geometry _ -> raise ex

let to_ocaml_dt_ts v =
  let ex = Wrong_type "Unable to convert to datetime/timestamp" in
  match v with
  | Null -> None
  | Datetime v -> Some v
  | Timestamp v -> Some v
  | Tinyint _ -> raise ex
  | Smallint _ -> raise ex
  | Int _ -> raise ex
  | Int24 _ -> raise ex
  | Year _ -> raise ex
  | Longint _ -> raise ex
  | Longlongint _ -> raise ex
  | Decimal _ -> raise ex
  | Date _ -> raise ex
  | Time _ -> raise ex
  | Float _ -> raise ex
  | Double _ -> raise ex
  | Varchar _ -> raise ex
  | String _ -> raise ex
  | Varstring _ -> raise ex
  | Enum _ -> raise ex
  | Set _ -> raise ex
  | Blob _ -> raise ex
  | Binary _ -> raise ex
  | Varbinary _ -> raise ex
  | Bit _ -> raise ex
  | Geometry _ -> raise ex

let to_ocaml_float v =
  let ex = Wrong_type "Unable to convert to float" in
  match v with
  | Null -> None
  | Float v -> Some v
  | Double v -> Some v
  | Tinyint _ -> raise ex
  | Smallint _ -> raise ex
  | Int _ -> raise ex
  | Int24 _ -> raise ex
  | Year _ -> raise ex
  | Longint _ -> raise ex
  | Longlongint _ -> raise ex
  | Decimal _ -> raise ex
  | Date _ -> raise ex
  | Time _ -> raise ex
  | Datetime _ -> raise ex
  | Timestamp _ -> raise ex
  | Varchar _ -> raise ex
  | String _ -> raise ex
  | Varstring _ -> raise ex
  | Enum _ -> raise ex
  | Set _ -> raise ex
  | Blob _ -> raise ex
  | Binary _ -> raise ex
  | Varbinary _ -> raise ex
  | Bit _ -> raise ex
  | Geometry _ -> raise ex

let to_ocaml_string v =
  let ex = Wrong_type "Unable to convert to string" in
  match v with
  | Null -> None
  | Varchar v -> Some v
  | String v -> Some v
  | Varstring v -> Some v
  | Enum v -> Some v
  | Set v -> Some v
  | Tinyint _ -> raise ex
  | Smallint _ -> raise ex
  | Int _ -> raise ex
  | Int24 _ -> raise ex
  | Year _ -> raise ex
  | Longint _ -> raise ex
  | Longlongint _ -> raise ex
  | Decimal _ -> raise ex
  | Date _ -> raise ex
  | Time _ -> raise ex
  | Datetime _ -> raise ex
  | Timestamp _ -> raise ex
  | Float _ -> raise ex
  | Double _ -> raise ex
  | Blob _ -> raise ex
  | Binary _ -> raise ex
  | Varbinary _ -> raise ex
  | Bit _ -> raise ex
  | Geometry _ -> raise ex

let to_ocaml_buffer v =
  let ex = Wrong_type "Unable to convert to Buffer" in
  match v with
  | Null -> None
  | Blob v -> Some v
  | Binary v -> Some v
  | Varbinary v -> Some v
  | Tinyint _ -> raise ex
  | Smallint _ -> raise ex
  | Int _ -> raise ex
  | Int24 _ -> raise ex
  | Year _ -> raise ex
  | Longint _ -> raise ex
  | Longlongint _ -> raise ex
  | Decimal _ -> raise ex
  | Date _ -> raise ex
  | Time _ -> raise ex
  | Datetime _ -> raise ex
  | Timestamp _ -> raise ex
  | Float _ -> raise ex
  | Double _ -> raise ex
  | Varchar _ -> raise ex
  | String _ -> raise ex
  | Varstring _ -> raise ex
  | Enum _ -> raise ex
  | Set _ -> raise ex
  | Bit _ -> raise ex
  | Geometry _ -> raise ex

let to_ocaml_bitstring v =
  let ex = Wrong_type "Unable to convert to Bitstring" in
  match v with
  | Null -> None
  | Bit v -> Some v
  | Geometry v -> Some v
  | Tinyint _ -> raise ex
  | Smallint _ -> raise ex
  | Int _ -> raise ex
  | Int24 _ -> raise ex
  | Year _ -> raise ex
  | Longint _ -> raise ex
  | Longlongint _ -> raise ex
  | Decimal _ -> raise ex
  | Date _ -> raise ex
  | Time _ -> raise ex
  | Datetime _ -> raise ex
  | Timestamp _ -> raise ex
  | Float _ -> raise ex
  | Double _ -> raise ex
  | Varchar _ -> raise ex
  | String _ -> raise ex
  | Varstring _ -> raise ex
  | Enum _ -> raise ex
  | Set _ -> raise ex
  | Blob _ -> raise ex
  | Binary _ -> raise ex
  | Varbinary _ -> raise ex

let eq : t -> t -> bool = fun d1 d2 ->
  match d1, d2 with
  | Null, Null -> true
  | Null, _ -> false
  | _, Null -> false
  | Tinyint v1, Tinyint v2 -> v1 = v2
  | Tinyint _, _ -> false
  | _, Tinyint _ -> false
  | Smallint v1, Smallint v2 -> v1 = v2
  | Smallint _, _ -> false
  | _, Smallint _ -> false
  | Int v1, Int v2 -> v1 = v2
  | Int _, _ -> false
  | _, Int _ -> false
  | Date v1, Date v2 -> v1 = v2
  | Date _, _ -> false
  | _, Date _ -> false
  | Time v1, Time v2 -> v1 = v2
  | Time _, _ -> false
  | _, Time _ -> false
  | Datetime v1, Datetime v2 -> v1 = v2
  | Datetime _, _ -> false
  | _, Datetime _ -> false
  | Timestamp v1, Timestamp v2 -> v1 = v2
  | Timestamp _, _ -> false
  | _, Timestamp _ -> false
  | Float v1, Float v2 -> v1 = v2
  | Float _, _ -> false
  | _, Float _ -> false
  | Double v1, Double v2 -> v1 = v2
  | Double _, _ -> false
  | _, Double _ -> false
  | Int24 v1, Int24 v2 -> v1 = v2
  | Int24 _, _ -> false
  | _, Int24 _ -> false
  | Year v1, Year v2 -> v1 = v2
  | Year _, _ -> false
  | _, Year _ -> false
  | Varchar v1, Varchar v2 -> v1 = v2
  | Varchar _, _ -> false
  | _, Varchar _ -> false
  | String v1, String v2 -> v1 = v2
  | String _, _ -> false
  | _, String _ -> false
  | Varstring v1, Varstring v2 -> v1 = v2
  | Varstring _, _ -> false
  | _, Varstring _ -> false
  | Enum v1, Enum v2 -> v1 = v2
  | Enum _, _ -> false
  | _, Enum _ -> false
  | Set v1, Set v2 -> v1 = v2
  | Set _, _ -> false
  | _, Set _ -> false
  | Longint v1, Longint v2 -> 
    if (Int64.compare v1 v2 = 0) then true else false
  | Longint _, _ -> false
  | _, Longint _ -> false
  | Longlongint v1, Longlongint v2 ->
    if (Big_int.compare_big_int v1 v2 = 0) then true else false
  | Longlongint _, _ -> false
  | _, Longlongint _ -> false
  | Decimal v1, Decimal v2 -> Num.eq_num v1 v2
  | Decimal _, _ -> false
  | _, Decimal _ -> false
  | Blob v1, Blob v2 -> Buffer.contents v1 = Buffer.contents v2
  | Blob _, _ -> false
  | _, Blob _ -> false
  | Binary v1, Binary v2 -> Buffer.contents v1 = Buffer.contents v2
  | Binary _, _ -> false
  | _, Binary _ -> false
  | Varbinary v1, Varbinary v2 -> Buffer.contents v1 = Buffer.contents v2
  | Varbinary _, _ -> false
  | _, Varbinary _ -> false
  | Bit v1, Bit v2 -> Bitstring.equals v1 v2
  | Bit _, _ -> false
  | _, Bit _ -> false
  | Geometry v1, Geometry v2 -> Bitstring.equals v1 v2
