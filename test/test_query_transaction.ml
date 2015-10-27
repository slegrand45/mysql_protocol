open OUnit;;

let test1 connection =
  let () = 
    let sql = "TRUNCATE test_ocmp" in
    let stmt = Mp_client.create_statement_from_string sql in
    let e = Mp_client.execute ~connection:connection ~statement:stmt () in
    (* Rollback test *)
    let sql = "START TRANSACTION" in
    let stmt = Mp_client.create_statement_from_string sql in
    let e = Mp_client.execute ~connection:connection ~statement:stmt () in
    let sql = "INSERT INTO test_ocmp (f_varstring_null_no_def) VALUES ('TRANSACTION')" in
    let stmt = Mp_client.create_statement_from_string sql in
    let e = Mp_client.execute ~connection:connection ~statement:stmt () in
    let sql = "SELECT * FROM test_ocmp WHERE f_varstring_null_no_def='TRANSACTION'" in
    let stmt = Mp_client.create_statement_from_string sql in
    let (_, rows) = (Mp_client.get_result_set(Mp_client.execute ~connection:connection ~statement:stmt ())).Mp_result_set_packet.rows in
    let () = assert_equal ~msg:("Before rollback: " ^ sql) 1 (List.length rows) in
    let sql = "ROLLBACK" in
    let stmt = Mp_client.create_statement_from_string sql in
    let e = Mp_client.execute ~connection:connection ~statement:stmt () in
    let sql = "SELECT * FROM test_ocmp WHERE f_varstring_null_no_def='TRANSACTION'" in
    let stmt = Mp_client.create_statement_from_string sql in
    let (_, rows) = (Mp_client.get_result_set(Mp_client.execute ~connection:connection ~statement:stmt ())).Mp_result_set_packet.rows in
    let () = assert_equal ~msg:("After rollback: " ^ sql) 0 (List.length rows) in
    (* Commit test *)
    let sql = "START TRANSACTION" in
    let stmt = Mp_client.create_statement_from_string sql in
    let e = Mp_client.execute ~connection:connection ~statement:stmt () in
    let sql = "INSERT INTO test_ocmp (f_varstring_null_no_def) VALUES ('TRANSACTION')" in
    let stmt = Mp_client.create_statement_from_string sql in
    let e = Mp_client.execute ~connection:connection ~statement:stmt () in
    let sql = "SELECT * FROM test_ocmp WHERE f_varstring_null_no_def='TRANSACTION'" in
    let stmt = Mp_client.create_statement_from_string sql in
    let (_, rows) = (Mp_client.get_result_set(Mp_client.execute ~connection:connection ~statement:stmt ())).Mp_result_set_packet.rows in
    let () = assert_equal ~msg:("Before commit: " ^ sql) 1 (List.length rows) in
    let sql = "COMMIT" in
    let stmt = Mp_client.create_statement_from_string sql in
    let e = Mp_client.execute ~connection:connection ~statement:stmt () in
    let sql = "SELECT * FROM test_ocmp WHERE f_varstring_null_no_def='TRANSACTION'" in
    let stmt = Mp_client.create_statement_from_string sql in
    let (_, rows) = (Mp_client.get_result_set(Mp_client.execute ~connection:connection ~statement:stmt ())).Mp_result_set_packet.rows in
    let () = assert_equal ~msg:("After commit: " ^ sql) 1 (List.length rows) in
    ()
  in
  ()
;;

let test connection _ =
  try
    test1 connection
  with
  | Mp_client.Error e -> prerr_endline (Mp_client.error_exception_to_string e)
;;
