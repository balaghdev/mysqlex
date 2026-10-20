# COM_REFRESH Flags

Source: <https://dev.mysql.com/doc/dev/mysql-server/latest/group__group__cs__com__refresh__flags.html>

Values for the `sub_command` in COM_REFRESH. More...

| Macros |  |
| --- | --- |
| #define | REFRESH_GRANT 1 |
|  | Refresh grant tables, FLUSH PRIVILEGES. More... |
|  |  |
| #define | REFRESH_LOG 2 |
|  | Start on new log file, FLUSH LOGS. More... |
|  |  |
| #define | REFRESH_TABLES 4 |
|  | close all tables, FLUSH TABLES More... |
|  |  |
| #define | UNUSED_8 8 |
|  | Previously REFRESH_HOSTS but not used anymore. More... |
|  |  |
| #define | REFRESH_STATUS 16 |
|  | Flush status variables, FLUSH STATUS. More... |
|  |  |
| #define | UNUSED_32 32 |
|  | Removed. More... |
|  |  |
| #define | REFRESH_REPLICA 64 |
|  | Reset source info and restart replica \ thread, RESET REPLICA. More... |
|  |  |
| #define | REFRESH_SOURCE 128 |
|  | Remove all bin logs in the index \ and truncate the index. More... |
|  |  |
| #define | REFRESH_ERROR_LOG 256 |
|  | Rotate only the error log. More... |
|  |  |
| #define | REFRESH_ENGINE_LOG 512 |
|  | Flush all storage engine logs. More... |
|  |  |
| #define | REFRESH_BINARY_LOG 1024 |
|  | Flush the binary log. More... |
|  |  |
| #define | REFRESH_RELAY_LOG 2048 |
|  | Flush the relay log. More... |
|  |  |
| #define | REFRESH_GENERAL_LOG 4096 |
|  | Flush the general log. More... |
|  |  |
| #define | REFRESH_SLOW_LOG 8192 |
|  | Flush the slow query log. More... |
|  |  |
| #define | REFRESH_READ_LOCK 16384 |
|  | Lock tables for read. More... |
|  |  |
| #define | REFRESH_FAST 32768 |
|  | Wait for an impending flush before closing the tables. More... |
|  |  |
| #define | REFRESH_USER_RESOURCES |
|  |  |
| #define | REFRESH_FOR_EXPORT 0x100000L /** FLUSH TABLES ... FOR EXPORT */ |
|  |  |
| #define | REFRESH_OPTIMIZER_COSTS 0x200000L /** FLUSH OPTIMIZER_COSTS */ |
|  |  |
| #define | REFRESH_PERSIST 0x400000L /** RESET PERSIST */ |
|  |  | 

## Detailed Description

Values for the `sub_command` in COM_REFRESH. 

Currently the protocol carries only 8 bits of these flags.

The rest (8-end) are used only internally in the server. 

## Macro Definition Documentation

## ◆ REFRESH_BINARY_LOG

| #define REFRESH_BINARY_LOG 1024 |
| --- | 

Flush the binary log. 

## ◆ REFRESH_ENGINE_LOG

| #define REFRESH_ENGINE_LOG 512 |
| --- | 

Flush all storage engine logs. 

## ◆ REFRESH_ERROR_LOG

| #define REFRESH_ERROR_LOG 256 |
| --- | 

Rotate only the error log. 

## ◆ REFRESH_FAST

| #define REFRESH_FAST 32768 |
| --- | 

Wait for an impending flush before closing the tables. 

See also
    REFRESH_READ_LOCK, handle_reload_request, close_cached_tables 

## ◆ REFRESH_FOR_EXPORT

| #define REFRESH_FOR_EXPORT 0x100000L /** FLUSH TABLES ... FOR EXPORT */ |
| --- | 

## ◆ REFRESH_GENERAL_LOG

| #define REFRESH_GENERAL_LOG 4096 |
| --- | 

Flush the general log. 

## ◆ REFRESH_GRANT

| #define REFRESH_GRANT 1 |
| --- | 

Refresh grant tables, FLUSH PRIVILEGES. 

## ◆ REFRESH_LOG

| #define REFRESH_LOG 2 |
| --- | 

Start on new log file, FLUSH LOGS. 

## ◆ REFRESH_OPTIMIZER_COSTS

| #define REFRESH_OPTIMIZER_COSTS 0x200000L /** FLUSH OPTIMIZER_COSTS */ |
| --- | 

## ◆ REFRESH_PERSIST

| #define REFRESH_BINARY_LOG 1024 |
| --- |0 

## ◆ REFRESH_READ_LOCK

| #define REFRESH_BINARY_LOG 1024 |
| --- |1 

Lock tables for read. 

## ◆ REFRESH_RELAY_LOG

| #define REFRESH_BINARY_LOG 1024 |
| --- |2 

Flush the relay log. 

## ◆ REFRESH_REPLICA

| #define REFRESH_BINARY_LOG 1024 |
| --- |3 

Reset source info and restart replica \ thread, RESET REPLICA. 

## ◆ REFRESH_SLOW_LOG

| #define REFRESH_BINARY_LOG 1024 |
| --- |4 

Flush the slow query log. 

## ◆ REFRESH_SOURCE

| #define REFRESH_BINARY_LOG 1024 |
| --- |5 

Remove all bin logs in the index \ and truncate the index. 

Also resets \ GTID information. Command: \ RESET BINARY LOGS AND GTIDS 

## ◆ REFRESH_STATUS

| #define REFRESH_BINARY_LOG 1024 |
| --- |6 

Flush status variables, FLUSH STATUS. 

## ◆ REFRESH_TABLES

| #define REFRESH_BINARY_LOG 1024 |
| --- |7 

close all tables, FLUSH TABLES 

## ◆ REFRESH_USER_RESOURCES

| #define REFRESH_BINARY_LOG 1024 |
| --- |8 

**Value:**

0x80000L /** FLUSH RESOURCES. @sa ::reset_mqh \

*/

## ◆ UNUSED_32

| #define REFRESH_BINARY_LOG 1024 |
| --- |9 

Removed. 

Used to be flush thread cache 

## ◆ UNUSED_8

| #define REFRESH_ENGINE_LOG 512 |
| --- |0 

Previously REFRESH_HOSTS but not used anymore. 

Use TRUNCATE TABLE \ performance_schema.host_cache instead
