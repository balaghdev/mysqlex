# my_command.h File Reference

Source: <https://dev.mysql.com/doc/dev/mysql-server/latest/my__command_8h.html>

[Go to the source code of this file.](https://dev.mysql.com/doc/dev/mysql-server/latest/my__command_8h_source.html)

| Enumerations |  |
| --- | --- |
| enum | enum_server_command { COM_SLEEP , COM_QUIT , COM_INIT_DB , COM_QUERY , COM_FIELD_LIST , COM_CREATE_DB , COM_DROP_DB , COM_UNUSED_2 , COM_UNUSED_1 , COM_STATISTICS , COM_UNUSED_4 , COM_CONNECT , COM_UNUSED_5 , COM_DEBUG , COM_PING , COM_TIME , COM_DELAYED_INSERT , COM_CHANGE_USER , COM_BINLOG_DUMP , COM_TABLE_DUMP , COM_CONNECT_OUT , COM_REGISTER_SLAVE , COM_STMT_PREPARE , COM_STMT_EXECUTE , COM_STMT_SEND_LONG_DATA , COM_STMT_CLOSE , COM_STMT_RESET , COM_SET_OPTION , COM_STMT_FETCH , COM_DAEMON , COM_BINLOG_DUMP_GTID , COM_RESET_CONNECTION , COM_CLONE , COM_SUBSCRIBE_GROUP_REPLICATION_STREAM , COM_END } |
|  | A list of all MySQL protocol commands. More... |
|  |  | 

## Enumeration Type Documentation

## ◆ enum_server_command

| enum enum_server_command |
| --- | 

A list of all MySQL protocol commands. 

These are the top level commands the server can receive while it listens for a new command in dispatch_command

Warning
    Add new commands to the end of this list, otherwise old servers won't be able to handle them as 'unsupported'. 
| Enumerator |  |
| --- | --- |
| COM_SLEEP | Currently refused by the server. See dispatch_command. Also used internally to mark the start of a session. |
| COM_QUIT | See COM_QUIT. |
| COM_INIT_DB | See COM_INIT_DB. |
| COM_QUERY | See COM_QUERY. |
| COM_FIELD_LIST | Deprecated. See COM_FIELD_LIST |
| COM_CREATE_DB | Currently refused by the server. See dispatch_command |
| COM_DROP_DB | Currently refused by the server. See dispatch_command |
| COM_UNUSED_2 | Removed, used to be COM_REFRESH. |
| COM_UNUSED_1 | Removed, used to be COM_SHUTDOWN. |
| COM_STATISTICS | See COM_STATISTICS. |
| COM_UNUSED_4 | Removed, used to be COM_PROCESS_INFO. |
| COM_CONNECT | Currently refused by the server. |
| COM_UNUSED_5 | Removed, used to be COM_PROCESS_KILL. |
| COM_DEBUG | See COM_DEBUG. |
| COM_PING | See COM_PING. |
| COM_TIME | Currently refused by the server. |
| COM_DELAYED_INSERT | Functionality removed. |
| COM_CHANGE_USER | See COM_CHANGE_USER. |
| COM_BINLOG_DUMP | See COM_BINLOG_DUMP. |
| COM_TABLE_DUMP |  |
| COM_CONNECT_OUT |  |
| COM_REGISTER_SLAVE |  |
| COM_STMT_PREPARE | See COM_STMT_PREPARE. |
| COM_STMT_EXECUTE | See COM_STMT_EXECUTE. |
| COM_STMT_SEND_LONG_DATA | See COM_STMT_SEND_LONG_DATA. |
| COM_STMT_CLOSE | See COM_STMT_CLOSE. |
| COM_STMT_RESET | See COM_STMT_RESET. |
| COM_SET_OPTION | See COM_SET_OPTION. |
| COM_STMT_FETCH | See COM_STMT_FETCH. |
| COM_DAEMON | Currently refused by the server. See dispatch_command. Also used internally to mark the session as a "daemon", i.e. non-client THD. Currently the scheduler and the GTID code does use this state. These threads won't be killed by KILL See alsoEvent_scheduler::start, init_thd, kill_one_thread, Find_thd_with_id |
| COM_BINLOG_DUMP_GTID |  |
| COM_RESET_CONNECTION | See COM_RESET_CONNECTION. |
| COM_CLONE |  |
| COM_SUBSCRIBE_GROUP_REPLICATION_STREAM |  |
| COM_END | Not a real command. Refused. |
