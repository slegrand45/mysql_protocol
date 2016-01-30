
open OUnit

let build_ok_grant = 
  { Mp_client.affected_rows = Int64.zero;
    Mp_client.insert_id = Int64.zero;
    Mp_client.server_status = 512;
    Mp_client.warning_count = 0;
    Mp_client.message = "";
  }

let test1 host connection db_name = 
  let (_, _, _, _, db_user, _) = host in
  let () = Mp_client.(
    let sql = "GRANT SELECT ON " ^ db_name ^ ".* TO '" ^ db_user ^ "'@'localhost'" in
    let stmt = create_statement_from_string sql in
    assert_equal ~msg:sql 
      build_ok_grant
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
    test1 host connection F.db_name
  with
  | Mp_client.Error e -> prerr_endline (Mp_client.error_exception_to_string e)
