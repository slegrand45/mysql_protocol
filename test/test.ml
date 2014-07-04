
open OUnit;;

(*
  TODO: TESTER procédure stockée qui renvoie plusieurs SELECT
*)

let host_51 = "192.168.1.30";;
let addr_51 = Unix.inet_addr_of_string host_51;;
let version_51 = 5169;;

let host_55 = "192.168.1.40";;
let addr_55 = Unix.inet_addr_of_string host_55;;
let version_55 = 5531;;

let host_56 = "192.168.1.20";;
let addr_56 = Unix.inet_addr_of_string host_56;;
let version_56 = 5611;;


let port = 3306;;
let db_user = "user_ocaml_ocmp";;
let db_password = "ocmp";;

let hosts = [
  (version_51, host_51, addr_51, port, db_user, db_password);
  (version_55, host_55, addr_55, port, db_user, db_password);
  (version_56, host_56, addr_56, port, db_user, db_password);
];;

let init host sql db_name = 
  let (_, hostname, _, _, db_user, db_password) = host in
  let (tmp, oc) = Filename.open_temp_file "ocmp" "fixture" in
  let () = output_string oc sql in
  let () = flush oc in
  let cmd = "mysql -u " ^ db_user ^ " -p" ^ db_password 
    ^ " -h " ^ hostname ^ " " ^ db_name ^ " < " ^ tmp in
  let result = Unix.system cmd in
  let () = close_out oc in
  let () = Unix.unlink tmp in
  match result with
  | Unix.WEXITED v ->
      if (v <> 0) then 
	failwith ("Unable to init test database (return code = " ^ (string_of_int v) ^ "). Please check that the command : \"" ^ cmd ^ "\" can be run with /bin/sh")
  | _ -> (
      failwith ("Unable to init test database. Please check that the command : \"" ^ cmd ^ "\" can be run with /bin/sh")
     )
;;

let suite host connection encoding config = 
  let (charset, _) = encoding in
  "MySQL Protocol tests" >::: 
  ["test_query_bad" >:: Test_query_bad.test connection;
   "test_query_ok" >:: Test_query_select.test host connection charset;
   "test_prepare_ok" >:: Test_query_prepare.test host connection charset;
   "test_execute_ok" >:: Test_query_execute.test host connection charset;
   "test_fetch_ok" >:: Test_query_fetch.test connection charset;
   "test_close_statement" >:: Test_query_close_statement.test host connection;
   "test_insert_ok" >:: Test_query_insert.test connection charset;
   "test_update_ok" >:: Test_query_update.test host connection charset;
   "test_delete_ok" >:: Test_query_delete.test connection;
   "test_grant_ok" >:: Test_query_grant.test host connection charset;
   "test_ping" >:: Test_ping.test connection;
   "test_change_user" >:: Test_change_user.test connection;
   "test_connect" >:: Test_connect.test host config encoding;
   "test_client" >:: Test_client.test host encoding;]
;;

let run_tests host sql encoding =
  let (_, _, addr, port, db_user, db_password) = host in
  let (charset, _) = encoding in
  let module F = (
    val (
      match charset with
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
  let () = init host sql F.db_name in
  let sockaddr = Unix.ADDR_INET(addr, port) in
  let config = Mp_client.configuration ~user:db_user ~password:db_password ~sockaddr:sockaddr ~charset:encoding ~databasename:F.db_name () in
  let connection = Mp_client.connect ~configuration:config ~force:true () in
  let () = Mp_client.use_database ~connection:connection ~databasename:F.db_name in
  let () = Test_benchmark.reset_stats () in 
  let _ = run_test_tt ~verbose:false (suite host connection encoding config) in
  let () = prerr_newline () in
  let () = prerr_endline (Test_benchmark.stats_to_string ()) in
  let () = Mp_client.disconnect ~connection:connection in
  ()

let run_host host = 
  let () = run_tests host Fixture_latin1.sql (Mp_charset.Latin1, Mp_charset.Latin1_swedish_ci) in
  let () = run_tests host Fixture_utf8.sql (Mp_charset.Utf8, Mp_charset.Utf8_general_ci) in
  ()
;;

let () = 
  List.iter run_host hosts
;;
