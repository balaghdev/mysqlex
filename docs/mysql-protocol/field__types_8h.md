# field_types.h File Reference

Source: <https://dev.mysql.com/doc/dev/mysql-server/latest/field__types_8h.html>

This file contains the field type. More...

[Go to the source code of this file.](https://dev.mysql.com/doc/dev/mysql-server/latest/field__types_8h_source.html)

| Enumerations |  |
| --- | --- |
| enum | enum_field_types { MYSQL_TYPE_DECIMAL , MYSQL_TYPE_TINY , MYSQL_TYPE_SHORT , MYSQL_TYPE_LONG , MYSQL_TYPE_FLOAT , MYSQL_TYPE_DOUBLE , MYSQL_TYPE_NULL , MYSQL_TYPE_TIMESTAMP , MYSQL_TYPE_LONGLONG , MYSQL_TYPE_INT24 , MYSQL_TYPE_DATE , MYSQL_TYPE_TIME , MYSQL_TYPE_DATETIME , MYSQL_TYPE_YEAR , MYSQL_TYPE_NEWDATE , MYSQL_TYPE_VARCHAR , MYSQL_TYPE_BIT , MYSQL_TYPE_TIMESTAMP2 , MYSQL_TYPE_DATETIME2 , MYSQL_TYPE_TIME2 , MYSQL_TYPE_TYPED_ARRAY , MYSQL_TYPE_VECTOR = 242 , MYSQL_TYPE_INVALID = 243 , MYSQL_TYPE_BOOL = 244 , MYSQL_TYPE_JSON = 245 , MYSQL_TYPE_NEWDECIMAL = 246 , MYSQL_TYPE_ENUM = 247 , MYSQL_TYPE_SET = 248 , MYSQL_TYPE_TINY_BLOB = 249 , MYSQL_TYPE_MEDIUM_BLOB = 250 , MYSQL_TYPE_LONG_BLOB = 251 , MYSQL_TYPE_BLOB = 252 , MYSQL_TYPE_VAR_STRING = 253 , MYSQL_TYPE_STRING = 254 , MYSQL_TYPE_GEOMETRY = 255 } |
|  | Column types for MySQL Note: Keep include/mysql/components/services/bits/stored_program_bits.h and include/mysql/components/services/bits/mysql_field_types_bits.h in sync with this. More... |
|  |  | 

## Detailed Description

This file contains the field type. 

Note
    This file can be imported both from C and C++ code, so the definitions have to be constructed to support this. 

## Enumeration Type Documentation

## ◆ enum_field_types

| enum enum_field_types |
| --- | 

Column types for MySQL Note: Keep include/mysql/components/services/bits/stored_program_bits.h and include/mysql/components/services/bits/mysql_field_types_bits.h in sync with this. 

| Enumerator |  |
| --- | --- |
| MYSQL_TYPE_DECIMAL |  |
| MYSQL_TYPE_TINY |  |
| MYSQL_TYPE_SHORT |  |
| MYSQL_TYPE_LONG |  |
| MYSQL_TYPE_FLOAT |  |
| MYSQL_TYPE_DOUBLE |  |
| MYSQL_TYPE_NULL |  |
| MYSQL_TYPE_TIMESTAMP |  |
| MYSQL_TYPE_LONGLONG |  |
| MYSQL_TYPE_INT24 |  |
| MYSQL_TYPE_DATE |  |
| MYSQL_TYPE_TIME |  |
| MYSQL_TYPE_DATETIME |  |
| MYSQL_TYPE_YEAR |  |
| MYSQL_TYPE_NEWDATE | Internal to MySQL. Not used in protocol |
| MYSQL_TYPE_VARCHAR |  |
| MYSQL_TYPE_BIT |  |
| MYSQL_TYPE_TIMESTAMP2 |  |
| MYSQL_TYPE_DATETIME2 | Internal to MySQL. Not used in protocol |
| MYSQL_TYPE_TIME2 | Internal to MySQL. Not used in protocol |
| MYSQL_TYPE_TYPED_ARRAY | Used for replication only. |
| MYSQL_TYPE_VECTOR |  |
| MYSQL_TYPE_INVALID |  |
| MYSQL_TYPE_BOOL | Currently just a placeholder. |
| MYSQL_TYPE_JSON |  |
| MYSQL_TYPE_NEWDECIMAL |  |
| MYSQL_TYPE_ENUM |  |
| MYSQL_TYPE_SET |  |
| MYSQL_TYPE_TINY_BLOB |  |
| MYSQL_TYPE_MEDIUM_BLOB |  |
| MYSQL_TYPE_LONG_BLOB |  |
| MYSQL_TYPE_BLOB |  |
| MYSQL_TYPE_VAR_STRING |  |
| MYSQL_TYPE_STRING |  |
| MYSQL_TYPE_GEOMETRY |  |
