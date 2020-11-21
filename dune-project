(lang dune 2.7)

(name mysql_protocol)

(version 3.0)

(generate_opam_files true)

(source (github slegrand45/mysql_protocol))
(license LGPL-3.0-or-later)
(authors "Stéphane Legrand")
(maintainers "Stéphane Legrand")

(package
 (name mysql_protocol)
 (synopsis "OCaml implementation of the native MySQL/MariaDB Protocol with the Bitstring library")
 (depends
  (dune (>= 2.7))
  (ocaml (>= 4.10.0))
  cryptokit
  (oUnit :with-test)
  (bitstring (>= 4.0.1))
  (ppx_bitstring (>= 4.0.1))
))
