# Shutdown/kill enums and constants

Source: <https://dev.mysql.com/doc/dev/mysql-server/latest/group__group__cs__shutdown__kill__constants.html>

| Macros |  |
| --- | --- |
| #define | MYSQL_SHUTDOWN_KILLABLE_CONNECT (unsigned char)(1 << 0) |
|  |  |
| #define | MYSQL_SHUTDOWN_KILLABLE_TRANS (unsigned char)(1 << 1) |
|  |  |
| #define | MYSQL_SHUTDOWN_KILLABLE_LOCK_TABLE (unsigned char)(1 << 2) |
|  |  |
| #define | MYSQL_SHUTDOWN_KILLABLE_UPDATE (unsigned char)(1 << 3) |
|  |  | | Enumerations |  |
| --- | --- |
| enum | mysql_enum_shutdown_level { SHUTDOWN_DEFAULT = 0 , SHUTDOWN_WAIT_CONNECTIONS = MYSQL_SHUTDOWN_KILLABLE_CONNECT , SHUTDOWN_WAIT_TRANSACTIONS = MYSQL_SHUTDOWN_KILLABLE_TRANS , SHUTDOWN_WAIT_UPDATES = MYSQL_SHUTDOWN_KILLABLE_UPDATE , SHUTDOWN_WAIT_ALL_BUFFERS = (MYSQL_SHUTDOWN_KILLABLE_UPDATE << 1) , SHUTDOWN_WAIT_CRITICAL_BUFFERS = (MYSQL_SHUTDOWN_KILLABLE_UPDATE << 1) + 1 , KILL_QUERY = 254 , KILL_CONNECTION = 255 } |
|  | We want levels to be in growing order of hardness (because we use number comparisons). More... |
|  |  | 

## Detailed Description

See also
    THD::is_killable 

## Macro Definition Documentation

## ◆ MYSQL_SHUTDOWN_KILLABLE_CONNECT

| #define MYSQL_SHUTDOWN_KILLABLE_CONNECT (unsigned char)(1 << 0) |
| --- | 

## ◆ MYSQL_SHUTDOWN_KILLABLE_LOCK_TABLE

| #define MYSQL_SHUTDOWN_KILLABLE_LOCK_TABLE (unsigned char)(1 << 2) |
| --- | 

## ◆ MYSQL_SHUTDOWN_KILLABLE_TRANS

| #define MYSQL_SHUTDOWN_KILLABLE_TRANS (unsigned char)(1 << 1) |
| --- | 

## ◆ MYSQL_SHUTDOWN_KILLABLE_UPDATE

| #define MYSQL_SHUTDOWN_KILLABLE_UPDATE (unsigned char)(1 << 3) |
| --- | 

## Enumeration Type Documentation

## ◆ mysql_enum_shutdown_level

| enum mysql_enum_shutdown_level |
| --- | 

We want levels to be in growing order of hardness (because we use number comparisons). 

Note
    SHUTDOWN_DEFAULT does not respect the growing property, but it's ok. 
| Enumerator |  |
| --- | --- |
| SHUTDOWN_DEFAULT |  |
| SHUTDOWN_WAIT_CONNECTIONS | Wait for existing connections to finish. |
| SHUTDOWN_WAIT_TRANSACTIONS | Wait for existing transactons to finish. |
| SHUTDOWN_WAIT_UPDATES | Wait for existing updates to finish (=> no partial MyISAM update) |
| SHUTDOWN_WAIT_ALL_BUFFERS | Flush InnoDB buffers and other storage engines' buffers. |
| SHUTDOWN_WAIT_CRITICAL_BUFFERS | Don't flush InnoDB buffers, flush other storage engines' buffers. |
| KILL_QUERY | Query level of the KILL command. |
| KILL_CONNECTION | Connection level of the KILL command. |
