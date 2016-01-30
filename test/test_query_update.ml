
open OUnit

let build_ok_update affected matched changed = 
  { Mp_client.affected_rows = Int64.of_int affected;
    Mp_client.insert_id = Int64.zero;
    Mp_client.server_status = 8704;
    Mp_client.warning_count = 0;
    Mp_client.message = "(Rows matched: " ^ (string_of_int matched) ^ "  Changed: " ^ (string_of_int changed) ^ "  Warnings: 0";
  }

let test1 _ connection testfile1 testfile2 update_var_string = 
  let () = Mp_client.(
    let sql = "UPDATE test_ocmp SET f_int_null_no_def = 9999" in
    let stmt = create_statement_from_string sql in
    assert_equal ~msg:sql 
      (build_ok_update 8 8 8)
      (Test_query.try_query ~f:(get_result_ok(get_result(execute ~connection:connection ~statement:stmt ()))) ~sql:sql)
  ) in
  let () = Mp_client.(
    let sql = "UPDATE test_ocmp SET f_blobimg_null_no_def = (LOAD_FILE('" ^ testfile1 ^ "'))" in
    let stmt = create_statement_from_string sql in
    let build_ok = build_ok_update 0 8 0 in
    assert_equal ~msg:sql 
      build_ok
      (Test_query.try_query ~f:(get_result_ok(get_result(execute ~connection:connection ~statement:stmt ()))) ~sql:sql)
  ) in
  let () = Mp_client.(
    let sql = "UPDATE test_ocmp SET f_bloblong_null_no_def = (LOAD_FILE('" ^ testfile2 ^ "'))" in
    let stmt = create_statement_from_string sql in
    let build_ok = build_ok_update 2 8 2 in
    assert_equal ~msg:sql 
      build_ok
      (Test_query.try_query ~f:(get_result_ok(get_result(execute ~connection:connection ~statement:stmt ()))) ~sql:sql)
  ) in
  let () = Mp_client.(
    let sql = "UPDATE test_ocmp SET f_varstring_null_no_def = '" ^ update_var_string ^ "'" in
    let stmt = create_statement_from_string sql in
    assert_equal ~msg:sql 
      (build_ok_update 8 8 8)
      (Test_query.try_query ~f:(get_result_ok(get_result(execute ~connection:connection ~statement:stmt ()))) ~sql:sql)
  ) in
  let () = Mp_client.(
    let sql = "UPDATE test_ocmp SET f_varstring_null_no_def = 'update varstring : ABCDEFGHIJKLMNOPQRSTUVWXYZ'" in
    let stmt = create_statement_from_string sql in
    assert_equal ~msg:sql 
      (build_ok_update 8 8 8)
      (Test_query.try_query ~f:(get_result_ok(get_result(execute ~connection:connection ~statement:stmt ()))) ~sql:sql)
  ) in
  ()

let test host connection encoding _ = 
  let module F = (
    val (
      match encoding with
      | Mp_charset.Latin1 -> (
          let module E = struct
            include Fixture_latin1
          end
          in (module E : Fixture.FIXTURE)
        )
      | Mp_charset.Utf8 -> (
          let module E = struct
            include Fixture_utf8
          end
          in (module E : Fixture.FIXTURE)
        )
      | _ -> assert false
    ) : Fixture.FIXTURE
  )
  in
  try
    test1 host connection Fixture_config.testfile1 Fixture_config.testfile2 F.update_var_string
  with
  | Mp_client.Error e -> prerr_endline (Mp_client.error_exception_to_string e)
