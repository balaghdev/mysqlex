# COM_STATISTICS

Source: <https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_com_statistics.html>

Get a human readable string of some internal status vars.

The statistics are refreshed at the time of executing this command. If the returned string is of zero length an error message is returned by mysql_stat to the client application instead of the actual empty statistics string.

Returns
    elther a [string<EOF>](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_dt_strings.html#sect_protocol_basic_dt_string_eof)
| Type | Name | Description |
| --- | --- | --- |
| int<1> | command | 0x08: COM_STATISTICS | 

See also
    cli_read_statistics, mysql_stat, dispatch_command, calc_sum_of_all_status
