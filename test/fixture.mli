module type FIXTURE = sig
  val db_name : string
  val insert_var_string : string
  val update_var_string : string
  val blobtext1 : Buffer.t
  val blobtext2 : Buffer.t
  val blobblob1 : Buffer.t
  val blobblob2 : Buffer.t
  val blobtiny1 : Buffer.t
  val blobtiny2 : Buffer.t
  val blobmedium1 : Buffer.t
  val blobmedium2 : Buffer.t
  val bloblong1 : Buffer.t
  val bloblong2 : Buffer.t
  val blobimg1 : Buffer.t
  val blobimg2 : Buffer.t
  val bit1 : Bitstring.bitstring
  val bit2 : Bitstring.bitstring
  val records : Mp_data.native_data list list
  val blobbig : Buffer.t
  val records_blobbig : Mp_data.native_data list list
  val records_date : int -> Mp_data.native_data list list
  val records_bigstring : Mp_data.native_data list list
  val records_bigvarchar : Mp_data.native_data list list
  val records_bigvarbinary : Mp_data.native_data list list
  val records_manyblobs : Mp_data.native_data list list
  val records_proc_one_result : Mp_data.native_data list list
  val records_proc_multiple_results : Mp_data.native_data list list
  val ok_value_iter : string
  val sql : string
end;;
