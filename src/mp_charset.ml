
type charset_name =
    Armscii8
  | Ascii
  | Big5
  | Binary_charset (* /!\ : renamed to avoid conflict with binary collation *)
  | Cp1250
  | Cp1251
  | Cp1256
  | Cp1257
  | Cp850
  | Cp852
  | Cp866
  | Cp932
  | Dec8
  | Eucjpms
  | Euckr
  | Gb2312
  | Gbk
  | Geostd8
  | Greek
  | Hebrew
  | Hp8
  | Keybcs2
  | Koi8r
  | Koi8u
  | Latin1
  | Latin2
  | Latin5
  | Latin7
  | Macce
  | Macroman
  | Sjis
  | Swe7
  | Tis620
  | Ucs2
  | Ujis
  | Utf16
  | Utf16le
  | Utf32
  | Utf8
  | Utf8mb4

type collation_name =
    Armscii8_bin
  | Armscii8_general_ci
  | Armscii8_general_nopad_ci
  | Armscii8_nopad_bin
  | Ascii_bin
  | Ascii_general_ci
  | Ascii_general_nopad_ci
  | Ascii_nopad_bin
  | Big5_bin
  | Big5_chinese_ci
  | Big5_chinese_nopad_ci
  | Big5_nopad_bin
  | Binary_collation (* /!\ : renamed to avoid conflict with binary charset *)
  | Cp1250_bin
  | Cp1250_croatian_ci
  | Cp1250_czech_cs
  | Cp1250_general_ci
  | Cp1250_general_nopad_ci
  | Cp1250_nopad_bin
  | Cp1250_polish_ci
  | Cp1251_bin
  | Cp1251_bulgarian_ci
  | Cp1251_general_ci
  | Cp1251_general_cs
  | Cp1251_general_nopad_ci
  | Cp1251_nopad_bin
  | Cp1251_ukrainian_ci
  | Cp1256_bin
  | Cp1256_general_ci
  | Cp1256_general_nopad_ci
  | Cp1256_nopad_bin
  | Cp1257_bin
  | Cp1257_general_ci
  | Cp1257_general_nopad_ci
  | Cp1257_lithuanian_ci
  | Cp1257_nopad_bin
  | Cp850_bin
  | Cp850_general_ci
  | Cp850_general_nopad_ci
  | Cp850_nopad_bin
  | Cp852_bin
  | Cp852_general_ci
  | Cp852_general_nopad_ci
  | Cp852_nopad_bin
  | Cp866_bin
  | Cp866_general_ci
  | Cp866_general_nopad_ci
  | Cp866_nopad_bin
  | Cp932_bin
  | Cp932_japanese_ci
  | Cp932_japanese_nopad_ci
  | Cp932_nopad_bin
  | Dec8_bin
  | Dec8_nopad_bin
  | Dec8_swedish_ci
  | Dec8_swedish_nopad_ci
  | Eucjpms_bin
  | Eucjpms_japanese_ci
  | Eucjpms_japanese_nopad_ci
  | Eucjpms_nopad_bin
  | Euckr_bin
  | Euckr_korean_ci
  | Euckr_korean_nopad_ci
  | Euckr_nopad_bin
  | Gb2312_bin
  | Gb2312_chinese_ci
  | Gb2312_chinese_nopad_ci
  | Gb2312_nopad_bin
  | Gbk_bin
  | Gbk_chinese_ci
  | Gbk_chinese_nopad_ci
  | Gbk_nopad_bin
  | Geostd8_bin
  | Geostd8_general_ci
  | Geostd8_general_nopad_ci
  | Geostd8_nopad_bin
  | Greek_bin
  | Greek_general_ci
  | Greek_general_nopad_ci
  | Greek_nopad_bin
  | Hebrew_bin
  | Hebrew_general_ci
  | Hebrew_general_nopad_ci
  | Hebrew_nopad_bin
  | Hp8_bin
  | Hp8_english_ci
  | Hp8_english_nopad_ci
  | Hp8_nopad_bin
  | Keybcs2_bin
  | Keybcs2_general_ci
  | Keybcs2_general_nopad_ci
  | Keybcs2_nopad_bin
  | Koi8r_bin
  | Koi8r_general_ci
  | Koi8r_general_nopad_ci
  | Koi8r_nopad_bin
  | Koi8u_bin
  | Koi8u_general_ci
  | Koi8u_general_nopad_ci
  | Koi8u_nopad_bin
  | Latin1_bin
  | Latin1_danish_ci
  | Latin1_general_ci
  | Latin1_general_cs
  | Latin1_german1_ci
  | Latin1_german2_ci
  | Latin1_nopad_bin
  | Latin1_spanish_ci
  | Latin1_swedish_ci
  | Latin1_swedish_nopad_ci
  | Latin2_bin
  | Latin2_croatian_ci
  | Latin2_czech_cs
  | Latin2_general_ci
  | Latin2_general_nopad_ci
  | Latin2_hungarian_ci
  | Latin2_nopad_bin
  | Latin5_bin
  | Latin5_nopad_bin
  | Latin5_turkish_ci
  | Latin5_turkish_nopad_ci
  | Latin7_bin
  | Latin7_estonian_cs
  | Latin7_general_ci
  | Latin7_general_cs
  | Latin7_general_nopad_ci
  | Latin7_nopad_bin
  | Macce_bin
  | Macce_general_ci
  | Macce_general_nopad_ci
  | Macce_nopad_bin
  | Macroman_bin
  | Macroman_general_ci
  | Macroman_general_nopad_ci
  | Macroman_nopad_bin
  | Sjis_bin
  | Sjis_japanese_ci
  | Sjis_japanese_nopad_ci
  | Sjis_nopad_bin
  | Swe7_bin
  | Swe7_nopad_bin
  | Swe7_swedish_ci
  | Swe7_swedish_nopad_ci
  | Tis620_bin
  | Tis620_nopad_bin
  | Tis620_thai_ci
  | Tis620_thai_nopad_ci
  | Ucs2_bin
  | Ucs2_croatian_ci
  | Ucs2_croatian_mysql561_ci
  | Ucs2_czech_ci
  | Ucs2_danish_ci
  | Ucs2_esperanto_ci
  | Ucs2_estonian_ci
  | Ucs2_general_ci
  | Ucs2_general_mysql500_ci
  | Ucs2_general_nopad_ci
  | Ucs2_german2_ci
  | Ucs2_hungarian_ci
  | Ucs2_icelandic_ci
  | Ucs2_latvian_ci
  | Ucs2_lithuanian_ci
  | Ucs2_myanmar_ci
  | Ucs2_nopad_bin
  | Ucs2_persian_ci
  | Ucs2_polish_ci
  | Ucs2_romanian_ci
  | Ucs2_roman_ci
  | Ucs2_sinhala_ci
  | Ucs2_slovak_ci
  | Ucs2_slovenian_ci
  | Ucs2_spanish2_ci
  | Ucs2_spanish_ci
  | Ucs2_swedish_ci
  | Ucs2_thai_520_w2
  | Ucs2_turkish_ci
  | Ucs2_unicode_520_ci
  | Ucs2_unicode_520_nopad_ci
  | Ucs2_unicode_ci
  | Ucs2_unicode_nopad_ci
  | Ucs2_vietnamese_ci
  | Ujis_bin
  | Ujis_japanese_ci
  | Ujis_japanese_nopad_ci
  | Ujis_nopad_bin
  | Utf16le_bin
  | Utf16le_general_ci
  | Utf16le_general_nopad_ci
  | Utf16le_nopad_bin
  | Utf16_bin
  | Utf16_croatian_ci
  | Utf16_croatian_mysql561_ci
  | Utf16_czech_ci
  | Utf16_danish_ci
  | Utf16_esperanto_ci
  | Utf16_estonian_ci
  | Utf16_general_ci
  | Utf16_general_nopad_ci
  | Utf16_german2_ci
  | Utf16_hungarian_ci
  | Utf16_icelandic_ci
  | Utf16_latvian_ci
  | Utf16_lithuanian_ci
  | Utf16_myanmar_ci
  | Utf16_nopad_bin
  | Utf16_persian_ci
  | Utf16_polish_ci
  | Utf16_romanian_ci
  | Utf16_roman_ci
  | Utf16_sinhala_ci
  | Utf16_slovak_ci
  | Utf16_slovenian_ci
  | Utf16_spanish2_ci
  | Utf16_spanish_ci
  | Utf16_swedish_ci
  | Utf16_thai_520_w2
  | Utf16_turkish_ci
  | Utf16_unicode_520_ci
  | Utf16_unicode_520_nopad_ci
  | Utf16_unicode_ci
  | Utf16_unicode_nopad_ci
  | Utf16_vietnamese_ci
  | Utf32_bin
  | Utf32_croatian_ci
  | Utf32_croatian_mysql561_ci
  | Utf32_czech_ci
  | Utf32_danish_ci
  | Utf32_esperanto_ci
  | Utf32_estonian_ci
  | Utf32_general_ci
  | Utf32_general_nopad_ci
  | Utf32_german2_ci
  | Utf32_hungarian_ci
  | Utf32_icelandic_ci
  | Utf32_latvian_ci
  | Utf32_lithuanian_ci
  | Utf32_myanmar_ci
  | Utf32_nopad_bin
  | Utf32_persian_ci
  | Utf32_polish_ci
  | Utf32_romanian_ci
  | Utf32_roman_ci
  | Utf32_sinhala_ci
  | Utf32_slovak_ci
  | Utf32_slovenian_ci
  | Utf32_spanish2_ci
  | Utf32_spanish_ci
  | Utf32_swedish_ci
  | Utf32_thai_520_w2
  | Utf32_turkish_ci
  | Utf32_unicode_520_ci
  | Utf32_unicode_520_nopad_ci
  | Utf32_unicode_ci
  | Utf32_unicode_nopad_ci
  | Utf32_vietnamese_ci
  | Utf8mb4_bin
  | Utf8mb4_croatian_ci
  | Utf8mb4_croatian_mysql561_ci
  | Utf8mb4_czech_ci
  | Utf8mb4_danish_ci
  | Utf8mb4_esperanto_ci
  | Utf8mb4_estonian_ci
  | Utf8mb4_general_ci
  | Utf8mb4_general_nopad_ci
  | Utf8mb4_german2_ci
  | Utf8mb4_hungarian_ci
  | Utf8mb4_icelandic_ci
  | Utf8mb4_latvian_ci
  | Utf8mb4_lithuanian_ci
  | Utf8mb4_myanmar_ci
  | Utf8mb4_nopad_bin
  | Utf8mb4_persian_ci
  | Utf8mb4_polish_ci
  | Utf8mb4_romanian_ci
  | Utf8mb4_roman_ci
  | Utf8mb4_sinhala_ci
  | Utf8mb4_slovak_ci
  | Utf8mb4_slovenian_ci
  | Utf8mb4_spanish2_ci
  | Utf8mb4_spanish_ci
  | Utf8mb4_swedish_ci
  | Utf8mb4_thai_520_w2
  | Utf8mb4_turkish_ci
  | Utf8mb4_unicode_520_ci
  | Utf8mb4_unicode_520_nopad_ci
  | Utf8mb4_unicode_ci
  | Utf8mb4_unicode_nopad_ci
  | Utf8mb4_vietnamese_ci
  | Utf8_bin
  | Utf8_croatian_ci
  | Utf8_croatian_mysql561_ci
  | Utf8_czech_ci
  | Utf8_danish_ci
  | Utf8_esperanto_ci
  | Utf8_estonian_ci
  | Utf8_general_ci
  | Utf8_general_mysql500_ci
  | Utf8_general_nopad_ci
  | Utf8_german2_ci
  | Utf8_hungarian_ci
  | Utf8_icelandic_ci
  | Utf8_latvian_ci
  | Utf8_lithuanian_ci
  | Utf8_myanmar_ci
  | Utf8_nopad_bin
  | Utf8_persian_ci
  | Utf8_polish_ci
  | Utf8_romanian_ci
  | Utf8_roman_ci
  | Utf8_sinhala_ci
  | Utf8_slovak_ci
  | Utf8_slovenian_ci
  | Utf8_spanish2_ci
  | Utf8_spanish_ci
  | Utf8_swedish_ci
  | Utf8_thai_520_w2
  | Utf8_turkish_ci
  | Utf8_unicode_520_ci
  | Utf8_unicode_520_nopad_ci
  | Utf8_unicode_ci
  | Utf8_unicode_nopad_ci
  | Utf8_vietnamese_ci

let charset_name_to_string cn =
  match cn with
  | Armscii8 -> "Armscii8"
  | Ascii -> "Ascii"
  | Big5 -> "Big5"
  | Binary_charset  -> "Binary_charset" (* /!\ : renamed to avoid conflict with binary collation *)
  | Cp1250 -> "Cp1250"
  | Cp1251 -> "Cp1251"
  | Cp1256 -> "Cp1256"
  | Cp1257 -> "Cp1257"
  | Cp850 -> "Cp850"
  | Cp852 -> "Cp852"
  | Cp866 -> "Cp866"
  | Cp932 -> "Cp932"
  | Dec8 -> "Dec8"
  | Eucjpms -> "Eucjpms"
  | Euckr -> "Euckr"
  | Gb2312 -> "Gb2312"
  | Gbk -> "Gbk"
  | Geostd8 -> "Geostd8"
  | Greek -> "Greek"
  | Hebrew -> "Hebrew"
  | Hp8 -> "Hp8"
  | Keybcs2 -> "Keybcs2"
  | Koi8r -> "Koi8r"
  | Koi8u -> "Koi8u"
  | Latin1 -> "Latin1"
  | Latin2 -> "Latin2"
  | Latin5 -> "Latin5"
  | Latin7 -> "Latin7"
  | Macce -> "Macce"
  | Macroman -> "Macroman"
  | Sjis -> "Sjis"
  | Swe7 -> "Swe7"
  | Tis620 -> "Tis620"
  | Ucs2 -> "Ucs2"
  | Ujis -> "Ujis"
  | Utf16 -> "Utf16"
  | Utf16le -> "Utf16le"
  | Utf32 -> "Utf32"
  | Utf8 -> "Utf8"
  | Utf8mb4 -> "Utf8mb4"

type charset = (charset_name * collation_name)

let collation_name_to_string c =
  match c with
  | Armscii8_bin -> "Armscii8_bin"
  | Armscii8_general_ci -> "Armscii8_general_ci"
  | Armscii8_general_nopad_ci -> "Armscii8_general_nopad_ci"
  | Armscii8_nopad_bin -> "Armscii8_nopad_bin"
  | Ascii_bin -> "Ascii_bin"
  | Ascii_general_ci -> "Ascii_general_ci"
  | Ascii_general_nopad_ci -> "Ascii_general_nopad_ci"
  | Ascii_nopad_bin -> "Ascii_nopad_bin"
  | Big5_bin -> "Big5_bin"
  | Big5_chinese_ci -> "Big5_chinese_ci"
  | Big5_chinese_nopad_ci -> "Big5_chinese_nopad_ci"
  | Big5_nopad_bin -> "Big5_nopad_bin"
  | Binary_collation -> "Binary_collation" (* /!\ : renamed to avoid conflict with binary charset *)
  | Cp1250_bin -> "Cp1250_bin"
  | Cp1250_croatian_ci -> "Cp1250_croatian_ci"
  | Cp1250_czech_cs -> "Cp1250_czech_cs"
  | Cp1250_general_ci -> "Cp1250_general_ci"
  | Cp1250_general_nopad_ci -> "Cp1250_general_nopad_ci"
  | Cp1250_nopad_bin -> "Cp1250_nopad_bin"
  | Cp1250_polish_ci -> "Cp1250_polish_ci"
  | Cp1251_bin -> "Cp1251_bin"
  | Cp1251_bulgarian_ci -> "Cp1251_bulgarian_ci"
  | Cp1251_general_ci -> "Cp1251_general_ci"
  | Cp1251_general_cs -> "Cp1251_general_cs"
  | Cp1251_general_nopad_ci -> "Cp1251_general_nopad_ci"
  | Cp1251_nopad_bin -> "Cp1251_nopad_bin"
  | Cp1251_ukrainian_ci -> "Cp1251_ukrainian_ci"
  | Cp1256_bin -> "Cp1256_bin"
  | Cp1256_general_ci -> "Cp1256_general_ci"
  | Cp1256_general_nopad_ci -> "Cp1256_general_nopad_ci"
  | Cp1256_nopad_bin -> "Cp1256_nopad_bin"
  | Cp1257_bin -> "Cp1257_bin"
  | Cp1257_general_ci -> "Cp1257_general_ci"
  | Cp1257_general_nopad_ci -> "Cp1257_general_nopad_ci"
  | Cp1257_lithuanian_ci -> "Cp1257_lithuanian_ci"
  | Cp1257_nopad_bin -> "Cp1257_nopad_bin"
  | Cp850_bin -> "Cp850_bin"
  | Cp850_general_ci -> "Cp850_general_ci"
  | Cp850_general_nopad_ci -> "Cp850_general_nopad_ci"
  | Cp850_nopad_bin -> "Cp850_nopad_bin"
  | Cp852_bin -> "Cp852_bin"
  | Cp852_general_ci -> "Cp852_general_ci"
  | Cp852_general_nopad_ci -> "Cp852_general_nopad_ci"
  | Cp852_nopad_bin -> "Cp852_nopad_bin"
  | Cp866_bin -> "Cp866_bin"
  | Cp866_general_ci -> "Cp866_general_ci"
  | Cp866_general_nopad_ci -> "Cp866_general_nopad_ci"
  | Cp866_nopad_bin -> "Cp866_nopad_bin"
  | Cp932_bin -> "Cp932_bin"
  | Cp932_japanese_ci -> "Cp932_japanese_ci"
  | Cp932_japanese_nopad_ci -> "Cp932_japanese_nopad_ci"
  | Cp932_nopad_bin -> "Cp932_nopad_bin"
  | Dec8_bin -> "Dec8_bin"
  | Dec8_nopad_bin -> "Dec8_nopad_bin"
  | Dec8_swedish_ci -> "Dec8_swedish_ci"
  | Dec8_swedish_nopad_ci -> "Dec8_swedish_nopad_ci"
  | Eucjpms_bin -> "Eucjpms_bin"
  | Eucjpms_japanese_ci -> "Eucjpms_japanese_ci"
  | Eucjpms_japanese_nopad_ci -> "Eucjpms_japanese_nopad_ci"
  | Eucjpms_nopad_bin -> "Eucjpms_nopad_bin"
  | Euckr_bin -> "Euckr_bin"
  | Euckr_korean_ci -> "Euckr_korean_ci"
  | Euckr_korean_nopad_ci -> "Euckr_korean_nopad_ci"
  | Euckr_nopad_bin -> "Euckr_nopad_bin"
  | Gb2312_bin -> "Gb2312_bin"
  | Gb2312_chinese_ci -> "Gb2312_chinese_ci"
  | Gb2312_chinese_nopad_ci -> "Gb2312_chinese_nopad_ci"
  | Gb2312_nopad_bin -> "Gb2312_nopad_bin"
  | Gbk_bin -> "Gbk_bin"
  | Gbk_chinese_ci -> "Gbk_chinese_ci"
  | Gbk_chinese_nopad_ci -> "Gbk_chinese_nopad_ci"
  | Gbk_nopad_bin -> "Gbk_nopad_bin"
  | Geostd8_bin -> "Geostd8_bin"
  | Geostd8_general_ci -> "Geostd8_general_ci"
  | Geostd8_general_nopad_ci -> "Geostd8_general_nopad_ci"
  | Geostd8_nopad_bin -> "Geostd8_nopad_bin"
  | Greek_bin -> "Greek_bin"
  | Greek_general_ci -> "Greek_general_ci"
  | Greek_general_nopad_ci -> "Greek_general_nopad_ci"
  | Greek_nopad_bin -> "Greek_nopad_bin"
  | Hebrew_bin -> "Hebrew_bin"
  | Hebrew_general_ci -> "Hebrew_general_ci"
  | Hebrew_general_nopad_ci -> "Hebrew_general_nopad_ci"
  | Hebrew_nopad_bin -> "Hebrew_nopad_bin"
  | Hp8_bin -> "Hp8_bin"
  | Hp8_english_ci -> "Hp8_english_ci"
  | Hp8_english_nopad_ci -> "Hp8_english_nopad_ci"
  | Hp8_nopad_bin -> "Hp8_nopad_bin"
  | Keybcs2_bin -> "Keybcs2_bin"
  | Keybcs2_general_ci -> "Keybcs2_general_ci"
  | Keybcs2_general_nopad_ci -> "Keybcs2_general_nopad_ci"
  | Keybcs2_nopad_bin -> "Keybcs2_nopad_bin"
  | Koi8r_bin -> "Koi8r_bin"
  | Koi8r_general_ci -> "Koi8r_general_ci"
  | Koi8r_general_nopad_ci -> "Koi8r_general_nopad_ci"
  | Koi8r_nopad_bin -> "Koi8r_nopad_bin"
  | Koi8u_bin -> "Koi8u_bin"
  | Koi8u_general_ci -> "Koi8u_general_ci"
  | Koi8u_general_nopad_ci -> "Koi8u_general_nopad_ci"
  | Koi8u_nopad_bin -> "Koi8u_nopad_bin"
  | Latin1_bin -> "Latin1_bin"
  | Latin1_danish_ci -> "Latin1_danish_ci"
  | Latin1_general_ci -> "Latin1_general_ci"
  | Latin1_general_cs -> "Latin1_general_cs"
  | Latin1_german1_ci -> "Latin1_german1_ci"
  | Latin1_german2_ci -> "Latin1_german2_ci"
  | Latin1_nopad_bin -> "Latin1_nopad_bin"
  | Latin1_spanish_ci -> "Latin1_spanish_ci"
  | Latin1_swedish_ci -> "Latin1_swedish_ci"
  | Latin1_swedish_nopad_ci -> "Latin1_swedish_nopad_ci"
  | Latin2_bin -> "Latin2_bin"
  | Latin2_croatian_ci -> "Latin2_croatian_ci"
  | Latin2_czech_cs -> "Latin2_czech_cs"
  | Latin2_general_ci -> "Latin2_general_ci"
  | Latin2_general_nopad_ci -> "Latin2_general_nopad_ci"
  | Latin2_hungarian_ci -> "Latin2_hungarian_ci"
  | Latin2_nopad_bin -> "Latin2_nopad_bin"
  | Latin5_bin -> "Latin5_bin"
  | Latin5_nopad_bin -> "Latin5_nopad_bin"
  | Latin5_turkish_ci -> "Latin5_turkish_ci"
  | Latin5_turkish_nopad_ci -> "Latin5_turkish_nopad_ci"
  | Latin7_bin -> "Latin7_bin"
  | Latin7_estonian_cs -> "Latin7_estonian_cs"
  | Latin7_general_ci -> "Latin7_general_ci"
  | Latin7_general_cs -> "Latin7_general_cs"
  | Latin7_general_nopad_ci -> "Latin7_general_nopad_ci"
  | Latin7_nopad_bin -> "Latin7_nopad_bin"
  | Macce_bin -> "Macce_bin"
  | Macce_general_ci -> "Macce_general_ci"
  | Macce_general_nopad_ci -> "Macce_general_nopad_ci"
  | Macce_nopad_bin -> "Macce_nopad_bin"
  | Macroman_bin -> "Macroman_bin"
  | Macroman_general_ci -> "Macroman_general_ci"
  | Macroman_general_nopad_ci -> "Macroman_general_nopad_ci"
  | Macroman_nopad_bin -> "Macroman_nopad_bin"
  | Sjis_bin -> "Sjis_bin"
  | Sjis_japanese_ci -> "Sjis_japanese_ci"
  | Sjis_japanese_nopad_ci -> "Sjis_japanese_nopad_ci"
  | Sjis_nopad_bin -> "Sjis_nopad_bin"
  | Swe7_bin -> "Swe7_bin"
  | Swe7_nopad_bin -> "Swe7_nopad_bin"
  | Swe7_swedish_ci -> "Swe7_swedish_ci"
  | Swe7_swedish_nopad_ci -> "Swe7_swedish_nopad_ci"
  | Tis620_bin -> "Tis620_bin"
  | Tis620_nopad_bin -> "Tis620_nopad_bin"
  | Tis620_thai_ci -> "Tis620_thai_ci"
  | Tis620_thai_nopad_ci -> "Tis620_thai_nopad_ci"
  | Ucs2_bin -> "Ucs2_bin"
  | Ucs2_croatian_ci -> "Ucs2_croatian_ci"
  | Ucs2_croatian_mysql561_ci -> "Ucs2_croatian_mysql561_ci"
  | Ucs2_czech_ci -> "Ucs2_czech_ci"
  | Ucs2_danish_ci -> "Ucs2_danish_ci"
  | Ucs2_esperanto_ci -> "Ucs2_esperanto_ci"
  | Ucs2_estonian_ci -> "Ucs2_estonian_ci"
  | Ucs2_general_ci -> "Ucs2_general_ci"
  | Ucs2_general_mysql500_ci -> "Ucs2_general_mysql500_ci"
  | Ucs2_general_nopad_ci -> "Ucs2_general_nopad_ci"
  | Ucs2_german2_ci -> "Ucs2_german2_ci"
  | Ucs2_hungarian_ci -> "Ucs2_hungarian_ci"
  | Ucs2_icelandic_ci -> "Ucs2_icelandic_ci"
  | Ucs2_latvian_ci -> "Ucs2_latvian_ci"
  | Ucs2_lithuanian_ci -> "Ucs2_lithuanian_ci"
  | Ucs2_myanmar_ci -> "Ucs2_myanmar_ci"
  | Ucs2_nopad_bin -> "Ucs2_nopad_bin"
  | Ucs2_persian_ci -> "Ucs2_persian_ci"
  | Ucs2_polish_ci -> "Ucs2_polish_ci"
  | Ucs2_romanian_ci -> "Ucs2_romanian_ci"
  | Ucs2_roman_ci -> "Ucs2_roman_ci"
  | Ucs2_sinhala_ci -> "Ucs2_sinhala_ci"
  | Ucs2_slovak_ci -> "Ucs2_slovak_ci"
  | Ucs2_slovenian_ci -> "Ucs2_slovenian_ci"
  | Ucs2_spanish2_ci -> "Ucs2_spanish2_ci"
  | Ucs2_spanish_ci -> "Ucs2_spanish_ci"
  | Ucs2_swedish_ci -> "Ucs2_swedish_ci"
  | Ucs2_thai_520_w2 -> "Ucs2_thai_520_w2"
  | Ucs2_turkish_ci -> "Ucs2_turkish_ci"
  | Ucs2_unicode_520_ci -> "Ucs2_unicode_520_ci"
  | Ucs2_unicode_520_nopad_ci -> "Ucs2_unicode_520_nopad_ci"
  | Ucs2_unicode_ci -> "Ucs2_unicode_ci"
  | Ucs2_unicode_nopad_ci -> "Ucs2_unicode_nopad_ci"
  | Ucs2_vietnamese_ci -> "Ucs2_vietnamese_ci"
  | Ujis_bin -> "Ujis_bin"
  | Ujis_japanese_ci -> "Ujis_japanese_ci"
  | Ujis_japanese_nopad_ci -> "Ujis_japanese_nopad_ci"
  | Ujis_nopad_bin -> "Ujis_nopad_bin"
  | Utf16le_bin -> "Utf16le_bin"
  | Utf16le_general_ci -> "Utf16le_general_ci"
  | Utf16le_general_nopad_ci -> "Utf16le_general_nopad_ci"
  | Utf16le_nopad_bin -> "Utf16le_nopad_bin"
  | Utf16_bin -> "Utf16_bin"
  | Utf16_croatian_ci -> "Utf16_croatian_ci"
  | Utf16_croatian_mysql561_ci -> "Utf16_croatian_mysql561_ci"
  | Utf16_czech_ci -> "Utf16_czech_ci"
  | Utf16_danish_ci -> "Utf16_danish_ci"
  | Utf16_esperanto_ci -> "Utf16_esperanto_ci"
  | Utf16_estonian_ci -> "Utf16_estonian_ci"
  | Utf16_general_ci -> "Utf16_general_ci"
  | Utf16_general_nopad_ci -> "Utf16_general_nopad_ci"
  | Utf16_german2_ci -> "Utf16_german2_ci"
  | Utf16_hungarian_ci -> "Utf16_hungarian_ci"
  | Utf16_icelandic_ci -> "Utf16_icelandic_ci"
  | Utf16_latvian_ci -> "Utf16_latvian_ci"
  | Utf16_lithuanian_ci -> "Utf16_lithuanian_ci"
  | Utf16_myanmar_ci -> "Utf16_myanmar_ci"
  | Utf16_nopad_bin -> "Utf16_nopad_bin"
  | Utf16_persian_ci -> "Utf16_persian_ci"
  | Utf16_polish_ci -> "Utf16_polish_ci"
  | Utf16_romanian_ci -> "Utf16_romanian_ci"
  | Utf16_roman_ci -> "Utf16_roman_ci"
  | Utf16_sinhala_ci -> "Utf16_sinhala_ci"
  | Utf16_slovak_ci -> "Utf16_slovak_ci"
  | Utf16_slovenian_ci -> "Utf16_slovenian_ci"
  | Utf16_spanish2_ci -> "Utf16_spanish2_ci"
  | Utf16_spanish_ci -> "Utf16_spanish_ci"
  | Utf16_swedish_ci -> "Utf16_swedish_ci"
  | Utf16_thai_520_w2 -> "Utf16_thai_520_w2"
  | Utf16_turkish_ci -> "Utf16_turkish_ci"
  | Utf16_unicode_520_ci -> "Utf16_unicode_520_ci"
  | Utf16_unicode_520_nopad_ci -> "Utf16_unicode_520_nopad_ci"
  | Utf16_unicode_ci -> "Utf16_unicode_ci"
  | Utf16_unicode_nopad_ci -> "Utf16_unicode_nopad_ci"
  | Utf16_vietnamese_ci -> "Utf16_vietnamese_ci"
  | Utf32_bin -> "Utf32_bin"
  | Utf32_croatian_ci -> "Utf32_croatian_ci"
  | Utf32_croatian_mysql561_ci -> "Utf32_croatian_mysql561_ci"
  | Utf32_czech_ci -> "Utf32_czech_ci"
  | Utf32_danish_ci -> "Utf32_danish_ci"
  | Utf32_esperanto_ci -> "Utf32_esperanto_ci"
  | Utf32_estonian_ci -> "Utf32_estonian_ci"
  | Utf32_general_ci -> "Utf32_general_ci"
  | Utf32_general_nopad_ci -> "Utf32_general_nopad_ci"
  | Utf32_german2_ci -> "Utf32_german2_ci"
  | Utf32_hungarian_ci -> "Utf32_hungarian_ci"
  | Utf32_icelandic_ci -> "Utf32_icelandic_ci"
  | Utf32_latvian_ci -> "Utf32_latvian_ci"
  | Utf32_lithuanian_ci -> "Utf32_lithuanian_ci"
  | Utf32_myanmar_ci -> "Utf32_myanmar_ci"
  | Utf32_nopad_bin -> "Utf32_nopad_bin"
  | Utf32_persian_ci -> "Utf32_persian_ci"
  | Utf32_polish_ci -> "Utf32_polish_ci"
  | Utf32_romanian_ci -> "Utf32_romanian_ci"
  | Utf32_roman_ci -> "Utf32_roman_ci"
  | Utf32_sinhala_ci -> "Utf32_sinhala_ci"
  | Utf32_slovak_ci -> "Utf32_slovak_ci"
  | Utf32_slovenian_ci -> "Utf32_slovenian_ci"
  | Utf32_spanish2_ci -> "Utf32_spanish2_ci"
  | Utf32_spanish_ci -> "Utf32_spanish_ci"
  | Utf32_swedish_ci -> "Utf32_swedish_ci"
  | Utf32_thai_520_w2 -> "Utf32_thai_520_w2"
  | Utf32_turkish_ci -> "Utf32_turkish_ci"
  | Utf32_unicode_520_ci -> "Utf32_unicode_520_ci"
  | Utf32_unicode_520_nopad_ci -> "Utf32_unicode_520_nopad_ci"
  | Utf32_unicode_ci -> "Utf32_unicode_ci"
  | Utf32_unicode_nopad_ci -> "Utf32_unicode_nopad_ci"
  | Utf32_vietnamese_ci -> "Utf32_vietnamese_ci"
  | Utf8mb4_bin -> "Utf8mb4_bin"
  | Utf8mb4_croatian_ci -> "Utf8mb4_croatian_ci"
  | Utf8mb4_croatian_mysql561_ci -> "Utf8mb4_croatian_mysql561_ci"
  | Utf8mb4_czech_ci -> "Utf8mb4_czech_ci"
  | Utf8mb4_danish_ci -> "Utf8mb4_danish_ci"
  | Utf8mb4_esperanto_ci -> "Utf8mb4_esperanto_ci"
  | Utf8mb4_estonian_ci -> "Utf8mb4_estonian_ci"
  | Utf8mb4_general_ci -> "Utf8mb4_general_ci"
  | Utf8mb4_general_nopad_ci -> "Utf8mb4_general_nopad_ci"
  | Utf8mb4_german2_ci -> "Utf8mb4_german2_ci"
  | Utf8mb4_hungarian_ci -> "Utf8mb4_hungarian_ci"
  | Utf8mb4_icelandic_ci -> "Utf8mb4_icelandic_ci"
  | Utf8mb4_latvian_ci -> "Utf8mb4_latvian_ci"
  | Utf8mb4_lithuanian_ci -> "Utf8mb4_lithuanian_ci"
  | Utf8mb4_myanmar_ci -> "Utf8mb4_myanmar_ci"
  | Utf8mb4_nopad_bin -> "Utf8mb4_nopad_bin"
  | Utf8mb4_persian_ci -> "Utf8mb4_persian_ci"
  | Utf8mb4_polish_ci -> "Utf8mb4_polish_ci"
  | Utf8mb4_romanian_ci -> "Utf8mb4_romanian_ci"
  | Utf8mb4_roman_ci -> "Utf8mb4_roman_ci"
  | Utf8mb4_sinhala_ci -> "Utf8mb4_sinhala_ci"
  | Utf8mb4_slovak_ci -> "Utf8mb4_slovak_ci"
  | Utf8mb4_slovenian_ci -> "Utf8mb4_slovenian_ci"
  | Utf8mb4_spanish2_ci -> "Utf8mb4_spanish2_ci"
  | Utf8mb4_spanish_ci -> "Utf8mb4_spanish_ci"
  | Utf8mb4_swedish_ci -> "Utf8mb4_swedish_ci"
  | Utf8mb4_thai_520_w2 -> "Utf8mb4_thai_520_w2"
  | Utf8mb4_turkish_ci -> "Utf8mb4_turkish_ci"
  | Utf8mb4_unicode_520_ci -> "Utf8mb4_unicode_520_ci"
  | Utf8mb4_unicode_520_nopad_ci -> "Utf8mb4_unicode_520_nopad_ci"
  | Utf8mb4_unicode_ci -> "Utf8mb4_unicode_ci"
  | Utf8mb4_unicode_nopad_ci -> "Utf8mb4_unicode_nopad_ci"
  | Utf8mb4_vietnamese_ci -> "Utf8mb4_vietnamese_ci"
  | Utf8_bin -> "Utf8_bin"
  | Utf8_croatian_ci -> "Utf8_croatian_ci"
  | Utf8_croatian_mysql561_ci -> "Utf8_croatian_mysql561_ci"
  | Utf8_czech_ci -> "Utf8_czech_ci"
  | Utf8_danish_ci -> "Utf8_danish_ci"
  | Utf8_esperanto_ci -> "Utf8_esperanto_ci"
  | Utf8_estonian_ci -> "Utf8_estonian_ci"
  | Utf8_general_ci -> "Utf8_general_ci"
  | Utf8_general_mysql500_ci -> "Utf8_general_mysql500_ci"
  | Utf8_general_nopad_ci -> "Utf8_general_nopad_ci"
  | Utf8_german2_ci -> "Utf8_german2_ci"
  | Utf8_hungarian_ci -> "Utf8_hungarian_ci"
  | Utf8_icelandic_ci -> "Utf8_icelandic_ci"
  | Utf8_latvian_ci -> "Utf8_latvian_ci"
  | Utf8_lithuanian_ci -> "Utf8_lithuanian_ci"
  | Utf8_myanmar_ci -> "Utf8_myanmar_ci"
  | Utf8_nopad_bin -> "Utf8_nopad_bin"
  | Utf8_persian_ci -> "Utf8_persian_ci"
  | Utf8_polish_ci -> "Utf8_polish_ci"
  | Utf8_romanian_ci -> "Utf8_romanian_ci"
  | Utf8_roman_ci -> "Utf8_roman_ci"
  | Utf8_sinhala_ci -> "Utf8_sinhala_ci"
  | Utf8_slovak_ci -> "Utf8_slovak_ci"
  | Utf8_slovenian_ci -> "Utf8_slovenian_ci"
  | Utf8_spanish2_ci -> "Utf8_spanish2_ci"
  | Utf8_spanish_ci -> "Utf8_spanish_ci"
  | Utf8_swedish_ci -> "Utf8_swedish_ci"
  | Utf8_thai_520_w2 -> "Utf8_thai_520_w2"
  | Utf8_turkish_ci -> "Utf8_turkish_ci"
  | Utf8_unicode_520_ci -> "Utf8_unicode_520_ci"
  | Utf8_unicode_520_nopad_ci -> "Utf8_unicode_520_nopad_ci"
  | Utf8_unicode_ci -> "Utf8_unicode_ci"
  | Utf8_unicode_nopad_ci -> "Utf8_unicode_nopad_ci"
  | Utf8_vietnamese_ci -> "Utf8_vietnamese_ci"

let charset_to_string (charset, collation) =
  "(" ^ (charset_name_to_string charset) ^ ", " ^ (collation_name_to_string collation) ^ ")"

let charset_number (charset, collation) =
  match (charset, collation) with
  | (Big5, Big5_chinese_ci) -> 1
  | (Latin2, Latin2_czech_cs) -> 2
  | (Dec8, Dec8_swedish_ci) -> 3
  | (Cp850, Cp850_general_ci) -> 4
  | (Latin1, Latin1_german1_ci) -> 5
  | (Hp8, Hp8_english_ci) -> 6
  | (Koi8r, Koi8r_general_ci) -> 7
  | (Latin1, Latin1_swedish_ci) -> 8
  | (Latin2, Latin2_general_ci) -> 9
  | (Swe7, Swe7_swedish_ci) -> 10
  | (Ascii, Ascii_general_ci) -> 11
  | (Ujis, Ujis_japanese_ci) -> 12
  | (Sjis, Sjis_japanese_ci) -> 13
  | (Cp1251, Cp1251_bulgarian_ci) -> 14
  | (Latin1, Latin1_danish_ci) -> 15
  | (Hebrew, Hebrew_general_ci) -> 16
  | (Tis620, Tis620_thai_ci) -> 18
  | (Euckr, Euckr_korean_ci) -> 19
  | (Latin7, Latin7_estonian_cs) -> 20
  | (Latin2, Latin2_hungarian_ci) -> 21
  | (Koi8u, Koi8u_general_ci) -> 22
  | (Cp1251, Cp1251_ukrainian_ci) -> 23
  | (Gb2312, Gb2312_chinese_ci) -> 24
  | (Greek, Greek_general_ci) -> 25
  | (Cp1250, Cp1250_general_ci) -> 26
  | (Latin2, Latin2_croatian_ci) -> 27
  | (Gbk, Gbk_chinese_ci) -> 28
  | (Cp1257, Cp1257_lithuanian_ci) -> 29
  | (Latin5, Latin5_turkish_ci) -> 30
  | (Latin1, Latin1_german2_ci) -> 31
  | (Armscii8, Armscii8_general_ci) -> 32
  | (Utf8, Utf8_general_ci) -> 33
  | (Cp1250, Cp1250_czech_cs) -> 34
  | (Ucs2, Ucs2_general_ci) -> 35
  | (Cp866, Cp866_general_ci) -> 36
  | (Keybcs2, Keybcs2_general_ci) -> 37
  | (Macce, Macce_general_ci) -> 38
  | (Macroman, Macroman_general_ci) -> 39
  | (Cp852, Cp852_general_ci) -> 40
  | (Latin7, Latin7_general_ci) -> 41
  | (Latin7, Latin7_general_cs) -> 42
  | (Macce, Macce_bin) -> 43
  | (Cp1250, Cp1250_croatian_ci) -> 44
  | (Utf8mb4, Utf8mb4_general_ci) -> 45
  | (Utf8mb4, Utf8mb4_bin) -> 46
  | (Latin1, Latin1_bin) -> 47
  | (Latin1, Latin1_general_ci) -> 48
  | (Latin1, Latin1_general_cs) -> 49
  | (Cp1251, Cp1251_bin) -> 50
  | (Cp1251, Cp1251_general_ci) -> 51
  | (Cp1251, Cp1251_general_cs) -> 52
  | (Macroman, Macroman_bin) -> 53
  | (Utf16, Utf16_general_ci) -> 54
  | (Utf16, Utf16_bin) -> 55
  | (Utf16le, Utf16le_general_ci) -> 56
  | (Cp1256, Cp1256_general_ci) -> 57
  | (Cp1257, Cp1257_bin) -> 58
  | (Cp1257, Cp1257_general_ci) -> 59
  | (Utf32, Utf32_general_ci) -> 60
  | (Utf32, Utf32_bin) -> 61
  | (Utf16le, Utf16le_bin) -> 62
  | (Binary_charset, Binary_collation) -> 63
  | (Armscii8, Armscii8_bin) -> 64
  | (Ascii, Ascii_bin) -> 65
  | (Cp1250, Cp1250_bin) -> 66
  | (Cp1256, Cp1256_bin) -> 67
  | (Cp866, Cp866_bin) -> 68
  | (Dec8, Dec8_bin) -> 69
  | (Greek, Greek_bin) -> 70
  | (Hebrew, Hebrew_bin) -> 71
  | (Hp8, Hp8_bin) -> 72
  | (Keybcs2, Keybcs2_bin) -> 73
  | (Koi8r, Koi8r_bin) -> 74
  | (Koi8u, Koi8u_bin) -> 75
  | (Latin2, Latin2_bin) -> 77
  | (Latin5, Latin5_bin) -> 78
  | (Latin7, Latin7_bin) -> 79
  | (Cp850, Cp850_bin) -> 80
  | (Cp852, Cp852_bin) -> 81
  | (Swe7, Swe7_bin) -> 82
  | (Utf8, Utf8_bin) -> 83
  | (Big5, Big5_bin) -> 84
  | (Euckr, Euckr_bin) -> 85
  | (Gb2312, Gb2312_bin) -> 86
  | (Gbk, Gbk_bin) -> 87
  | (Sjis, Sjis_bin) -> 88
  | (Tis620, Tis620_bin) -> 89
  | (Ucs2, Ucs2_bin) -> 90
  | (Ujis, Ujis_bin) -> 91
  | (Geostd8, Geostd8_general_ci) -> 92
  | (Geostd8, Geostd8_bin) -> 93
  | (Latin1, Latin1_spanish_ci) -> 94
  | (Cp932, Cp932_japanese_ci) -> 95
  | (Cp932, Cp932_bin) -> 96
  | (Eucjpms, Eucjpms_japanese_ci) -> 97
  | (Eucjpms, Eucjpms_bin) -> 98
  | (Cp1250, Cp1250_polish_ci) -> 99
  | (Utf16, Utf16_unicode_ci) -> 101
  | (Utf16, Utf16_icelandic_ci) -> 102
  | (Utf16, Utf16_latvian_ci) -> 103
  | (Utf16, Utf16_romanian_ci) -> 104
  | (Utf16, Utf16_slovenian_ci) -> 105
  | (Utf16, Utf16_polish_ci) -> 106
  | (Utf16, Utf16_estonian_ci) -> 107
  | (Utf16, Utf16_spanish_ci) -> 108
  | (Utf16, Utf16_swedish_ci) -> 109
  | (Utf16, Utf16_turkish_ci) -> 110
  | (Utf16, Utf16_czech_ci) -> 111
  | (Utf16, Utf16_danish_ci) -> 112
  | (Utf16, Utf16_lithuanian_ci) -> 113
  | (Utf16, Utf16_slovak_ci) -> 114
  | (Utf16, Utf16_spanish2_ci) -> 115
  | (Utf16, Utf16_roman_ci) -> 116
  | (Utf16, Utf16_persian_ci) -> 117
  | (Utf16, Utf16_esperanto_ci) -> 118
  | (Utf16, Utf16_hungarian_ci) -> 119
  | (Utf16, Utf16_sinhala_ci) -> 120
  | (Utf16, Utf16_german2_ci) -> 121
  | (Utf16, Utf16_croatian_mysql561_ci) -> 122
  | (Utf16, Utf16_unicode_520_ci) -> 123
  | (Utf16, Utf16_vietnamese_ci) -> 124
  | (Ucs2, Ucs2_unicode_ci) -> 128
  | (Ucs2, Ucs2_icelandic_ci) -> 129
  | (Ucs2, Ucs2_latvian_ci) -> 130
  | (Ucs2, Ucs2_romanian_ci) -> 131
  | (Ucs2, Ucs2_slovenian_ci) -> 132
  | (Ucs2, Ucs2_polish_ci) -> 133
  | (Ucs2, Ucs2_estonian_ci) -> 134
  | (Ucs2, Ucs2_spanish_ci) -> 135
  | (Ucs2, Ucs2_swedish_ci) -> 136
  | (Ucs2, Ucs2_turkish_ci) -> 137
  | (Ucs2, Ucs2_czech_ci) -> 138
  | (Ucs2, Ucs2_danish_ci) -> 139
  | (Ucs2, Ucs2_lithuanian_ci) -> 140
  | (Ucs2, Ucs2_slovak_ci) -> 141
  | (Ucs2, Ucs2_spanish2_ci) -> 142
  | (Ucs2, Ucs2_roman_ci) -> 143
  | (Ucs2, Ucs2_persian_ci) -> 144
  | (Ucs2, Ucs2_esperanto_ci) -> 145
  | (Ucs2, Ucs2_hungarian_ci) -> 146
  | (Ucs2, Ucs2_sinhala_ci) -> 147
  | (Ucs2, Ucs2_german2_ci) -> 148
  | (Ucs2, Ucs2_croatian_mysql561_ci) -> 149
  | (Ucs2, Ucs2_unicode_520_ci) -> 150
  | (Ucs2, Ucs2_vietnamese_ci) -> 151
  | (Ucs2, Ucs2_general_mysql500_ci) -> 159
  | (Utf32, Utf32_unicode_ci) -> 160
  | (Utf32, Utf32_icelandic_ci) -> 161
  | (Utf32, Utf32_latvian_ci) -> 162
  | (Utf32, Utf32_romanian_ci) -> 163
  | (Utf32, Utf32_slovenian_ci) -> 164
  | (Utf32, Utf32_polish_ci) -> 165
  | (Utf32, Utf32_estonian_ci) -> 166
  | (Utf32, Utf32_spanish_ci) -> 167
  | (Utf32, Utf32_swedish_ci) -> 168
  | (Utf32, Utf32_turkish_ci) -> 169
  | (Utf32, Utf32_czech_ci) -> 170
  | (Utf32, Utf32_danish_ci) -> 171
  | (Utf32, Utf32_lithuanian_ci) -> 172
  | (Utf32, Utf32_slovak_ci) -> 173
  | (Utf32, Utf32_spanish2_ci) -> 174
  | (Utf32, Utf32_roman_ci) -> 175
  | (Utf32, Utf32_persian_ci) -> 176
  | (Utf32, Utf32_esperanto_ci) -> 177
  | (Utf32, Utf32_hungarian_ci) -> 178
  | (Utf32, Utf32_sinhala_ci) -> 179
  | (Utf32, Utf32_german2_ci) -> 180
  | (Utf32, Utf32_croatian_mysql561_ci) -> 181
  | (Utf32, Utf32_unicode_520_ci) -> 182
  | (Utf32, Utf32_vietnamese_ci) -> 183
  | (Utf8, Utf8_unicode_ci) -> 192
  | (Utf8, Utf8_icelandic_ci) -> 193
  | (Utf8, Utf8_latvian_ci) -> 194
  | (Utf8, Utf8_romanian_ci) -> 195
  | (Utf8, Utf8_slovenian_ci) -> 196
  | (Utf8, Utf8_polish_ci) -> 197
  | (Utf8, Utf8_estonian_ci) -> 198
  | (Utf8, Utf8_spanish_ci) -> 199
  | (Utf8, Utf8_swedish_ci) -> 200
  | (Utf8, Utf8_turkish_ci) -> 201
  | (Utf8, Utf8_czech_ci) -> 202
  | (Utf8, Utf8_danish_ci) -> 203
  | (Utf8, Utf8_lithuanian_ci) -> 204
  | (Utf8, Utf8_slovak_ci) -> 205
  | (Utf8, Utf8_spanish2_ci) -> 206
  | (Utf8, Utf8_roman_ci) -> 207
  | (Utf8, Utf8_persian_ci) -> 208
  | (Utf8, Utf8_esperanto_ci) -> 209
  | (Utf8, Utf8_hungarian_ci) -> 210
  | (Utf8, Utf8_sinhala_ci) -> 211
  | (Utf8, Utf8_german2_ci) -> 212
  | (Utf8, Utf8_croatian_mysql561_ci) -> 213
  | (Utf8, Utf8_unicode_520_ci) -> 214
  | (Utf8, Utf8_vietnamese_ci) -> 215
  | (Utf8, Utf8_general_mysql500_ci) -> 223
  | (Utf8mb4, Utf8mb4_unicode_ci) -> 224
  | (Utf8mb4, Utf8mb4_icelandic_ci) -> 225
  | (Utf8mb4, Utf8mb4_latvian_ci) -> 226
  | (Utf8mb4, Utf8mb4_romanian_ci) -> 227
  | (Utf8mb4, Utf8mb4_slovenian_ci) -> 228
  | (Utf8mb4, Utf8mb4_polish_ci) -> 229
  | (Utf8mb4, Utf8mb4_estonian_ci) -> 230
  | (Utf8mb4, Utf8mb4_spanish_ci) -> 231
  | (Utf8mb4, Utf8mb4_swedish_ci) -> 232
  | (Utf8mb4, Utf8mb4_turkish_ci) -> 233
  | (Utf8mb4, Utf8mb4_czech_ci) -> 234
  | (Utf8mb4, Utf8mb4_danish_ci) -> 235
  | (Utf8mb4, Utf8mb4_lithuanian_ci) -> 236
  | (Utf8mb4, Utf8mb4_slovak_ci) -> 237
  | (Utf8mb4, Utf8mb4_spanish2_ci) -> 238
  | (Utf8mb4, Utf8mb4_roman_ci) -> 239
  | (Utf8mb4, Utf8mb4_persian_ci) -> 240
  | (Utf8mb4, Utf8mb4_esperanto_ci) -> 241
  | (Utf8mb4, Utf8mb4_hungarian_ci) -> 242
  | (Utf8mb4, Utf8mb4_sinhala_ci) -> 243
  | (Utf8mb4, Utf8mb4_german2_ci) -> 244
  | (Utf8mb4, Utf8mb4_croatian_mysql561_ci) -> 245
  | (Utf8mb4, Utf8mb4_unicode_520_ci) -> 246
  | (Utf8mb4, Utf8mb4_vietnamese_ci) -> 247
  | (Utf8, Utf8_croatian_ci) -> 576
  | (Utf8, Utf8_myanmar_ci) -> 577
  | (Utf8, Utf8_thai_520_w2) -> 578
  | (Utf8mb4, Utf8mb4_croatian_ci) -> 608
  | (Utf8mb4, Utf8mb4_myanmar_ci) -> 609
  | (Utf8mb4, Utf8mb4_thai_520_w2) -> 610
  | (Ucs2, Ucs2_croatian_ci) -> 640
  | (Ucs2, Ucs2_myanmar_ci) -> 641
  | (Ucs2, Ucs2_thai_520_w2) -> 642
  | (Utf16, Utf16_croatian_ci) -> 672
  | (Utf16, Utf16_myanmar_ci) -> 673
  | (Utf16, Utf16_thai_520_w2) -> 674
  | (Utf32, Utf32_croatian_ci) -> 736
  | (Utf32, Utf32_myanmar_ci) -> 737
  | (Utf32, Utf32_thai_520_w2) -> 738
  | (Big5, Big5_chinese_nopad_ci) -> 1025
  | (Dec8, Dec8_swedish_nopad_ci) -> 1027
  | (Cp850, Cp850_general_nopad_ci) -> 1028
  | (Hp8, Hp8_english_nopad_ci) -> 1030
  | (Koi8r, Koi8r_general_nopad_ci) -> 1031
  | (Latin1, Latin1_swedish_nopad_ci) -> 1032
  | (Latin2, Latin2_general_nopad_ci) -> 1033
  | (Swe7, Swe7_swedish_nopad_ci) -> 1034
  | (Ascii, Ascii_general_nopad_ci) -> 1035
  | (Ujis, Ujis_japanese_nopad_ci) -> 1036
  | (Sjis, Sjis_japanese_nopad_ci) -> 1037
  | (Hebrew, Hebrew_general_nopad_ci) -> 1040
  | (Tis620, Tis620_thai_nopad_ci) -> 1042
  | (Euckr, Euckr_korean_nopad_ci) -> 1043
  | (Koi8u, Koi8u_general_nopad_ci) -> 1046
  | (Gb2312, Gb2312_chinese_nopad_ci) -> 1048
  | (Greek, Greek_general_nopad_ci) -> 1049
  | (Cp1250, Cp1250_general_nopad_ci) -> 1050
  | (Gbk, Gbk_chinese_nopad_ci) -> 1052
  | (Latin5, Latin5_turkish_nopad_ci) -> 1054
  | (Armscii8, Armscii8_general_nopad_ci) -> 1056
  | (Utf8, Utf8_general_nopad_ci) -> 1057
  | (Ucs2, Ucs2_general_nopad_ci) -> 1059
  | (Cp866, Cp866_general_nopad_ci) -> 1060
  | (Keybcs2, Keybcs2_general_nopad_ci) -> 1061
  | (Macce, Macce_general_nopad_ci) -> 1062
  | (Macroman, Macroman_general_nopad_ci) -> 1063
  | (Cp852, Cp852_general_nopad_ci) -> 1064
  | (Latin7, Latin7_general_nopad_ci) -> 1065
  | (Macce, Macce_nopad_bin) -> 1067
  | (Utf8mb4, Utf8mb4_general_nopad_ci) -> 1069
  | (Utf8mb4, Utf8mb4_nopad_bin) -> 1070
  | (Latin1, Latin1_nopad_bin) -> 1071
  | (Cp1251, Cp1251_nopad_bin) -> 1074
  | (Cp1251, Cp1251_general_nopad_ci) -> 1075
  | (Macroman, Macroman_nopad_bin) -> 1077
  | (Utf16, Utf16_general_nopad_ci) -> 1078
  | (Utf16, Utf16_nopad_bin) -> 1079
  | (Utf16le, Utf16le_general_nopad_ci) -> 1080
  | (Cp1256, Cp1256_general_nopad_ci) -> 1081
  | (Cp1257, Cp1257_nopad_bin) -> 1082
  | (Cp1257, Cp1257_general_nopad_ci) -> 1083
  | (Utf32, Utf32_general_nopad_ci) -> 1084
  | (Utf32, Utf32_nopad_bin) -> 1085
  | (Utf16le, Utf16le_nopad_bin) -> 1086
  | (Armscii8, Armscii8_nopad_bin) -> 1088
  | (Ascii, Ascii_nopad_bin) -> 1089
  | (Cp1250, Cp1250_nopad_bin) -> 1090
  | (Cp1256, Cp1256_nopad_bin) -> 1091
  | (Cp866, Cp866_nopad_bin) -> 1092
  | (Dec8, Dec8_nopad_bin) -> 1093
  | (Greek, Greek_nopad_bin) -> 1094
  | (Hebrew, Hebrew_nopad_bin) -> 1095
  | (Hp8, Hp8_nopad_bin) -> 1096
  | (Keybcs2, Keybcs2_nopad_bin) -> 1097
  | (Koi8r, Koi8r_nopad_bin) -> 1098
  | (Koi8u, Koi8u_nopad_bin) -> 1099
  | (Latin2, Latin2_nopad_bin) -> 1101
  | (Latin5, Latin5_nopad_bin) -> 1102
  | (Latin7, Latin7_nopad_bin) -> 1103
  | (Cp850, Cp850_nopad_bin) -> 1104
  | (Cp852, Cp852_nopad_bin) -> 1105
  | (Swe7, Swe7_nopad_bin) -> 1106
  | (Utf8, Utf8_nopad_bin) -> 1107
  | (Big5, Big5_nopad_bin) -> 1108
  | (Euckr, Euckr_nopad_bin) -> 1109
  | (Gb2312, Gb2312_nopad_bin) -> 1110
  | (Gbk, Gbk_nopad_bin) -> 1111
  | (Sjis, Sjis_nopad_bin) -> 1112
  | (Tis620, Tis620_nopad_bin) -> 1113
  | (Ucs2, Ucs2_nopad_bin) -> 1114
  | (Ujis, Ujis_nopad_bin) -> 1115
  | (Geostd8, Geostd8_general_nopad_ci) -> 1116
  | (Geostd8, Geostd8_nopad_bin) -> 1117
  | (Cp932, Cp932_japanese_nopad_ci) -> 1119
  | (Cp932, Cp932_nopad_bin) -> 1120
  | (Eucjpms, Eucjpms_japanese_nopad_ci) -> 1121
  | (Eucjpms, Eucjpms_nopad_bin) -> 1122
  | (Utf16, Utf16_unicode_nopad_ci) -> 1125
  | (Utf16, Utf16_unicode_520_nopad_ci) -> 1147
  | (Ucs2, Ucs2_unicode_nopad_ci) -> 1152
  | (Ucs2, Ucs2_unicode_520_nopad_ci) -> 1174
  | (Utf32, Utf32_unicode_nopad_ci) -> 1184
  | (Utf32, Utf32_unicode_520_nopad_ci) -> 1206
  | (Utf8, Utf8_unicode_nopad_ci) -> 1216
  | (Utf8, Utf8_unicode_520_nopad_ci) -> 1238
  | (Utf8mb4, Utf8mb4_unicode_nopad_ci) -> 1248
  | (Utf8mb4, Utf8mb4_unicode_520_nopad_ci) -> 1270
  | (_, _) -> failwith "Unknown (charset, collation) tuple"

let number_charset n =
  match n with
  | 1 -> (Big5, Big5_chinese_ci)
  | 2 -> (Latin2, Latin2_czech_cs)
  | 3 -> (Dec8, Dec8_swedish_ci)
  | 4 -> (Cp850, Cp850_general_ci)
  | 5 -> (Latin1, Latin1_german1_ci)
  | 6 -> (Hp8, Hp8_english_ci)
  | 7 -> (Koi8r, Koi8r_general_ci)
  | 8 -> (Latin1, Latin1_swedish_ci)
  | 9 -> (Latin2, Latin2_general_ci)
  | 10 -> (Swe7, Swe7_swedish_ci)
  | 11 -> (Ascii, Ascii_general_ci)
  | 12 -> (Ujis, Ujis_japanese_ci)
  | 13 -> (Sjis, Sjis_japanese_ci)
  | 14 -> (Cp1251, Cp1251_bulgarian_ci)
  | 15 -> (Latin1, Latin1_danish_ci)
  | 16 -> (Hebrew, Hebrew_general_ci)
  | 18 -> (Tis620, Tis620_thai_ci)
  | 19 -> (Euckr, Euckr_korean_ci)
  | 20 -> (Latin7, Latin7_estonian_cs)
  | 21 -> (Latin2, Latin2_hungarian_ci)
  | 22 -> (Koi8u, Koi8u_general_ci)
  | 23 -> (Cp1251, Cp1251_ukrainian_ci)
  | 24 -> (Gb2312, Gb2312_chinese_ci)
  | 25 -> (Greek, Greek_general_ci)
  | 26 -> (Cp1250, Cp1250_general_ci)
  | 27 -> (Latin2, Latin2_croatian_ci)
  | 28 -> (Gbk, Gbk_chinese_ci)
  | 29 -> (Cp1257, Cp1257_lithuanian_ci)
  | 30 -> (Latin5, Latin5_turkish_ci)
  | 31 -> (Latin1, Latin1_german2_ci)
  | 32 -> (Armscii8, Armscii8_general_ci)
  | 33 -> (Utf8, Utf8_general_ci)
  | 34 -> (Cp1250, Cp1250_czech_cs)
  | 35 -> (Ucs2, Ucs2_general_ci)
  | 36 -> (Cp866, Cp866_general_ci)
  | 37 -> (Keybcs2, Keybcs2_general_ci)
  | 38 -> (Macce, Macce_general_ci)
  | 39 -> (Macroman, Macroman_general_ci)
  | 40 -> (Cp852, Cp852_general_ci)
  | 41 -> (Latin7, Latin7_general_ci)
  | 42 -> (Latin7, Latin7_general_cs)
  | 43 -> (Macce, Macce_bin)
  | 44 -> (Cp1250, Cp1250_croatian_ci)
  | 45 -> (Utf8mb4, Utf8mb4_general_ci)
  | 46 -> (Utf8mb4, Utf8mb4_bin)
  | 47 -> (Latin1, Latin1_bin)
  | 48 -> (Latin1, Latin1_general_ci)
  | 49 -> (Latin1, Latin1_general_cs)
  | 50 -> (Cp1251, Cp1251_bin)
  | 51 -> (Cp1251, Cp1251_general_ci)
  | 52 -> (Cp1251, Cp1251_general_cs)
  | 53 -> (Macroman, Macroman_bin)
  | 54 -> (Utf16, Utf16_general_ci)
  | 55 -> (Utf16, Utf16_bin)
  | 56 -> (Utf16le, Utf16le_general_ci)
  | 57 -> (Cp1256, Cp1256_general_ci)
  | 58 -> (Cp1257, Cp1257_bin)
  | 59 -> (Cp1257, Cp1257_general_ci)
  | 60 -> (Utf32, Utf32_general_ci)
  | 61 -> (Utf32, Utf32_bin)
  | 62 -> (Utf16le, Utf16le_bin)
  | 63 -> (Binary_charset, Binary_collation)
  | 64 -> (Armscii8, Armscii8_bin)
  | 65 -> (Ascii, Ascii_bin)
  | 66 -> (Cp1250, Cp1250_bin)
  | 67 -> (Cp1256, Cp1256_bin)
  | 68 -> (Cp866, Cp866_bin)
  | 69 -> (Dec8, Dec8_bin)
  | 70 -> (Greek, Greek_bin)
  | 71 -> (Hebrew, Hebrew_bin)
  | 72 -> (Hp8, Hp8_bin)
  | 73 -> (Keybcs2, Keybcs2_bin)
  | 74 -> (Koi8r, Koi8r_bin)
  | 75 -> (Koi8u, Koi8u_bin)
  | 77 -> (Latin2, Latin2_bin)
  | 78 -> (Latin5, Latin5_bin)
  | 79 -> (Latin7, Latin7_bin)
  | 80 -> (Cp850, Cp850_bin)
  | 81 -> (Cp852, Cp852_bin)
  | 82 -> (Swe7, Swe7_bin)
  | 83 -> (Utf8, Utf8_bin)
  | 84 -> (Big5, Big5_bin)
  | 85 -> (Euckr, Euckr_bin)
  | 86 -> (Gb2312, Gb2312_bin)
  | 87 -> (Gbk, Gbk_bin)
  | 88 -> (Sjis, Sjis_bin)
  | 89 -> (Tis620, Tis620_bin)
  | 90 -> (Ucs2, Ucs2_bin)
  | 91 -> (Ujis, Ujis_bin)
  | 92 -> (Geostd8, Geostd8_general_ci)
  | 93 -> (Geostd8, Geostd8_bin)
  | 94 -> (Latin1, Latin1_spanish_ci)
  | 95 -> (Cp932, Cp932_japanese_ci)
  | 96 -> (Cp932, Cp932_bin)
  | 97 -> (Eucjpms, Eucjpms_japanese_ci)
  | 98 -> (Eucjpms, Eucjpms_bin)
  | 99 -> (Cp1250, Cp1250_polish_ci)
  | 101 -> (Utf16, Utf16_unicode_ci)
  | 102 -> (Utf16, Utf16_icelandic_ci)
  | 103 -> (Utf16, Utf16_latvian_ci)
  | 104 -> (Utf16, Utf16_romanian_ci)
  | 105 -> (Utf16, Utf16_slovenian_ci)
  | 106 -> (Utf16, Utf16_polish_ci)
  | 107 -> (Utf16, Utf16_estonian_ci)
  | 108 -> (Utf16, Utf16_spanish_ci)
  | 109 -> (Utf16, Utf16_swedish_ci)
  | 110 -> (Utf16, Utf16_turkish_ci)
  | 111 -> (Utf16, Utf16_czech_ci)
  | 112 -> (Utf16, Utf16_danish_ci)
  | 113 -> (Utf16, Utf16_lithuanian_ci)
  | 114 -> (Utf16, Utf16_slovak_ci)
  | 115 -> (Utf16, Utf16_spanish2_ci)
  | 116 -> (Utf16, Utf16_roman_ci)
  | 117 -> (Utf16, Utf16_persian_ci)
  | 118 -> (Utf16, Utf16_esperanto_ci)
  | 119 -> (Utf16, Utf16_hungarian_ci)
  | 120 -> (Utf16, Utf16_sinhala_ci)
  | 121 -> (Utf16, Utf16_german2_ci)
  | 122 -> (Utf16, Utf16_croatian_mysql561_ci)
  | 123 -> (Utf16, Utf16_unicode_520_ci)
  | 124 -> (Utf16, Utf16_vietnamese_ci)
  | 128 -> (Ucs2, Ucs2_unicode_ci)
  | 129 -> (Ucs2, Ucs2_icelandic_ci)
  | 130 -> (Ucs2, Ucs2_latvian_ci)
  | 131 -> (Ucs2, Ucs2_romanian_ci)
  | 132 -> (Ucs2, Ucs2_slovenian_ci)
  | 133 -> (Ucs2, Ucs2_polish_ci)
  | 134 -> (Ucs2, Ucs2_estonian_ci)
  | 135 -> (Ucs2, Ucs2_spanish_ci)
  | 136 -> (Ucs2, Ucs2_swedish_ci)
  | 137 -> (Ucs2, Ucs2_turkish_ci)
  | 138 -> (Ucs2, Ucs2_czech_ci)
  | 139 -> (Ucs2, Ucs2_danish_ci)
  | 140 -> (Ucs2, Ucs2_lithuanian_ci)
  | 141 -> (Ucs2, Ucs2_slovak_ci)
  | 142 -> (Ucs2, Ucs2_spanish2_ci)
  | 143 -> (Ucs2, Ucs2_roman_ci)
  | 144 -> (Ucs2, Ucs2_persian_ci)
  | 145 -> (Ucs2, Ucs2_esperanto_ci)
  | 146 -> (Ucs2, Ucs2_hungarian_ci)
  | 147 -> (Ucs2, Ucs2_sinhala_ci)
  | 148 -> (Ucs2, Ucs2_german2_ci)
  | 149 -> (Ucs2, Ucs2_croatian_mysql561_ci)
  | 150 -> (Ucs2, Ucs2_unicode_520_ci)
  | 151 -> (Ucs2, Ucs2_vietnamese_ci)
  | 159 -> (Ucs2, Ucs2_general_mysql500_ci)
  | 160 -> (Utf32, Utf32_unicode_ci)
  | 161 -> (Utf32, Utf32_icelandic_ci)
  | 162 -> (Utf32, Utf32_latvian_ci)
  | 163 -> (Utf32, Utf32_romanian_ci)
  | 164 -> (Utf32, Utf32_slovenian_ci)
  | 165 -> (Utf32, Utf32_polish_ci)
  | 166 -> (Utf32, Utf32_estonian_ci)
  | 167 -> (Utf32, Utf32_spanish_ci)
  | 168 -> (Utf32, Utf32_swedish_ci)
  | 169 -> (Utf32, Utf32_turkish_ci)
  | 170 -> (Utf32, Utf32_czech_ci)
  | 171 -> (Utf32, Utf32_danish_ci)
  | 172 -> (Utf32, Utf32_lithuanian_ci)
  | 173 -> (Utf32, Utf32_slovak_ci)
  | 174 -> (Utf32, Utf32_spanish2_ci)
  | 175 -> (Utf32, Utf32_roman_ci)
  | 176 -> (Utf32, Utf32_persian_ci)
  | 177 -> (Utf32, Utf32_esperanto_ci)
  | 178 -> (Utf32, Utf32_hungarian_ci)
  | 179 -> (Utf32, Utf32_sinhala_ci)
  | 180 -> (Utf32, Utf32_german2_ci)
  | 181 -> (Utf32, Utf32_croatian_mysql561_ci)
  | 182 -> (Utf32, Utf32_unicode_520_ci)
  | 183 -> (Utf32, Utf32_vietnamese_ci)
  | 192 -> (Utf8, Utf8_unicode_ci)
  | 193 -> (Utf8, Utf8_icelandic_ci)
  | 194 -> (Utf8, Utf8_latvian_ci)
  | 195 -> (Utf8, Utf8_romanian_ci)
  | 196 -> (Utf8, Utf8_slovenian_ci)
  | 197 -> (Utf8, Utf8_polish_ci)
  | 198 -> (Utf8, Utf8_estonian_ci)
  | 199 -> (Utf8, Utf8_spanish_ci)
  | 200 -> (Utf8, Utf8_swedish_ci)
  | 201 -> (Utf8, Utf8_turkish_ci)
  | 202 -> (Utf8, Utf8_czech_ci)
  | 203 -> (Utf8, Utf8_danish_ci)
  | 204 -> (Utf8, Utf8_lithuanian_ci)
  | 205 -> (Utf8, Utf8_slovak_ci)
  | 206 -> (Utf8, Utf8_spanish2_ci)
  | 207 -> (Utf8, Utf8_roman_ci)
  | 208 -> (Utf8, Utf8_persian_ci)
  | 209 -> (Utf8, Utf8_esperanto_ci)
  | 210 -> (Utf8, Utf8_hungarian_ci)
  | 211 -> (Utf8, Utf8_sinhala_ci)
  | 212 -> (Utf8, Utf8_german2_ci)
  | 213 -> (Utf8, Utf8_croatian_mysql561_ci)
  | 214 -> (Utf8, Utf8_unicode_520_ci)
  | 215 -> (Utf8, Utf8_vietnamese_ci)
  | 223 -> (Utf8, Utf8_general_mysql500_ci)
  | 224 -> (Utf8mb4, Utf8mb4_unicode_ci)
  | 225 -> (Utf8mb4, Utf8mb4_icelandic_ci)
  | 226 -> (Utf8mb4, Utf8mb4_latvian_ci)
  | 227 -> (Utf8mb4, Utf8mb4_romanian_ci)
  | 228 -> (Utf8mb4, Utf8mb4_slovenian_ci)
  | 229 -> (Utf8mb4, Utf8mb4_polish_ci)
  | 230 -> (Utf8mb4, Utf8mb4_estonian_ci)
  | 231 -> (Utf8mb4, Utf8mb4_spanish_ci)
  | 232 -> (Utf8mb4, Utf8mb4_swedish_ci)
  | 233 -> (Utf8mb4, Utf8mb4_turkish_ci)
  | 234 -> (Utf8mb4, Utf8mb4_czech_ci)
  | 235 -> (Utf8mb4, Utf8mb4_danish_ci)
  | 236 -> (Utf8mb4, Utf8mb4_lithuanian_ci)
  | 237 -> (Utf8mb4, Utf8mb4_slovak_ci)
  | 238 -> (Utf8mb4, Utf8mb4_spanish2_ci)
  | 239 -> (Utf8mb4, Utf8mb4_roman_ci)
  | 240 -> (Utf8mb4, Utf8mb4_persian_ci)
  | 241 -> (Utf8mb4, Utf8mb4_esperanto_ci)
  | 242 -> (Utf8mb4, Utf8mb4_hungarian_ci)
  | 243 -> (Utf8mb4, Utf8mb4_sinhala_ci)
  | 244 -> (Utf8mb4, Utf8mb4_german2_ci)
  | 245 -> (Utf8mb4, Utf8mb4_croatian_mysql561_ci)
  | 246 -> (Utf8mb4, Utf8mb4_unicode_520_ci)
  | 247 -> (Utf8mb4, Utf8mb4_vietnamese_ci)
  | 576 -> (Utf8, Utf8_croatian_ci)
  | 577 -> (Utf8, Utf8_myanmar_ci)
  | 578 -> (Utf8, Utf8_thai_520_w2)
  | 608 -> (Utf8mb4, Utf8mb4_croatian_ci)
  | 609 -> (Utf8mb4, Utf8mb4_myanmar_ci)
  | 610 -> (Utf8mb4, Utf8mb4_thai_520_w2)
  | 640 -> (Ucs2, Ucs2_croatian_ci)
  | 641 -> (Ucs2, Ucs2_myanmar_ci)
  | 642 -> (Ucs2, Ucs2_thai_520_w2)
  | 672 -> (Utf16, Utf16_croatian_ci)
  | 673 -> (Utf16, Utf16_myanmar_ci)
  | 674 -> (Utf16, Utf16_thai_520_w2)
  | 736 -> (Utf32, Utf32_croatian_ci)
  | 737 -> (Utf32, Utf32_myanmar_ci)
  | 738 -> (Utf32, Utf32_thai_520_w2)
  | 1025 -> (Big5, Big5_chinese_nopad_ci)
  | 1027 -> (Dec8, Dec8_swedish_nopad_ci)
  | 1028 -> (Cp850, Cp850_general_nopad_ci)
  | 1030 -> (Hp8, Hp8_english_nopad_ci)
  | 1031 -> (Koi8r, Koi8r_general_nopad_ci)
  | 1032 -> (Latin1, Latin1_swedish_nopad_ci)
  | 1033 -> (Latin2, Latin2_general_nopad_ci)
  | 1034 -> (Swe7, Swe7_swedish_nopad_ci)
  | 1035 -> (Ascii, Ascii_general_nopad_ci)
  | 1036 -> (Ujis, Ujis_japanese_nopad_ci)
  | 1037 -> (Sjis, Sjis_japanese_nopad_ci)
  | 1040 -> (Hebrew, Hebrew_general_nopad_ci)
  | 1042 -> (Tis620, Tis620_thai_nopad_ci)
  | 1043 -> (Euckr, Euckr_korean_nopad_ci)
  | 1046 -> (Koi8u, Koi8u_general_nopad_ci)
  | 1048 -> (Gb2312, Gb2312_chinese_nopad_ci)
  | 1049 -> (Greek, Greek_general_nopad_ci)
  | 1050 -> (Cp1250, Cp1250_general_nopad_ci)
  | 1052 -> (Gbk, Gbk_chinese_nopad_ci)
  | 1054 -> (Latin5, Latin5_turkish_nopad_ci)
  | 1056 -> (Armscii8, Armscii8_general_nopad_ci)
  | 1057 -> (Utf8, Utf8_general_nopad_ci)
  | 1059 -> (Ucs2, Ucs2_general_nopad_ci)
  | 1060 -> (Cp866, Cp866_general_nopad_ci)
  | 1061 -> (Keybcs2, Keybcs2_general_nopad_ci)
  | 1062 -> (Macce, Macce_general_nopad_ci)
  | 1063 -> (Macroman, Macroman_general_nopad_ci)
  | 1064 -> (Cp852, Cp852_general_nopad_ci)
  | 1065 -> (Latin7, Latin7_general_nopad_ci)
  | 1067 -> (Macce, Macce_nopad_bin)
  | 1069 -> (Utf8mb4, Utf8mb4_general_nopad_ci)
  | 1070 -> (Utf8mb4, Utf8mb4_nopad_bin)
  | 1071 -> (Latin1, Latin1_nopad_bin)
  | 1074 -> (Cp1251, Cp1251_nopad_bin)
  | 1075 -> (Cp1251, Cp1251_general_nopad_ci)
  | 1077 -> (Macroman, Macroman_nopad_bin)
  | 1078 -> (Utf16, Utf16_general_nopad_ci)
  | 1079 -> (Utf16, Utf16_nopad_bin)
  | 1080 -> (Utf16le, Utf16le_general_nopad_ci)
  | 1081 -> (Cp1256, Cp1256_general_nopad_ci)
  | 1082 -> (Cp1257, Cp1257_nopad_bin)
  | 1083 -> (Cp1257, Cp1257_general_nopad_ci)
  | 1084 -> (Utf32, Utf32_general_nopad_ci)
  | 1085 -> (Utf32, Utf32_nopad_bin)
  | 1086 -> (Utf16le, Utf16le_nopad_bin)
  | 1088 -> (Armscii8, Armscii8_nopad_bin)
  | 1089 -> (Ascii, Ascii_nopad_bin)
  | 1090 -> (Cp1250, Cp1250_nopad_bin)
  | 1091 -> (Cp1256, Cp1256_nopad_bin)
  | 1092 -> (Cp866, Cp866_nopad_bin)
  | 1093 -> (Dec8, Dec8_nopad_bin)
  | 1094 -> (Greek, Greek_nopad_bin)
  | 1095 -> (Hebrew, Hebrew_nopad_bin)
  | 1096 -> (Hp8, Hp8_nopad_bin)
  | 1097 -> (Keybcs2, Keybcs2_nopad_bin)
  | 1098 -> (Koi8r, Koi8r_nopad_bin)
  | 1099 -> (Koi8u, Koi8u_nopad_bin)
  | 1101 -> (Latin2, Latin2_nopad_bin)
  | 1102 -> (Latin5, Latin5_nopad_bin)
  | 1103 -> (Latin7, Latin7_nopad_bin)
  | 1104 -> (Cp850, Cp850_nopad_bin)
  | 1105 -> (Cp852, Cp852_nopad_bin)
  | 1106 -> (Swe7, Swe7_nopad_bin)
  | 1107 -> (Utf8, Utf8_nopad_bin)
  | 1108 -> (Big5, Big5_nopad_bin)
  | 1109 -> (Euckr, Euckr_nopad_bin)
  | 1110 -> (Gb2312, Gb2312_nopad_bin)
  | 1111 -> (Gbk, Gbk_nopad_bin)
  | 1112 -> (Sjis, Sjis_nopad_bin)
  | 1113 -> (Tis620, Tis620_nopad_bin)
  | 1114 -> (Ucs2, Ucs2_nopad_bin)
  | 1115 -> (Ujis, Ujis_nopad_bin)
  | 1116 -> (Geostd8, Geostd8_general_nopad_ci)
  | 1117 -> (Geostd8, Geostd8_nopad_bin)
  | 1119 -> (Cp932, Cp932_japanese_nopad_ci)
  | 1120 -> (Cp932, Cp932_nopad_bin)
  | 1121 -> (Eucjpms, Eucjpms_japanese_nopad_ci)
  | 1122 -> (Eucjpms, Eucjpms_nopad_bin)
  | 1125 -> (Utf16, Utf16_unicode_nopad_ci)
  | 1147 -> (Utf16, Utf16_unicode_520_nopad_ci)
  | 1152 -> (Ucs2, Ucs2_unicode_nopad_ci)
  | 1174 -> (Ucs2, Ucs2_unicode_520_nopad_ci)
  | 1184 -> (Utf32, Utf32_unicode_nopad_ci)
  | 1206 -> (Utf32, Utf32_unicode_520_nopad_ci)
  | 1216 -> (Utf8, Utf8_unicode_nopad_ci)
  | 1238 -> (Utf8, Utf8_unicode_520_nopad_ci)
  | 1248 -> (Utf8mb4, Utf8mb4_unicode_nopad_ci)
  | 1270 -> (Utf8mb4, Utf8mb4_unicode_520_nopad_ci)
  | _  -> failwith (Printf.sprintf "Unknown (charset, collation) number %u" n)
