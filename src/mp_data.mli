(**
   SQL columns data types.
*)

type sign = Positive | Negative;;

(** 
    Types for columns data to build SQL statement or retrieve SQL results.
*)
type native_data = 
    Null (** NULL *)
  | Tinyint of int (** TINYINT *)
  | Smallint of int (** SMALLINT *)
  | Int of int (** INT *)
  | Longint of Int64.t (** INT *)
  | Longlongint of Big_int.big_int (** BIGINT *)
  | Decimal of Num.num (** DECIMAL *)
  | Date of (int * int * int) (** DATE (year, month, day) *)
  | Time of (sign * int * int * int * Int64.t) (** TIME (sign, hour, min, sec, microsec) *)
  | Datetime of ((int * int * int) * (int * int * int * Int64.t)) (** DATETIME ((year, month, day), (hour, min, sec, microsec)) *)
  | Timestamp of ((int * int * int) * (int * int * int * Int64.t)) (** TIMESTAMP ((year, month, day), (hour, min, sec, microsec)) *)
  | Float of float (** FLOAT *)
  | Double of float (** DOUBLE *)
  | Int24 of int (** MEDIUMINT *)
  | Year of int (** YEAR *)
  | Varchar of string (** VARCHAR *)
  | String of string (** CHAR *)
  | Varstring of string (** VARCHAR *)
  | Blob of Buffer.t (** BLOB *) (* TODO : add a Text type ? *)
  | Binary of Buffer.t (** BINARY *)
  | Varbinary of Buffer.t (** VARBINARY *)
  | Enum of string (** ENUM *)
  | Set of string (** SET *)
  | Bit of Bitstring.t (** BIT *)
  | Geometry of Bitstring.t (** GEOMETRY *)
;;

(**
   Convert column type to string
*)
val type_to_string : native_data -> string

(**
   Convert column data to string
*)
val to_string : native_data -> string

(**
   eq v1 v2 tests for structural equality of v1 and v2
*)
val eq : native_data -> native_data -> bool
