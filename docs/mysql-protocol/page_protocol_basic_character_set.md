# Character Set

Source: <https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_character_set.html>

MySQL has a very flexible character set support as documented in [Character Set Support](https://dev.mysql.com/doc/refman/en/charset.html).

The list of character sets and their IDs can be queried as follows:
    
    
      SELECT id, collation_name FROM information_schema.collations ORDER BY id;
      +----+-------------------+
      | id | collation_name    |
      +----+-------------------+
      |  1 | big5_chinese_ci   |
      |  2 | latin2_czech_cs   |
      |  3 | dec8_swedish_ci   |
      |  4 | cp850_general_ci  |
      |  5 | latin1_german1_ci |
      |  6 | hp8_english_ci    |
      |  7 | koi8r_general_ci  |
      |  8 | latin1_swedish_ci |
      |  9 | latin2_general_ci |
      | 10 | swe7_swedish_ci   |
      +----+-------------------+
    

The following table shows a few common character sets.

| Number | Hex | Character Set Name |
| --- | --- | --- |
| 8 | 0x08 | latin1_swedish_ci |
| 33 | 0x21 | utf8mb3_general_ci |
| 63 | 0x3f | binary | 

## Protocol::CharacterSet 

A character set is defined in the protocol as a integer. Fields:

  * charset_nr (2) - number of the character set and collation
