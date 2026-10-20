# Column Definition Flags

Source: <https://dev.mysql.com/doc/dev/mysql-server/latest/group__group__cs__column__definition__flags.html>

Values for the flags bitmask used by Send_field:flags. More...

| Macros |  |
| --- | --- |
| #define | NOT_NULL_FLAG 1 |
|  | Field can't be NULL. More... |
|  |  |
| #define | PRI_KEY_FLAG 2 |
|  | Field is part of a primary key. More... |
|  |  |
| #define | UNIQUE_KEY_FLAG 4 |
|  | Field is part of a unique key. More... |
|  |  |
| #define | MULTIPLE_KEY_FLAG 8 |
|  | Field is part of a key. More... |
|  |  |
| #define | BLOB_FLAG 16 |
|  | Field is a blob. More... |
|  |  |
| #define | UNSIGNED_FLAG 32 |
|  | Field is unsigned. More... |
|  |  |
| #define | ZEROFILL_FLAG 64 |
|  | Field is zerofill. More... |
|  |  |
| #define | BINARY_FLAG 128 |
|  | Field is binary More... |
|  |  |
| #define | ENUM_FLAG 256 |
|  | field is an enum More... |
|  |  |
| #define | AUTO_INCREMENT_FLAG 512 |
|  | field is a autoincrement field More... |
|  |  |
| #define | TIMESTAMP_FLAG 1024 |
|  | Field is a timestamp. More... |
|  |  |
| #define | SET_FLAG 2048 |
|  | field is a set More... |
|  |  |
| #define | NO_DEFAULT_VALUE_FLAG 4096 |
|  | Field doesn't have default value. More... |
|  |  |
| #define | ON_UPDATE_NOW_FLAG 8192 |
|  | Field is set to NOW on UPDATE. More... |
|  |  |
| #define | PART_KEY_FLAG 16384 |
|  | Intern; Part of some key. More... |
|  |  |
| #define | NUM_FLAG 32768 |
|  | Field is num (for clients) More... |
|  |  |
| #define | UNIQUE_FLAG 65536 |
|  | Intern: Used by sql_yacc. More... |
|  |  |
| #define | BINCMP_FLAG 131072 |
|  | Intern: Used by sql_yacc. More... |
|  |  |
| #define | GET_FIXED_FIELDS_FLAG (1 << 18) |
|  | Used to get fields in item tree . More... |
|  |  |
| #define | FIELD_IN_PART_FUNC_FLAG (1 << 19) |
|  | Field part of partition func. More... |
|  |  |
| #define | FIELD_IN_ADD_INDEX (1 << 20) |
|  | Intern: Field in TABLE object for new version of altered table, which participates in a newly added index. More... |
|  |  |
| #define | FIELD_IS_RENAMED (1 << 21) |
|  | Intern: Field is being renamed. More... |
|  |  |
| #define | FIELD_FLAGS_STORAGE_MEDIA 22 |
|  | Field storage media, bit 22-23. More... |
|  |  |
| #define | FIELD_FLAGS_STORAGE_MEDIA_MASK (3 << FIELD_FLAGS_STORAGE_MEDIA) |
|  |  |
| #define | FIELD_FLAGS_COLUMN_FORMAT 24 |
|  | Field column format, bit 24-25. More... |
|  |  |
| #define | FIELD_FLAGS_COLUMN_FORMAT_MASK (3 << FIELD_FLAGS_COLUMN_FORMAT) |
|  |  |
| #define | FIELD_IS_DROPPED (1 << 26) |
|  | Intern: Field is being dropped. More... |
|  |  |
| #define | EXPLICIT_NULL_FLAG (1 << 27) |
|  | Field is explicitly specified as \ NULL by the user. More... |
|  |  |
| #define | GROUP_FLAG (1 << 28) |
|  | Intern: Group field. More... |
|  |  |
| #define | NOT_SECONDARY_FLAG (1 << 29) |
|  | Field will not be loaded in secondary engine. More... |
|  |  |
| #define | FIELD_IS_INVISIBLE (1 << 30) |
|  | Field is explicitly marked as invisible by the user. More... |
|  |  | 

## Detailed Description

Values for the flags bitmask used by Send_field:flags. 

Currently need to fit into 32 bits.

Each bit represents an optional feature of the protocol.

Both the client and the server are sending these.

The intersection of the two determines what optional parts of the protocol will be used. 

## Macro Definition Documentation

## ◆ AUTO_INCREMENT_FLAG

| #define AUTO_INCREMENT_FLAG 512 |
| --- | 

field is a autoincrement field 

## ◆ BINARY_FLAG

| #define BINARY_FLAG 128 |
| --- | 

Field is binary   

## ◆ BINCMP_FLAG

| #define BINCMP_FLAG 131072 |
| --- | 

Intern: Used by sql_yacc. 

## ◆ BLOB_FLAG

| #define BLOB_FLAG 16 |
| --- | 

Field is a blob. 

## ◆ ENUM_FLAG

| #define ENUM_FLAG 256 |
| --- | 

field is an enum 

## ◆ EXPLICIT_NULL_FLAG

| #define EXPLICIT_NULL_FLAG (1 << 27) |
| --- | 

Field is explicitly specified as \ NULL by the user. 

## ◆ FIELD_FLAGS_COLUMN_FORMAT

| #define FIELD_FLAGS_COLUMN_FORMAT 24 |
| --- | 

Field column format, bit 24-25. 

## ◆ FIELD_FLAGS_COLUMN_FORMAT_MASK

| #define FIELD_FLAGS_COLUMN_FORMAT_MASK (3 << FIELD_FLAGS_COLUMN_FORMAT) |
| --- | 

## ◆ FIELD_FLAGS_STORAGE_MEDIA

| #define FIELD_FLAGS_STORAGE_MEDIA 22 |
| --- | 

Field storage media, bit 22-23. 

## ◆ FIELD_FLAGS_STORAGE_MEDIA_MASK

| #define AUTO_INCREMENT_FLAG 512 |
| --- |0 

## ◆ FIELD_IN_ADD_INDEX

| #define AUTO_INCREMENT_FLAG 512 |
| --- |1 

Intern: Field in TABLE object for new version of altered table, which participates in a newly added index. 

## ◆ FIELD_IN_PART_FUNC_FLAG

| #define AUTO_INCREMENT_FLAG 512 |
| --- |2 

Field part of partition func. 

## ◆ FIELD_IS_DROPPED

| #define AUTO_INCREMENT_FLAG 512 |
| --- |3 

Intern: Field is being dropped. 

## ◆ FIELD_IS_INVISIBLE

| #define AUTO_INCREMENT_FLAG 512 |
| --- |4 

Field is explicitly marked as invisible by the user. 

## ◆ FIELD_IS_RENAMED

| #define AUTO_INCREMENT_FLAG 512 |
| --- |5 

Intern: Field is being renamed. 

## ◆ GET_FIXED_FIELDS_FLAG

| #define AUTO_INCREMENT_FLAG 512 |
| --- |6 

Used to get fields in item tree . 

## ◆ GROUP_FLAG

| #define AUTO_INCREMENT_FLAG 512 |
| --- |7 

Intern: Group field. 

Transient use in \ create_tmp_table 

## ◆ MULTIPLE_KEY_FLAG

| #define AUTO_INCREMENT_FLAG 512 |
| --- |8 

Field is part of a key. 

## ◆ NO_DEFAULT_VALUE_FLAG

| #define AUTO_INCREMENT_FLAG 512 |
| --- |9 

Field doesn't have default value. 

## ◆ NOT_NULL_FLAG

| #define BINARY_FLAG 128 |
| --- |0 

Field can't be NULL. 

## ◆ NOT_SECONDARY_FLAG

| #define BINARY_FLAG 128 |
| --- |1 

Field will not be loaded in secondary engine. 

## ◆ NUM_FLAG

| #define BINARY_FLAG 128 |
| --- |2 

Field is num (for clients) 

## ◆ ON_UPDATE_NOW_FLAG

| #define BINARY_FLAG 128 |
| --- |3 

Field is set to NOW on UPDATE. 

## ◆ PART_KEY_FLAG

| #define BINARY_FLAG 128 |
| --- |4 

Intern; Part of some key. 

## ◆ PRI_KEY_FLAG

| #define BINARY_FLAG 128 |
| --- |5 

Field is part of a primary key. 

## ◆ SET_FLAG

| #define BINARY_FLAG 128 |
| --- |6 

field is a set 

## ◆ TIMESTAMP_FLAG

| #define BINARY_FLAG 128 |
| --- |7 

Field is a timestamp. 

## ◆ UNIQUE_FLAG

| #define BINARY_FLAG 128 |
| --- |8 

Intern: Used by sql_yacc. 

## ◆ UNIQUE_KEY_FLAG

| #define BINARY_FLAG 128 |
| --- |9 

Field is part of a unique key. 

## ◆ UNSIGNED_FLAG

| #define BINCMP_FLAG 131072 |
| --- |0 

Field is unsigned. 

## ◆ ZEROFILL_FLAG

| #define BINCMP_FLAG 131072 |
| --- |1 

Field is zerofill.
