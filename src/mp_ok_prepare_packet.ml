
type ok_prepare_packet = {
  ok_prepare_handler : Int64.t;
  ok_prepare_nb_columns : int;
  ok_prepare_nb_parameters : int;
  ok_prepare_warning_count : int;
  ok_prepare_parameters_fields : Mp_field_packet.field_packet list;
  ok_prepare_parameters_names : Mp_field.field_name list;
  ok_prepare_columns_fields : Mp_field_packet.field_packet list;
  ok_prepare_columns_names : Mp_field.field_name list;
}

let ok_prepare_packet_to_string p = 
  let s = "" in
  let s = s ^ (Printf.sprintf "ok_prepare_handler : %Lu\n" p.ok_prepare_handler) in
  let s = s ^ (Printf.sprintf "ok_prepare_nb_columns : %u\n" p.ok_prepare_nb_columns) in
  let s = s ^ (Printf.sprintf "ok_prepare_nb_parameters : %u\n" p.ok_prepare_nb_parameters) in
  let s = s ^ (Printf.sprintf "ok_prepare_warning_count : %u\n" p.ok_prepare_warning_count) in
  let f_packet acc p = 
    acc ^ "\n" ^ (Mp_field_packet.field_packet_to_string p)
  in
  let f_name acc e = 
    acc ^ "\n" ^ (Mp_field.field_name_to_string e)
  in
  let s = s ^ "PARAMETERS FIELDS: \n" in
  let s = s ^ "\nFields: \n" in
  let s = s ^ (List.fold_left f_packet "" p.ok_prepare_parameters_fields) in
  let s = s ^ "\nNames: \n" in
  let s = s ^ (List.fold_left f_name "" p.ok_prepare_parameters_names) in
  let s = s ^ "\n\nCOLUMNS FIELDS: \n" in
  let s = s ^ "\nFields: \n" in
  let s = s ^ (List.fold_left f_packet "" p.ok_prepare_columns_fields) in
  let s = s ^ "\nNames: \n" in
  let s = s ^ (List.fold_left f_name "" p.ok_prepare_columns_names) in
  s

let ok_prepare_packet bits ic oc = 
  bitmatch bits with
  | { handler : Mp_bitstring.compute32 : int, unsigned, littleendian;
      nb_columns : 2*8 : int, unsigned, littleendian;
      nb_parameters : 2*8 : int, unsigned, littleendian;
      0x0 : 8 : int;
      warning_count : 2*8 : int, unsigned, littleendian } -> 
        let (list_field_parameters, list_name_parameters) =
          if (nb_parameters > 0) then (
            let list_field_packets = ref [] in
            let () =
              for _ = 1 to nb_parameters do
                Mp_field_packet.field_packet list_field_packets ic oc
              done
            in
            let list_field_packets = List.rev !list_field_packets in
            let list_field_names = Mp_field.real_field_names list_field_packets in
            let _ = Mp_eof_packet.eof_packet_chan ic oc in
            (list_field_packets, list_field_names)
          )
          else (
            ([], [])
          )
        in
        let (list_field_columns, list_name_columns) = 
          if (nb_columns > 0) then (
            let list_field_packets = ref [] in
            let () = 
              for _ = 1 to nb_columns do
                Mp_field_packet.field_packet list_field_packets ic oc
              done
            in
            let list_field_packets = List.rev !list_field_packets in
            let list_field_names = Mp_field.real_field_names list_field_packets in
            let _ = Mp_eof_packet.eof_packet_chan ic oc in
            (list_field_packets, list_field_names)
          )
          else (
            ([], [])
          )
        in
        {
          ok_prepare_handler = handler;
          ok_prepare_nb_columns = nb_columns;
          ok_prepare_nb_parameters = nb_parameters;
          ok_prepare_warning_count = warning_count;
          ok_prepare_parameters_fields = list_field_parameters;
          ok_prepare_parameters_names = list_name_parameters;
          ok_prepare_columns_fields = list_field_columns;
          ok_prepare_columns_names = list_name_columns;
        }
