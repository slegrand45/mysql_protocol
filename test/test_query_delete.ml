
open OUnit

let build_ok_delete affected status = 
  { Mp_client.affected_rows = affected;
    Mp_client.insert_id = Int64.zero;
    Mp_client.server_status = status;
    Mp_client.warning_count = 0;
    Mp_client.message = "";
  }

let result_equals ok1 r2 = 
  let ok2 = build_ok_delete ok1.Mp_client.affected_rows 8704 in
  if (ok1 = r2 || ok2 = r2) then
    true
  else
    false

let test1 connection =
  let () = Mp_client.(
    let sql = "DELETE FROM test_ocmp WHERE f_autoinc_not_null_no_def=4" in
    let stmt = create_statement_from_string sql in
    assert_equal ~msg:sql 
      ~cmp:result_equals
      (build_ok_delete (Int64.of_int 1) 512)
      (Test_query.try_query ~f:(get_result_ok(get_result(execute ~connection:connection ~statement:stmt ()))) ~sql:sql)
  ) in
  let () = Mp_client.(
    let sql = "DELETE FROM test_ocmp WHERE f_string_null_no_def='string : ABCDEFGHIJKLMNOPQRSTUVWXYZ'" in
    let stmt = create_statement_from_string sql in
    assert_equal ~msg:sql 
      ~cmp:result_equals
      (build_ok_delete (Int64.of_int 1) 512)
      (Test_query.try_query ~f:(get_result_ok(get_result(execute ~connection:connection ~statement:stmt ()))) ~sql:sql)
  ) in
  let () = Mp_client.(
    let sql = "DELETE FROM test_ocmp WHERE f_int24_null_no_def=1677721" in
    let stmt = create_statement_from_string sql in
    assert_equal ~msg:sql 
      ~cmp:result_equals
      (build_ok_delete (Int64.of_int 1) 512)
      (Test_query.try_query ~f:(get_result_ok(get_result(execute ~connection:connection ~statement:stmt ()))) ~sql:sql)
  ) in
  let () = Mp_client.(
    let sql = "DELETE FROM test_ocmp WHERE f_string_null_no_def='not exist : XXXXXXXXXXXXXXXXXXXXX'" in
    let stmt = create_statement_from_string sql in
    assert_equal ~msg:sql 
      ~cmp:result_equals
      (build_ok_delete (Int64.of_int 0) 512)
      (Test_query.try_query ~f:(get_result_ok(get_result(execute ~connection:connection ~statement:stmt ()))) ~sql:sql)
  ) in
  let () = Mp_client.(
    let sql = "DELETE FROM test_ocmp" in
    let stmt = create_statement_from_string sql in
    assert_equal ~msg:sql 
      ~cmp:result_equals
      (* status is either 512 or 8704, it seems to be not the same depending on the MySQL version *)
      (build_ok_delete (Int64.of_int 5) 512)
      (Test_query.try_query ~f:(get_result_ok(get_result(execute ~connection:connection ~statement:stmt ()))) ~sql:sql)
  ) in
  ()

let test connection _ = 
  try
    test1 connection 
  with
  | Mp_client.Error e -> prerr_endline (Mp_client.error_exception_to_string e)
