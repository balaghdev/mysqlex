# Compressed Packet

Source: <https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_compression_packet.html>

The compressed packet consists of a [Compressed Packet Header](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_compression_packet.html#sect_protocol_basic_compression_packet_header) and a payload which is either a [Compressed Payload](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_compression_packet.html#sect_protocol_basic_compression_packet_compressed_payload) or [Uncompressed Payload](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_compression_packet.html#sect_protocol_basic_compression_packet_uncompressed_payload).

See also
    compress_packet, CLIENT_COMPRESS

#  Compressed Packet Header

| Type | Name | Description |
| --- | --- | --- |
| int<3> | length of compressed payload | raw packet length minus the size of the compressed packet header (7 bytes) itself. |
| int<1> | compressed sequence id | Sequence ID of the compressed packets, reset in the same way as the Protocol::Packet, but incremented independently |
| int<3> | length of uncompressed payload | Length of payload before compression | 

#  Compressed Payload

If the length of _length of payload before compression_ is more than 0 the [Compressed Packet Header](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_compression_packet.html#sect_protocol_basic_compression_packet_header) is followed by the compressed payload.

Depending on which capability flags are set it uses the _deflate_ algorithm as described in [RFC 1951](http://tools.ietf.org/html/rfc1951.html) and implemented in [zlib](http://zlib.org/) or [Zstandard](https://facebook.github.io/zstd/).

When using zlib, the header of the compressed packet has the parameters of the `uncompress()` function in mind:

ZEXTERN int ZEXPORT uncompress OF((Bytef *dest, uLongf *destLen,

const Bytef *[source](https://dev.mysql.com/doc/dev/mysql-server/latest/replication__asynchronous__connection__failover_8proto.html#aad49f34411aaf210dc5d7b8cd062bcb8), uLong sourceLen));

[source](https://dev.mysql.com/doc/dev/mysql-server/latest/replication__asynchronous__connection__failover_8proto.html#aad49f34411aaf210dc5d7b8cd062bcb8)

repeated Source source

**Definition:** replication_asynchronous_connection_failover.proto:42

The payload can be anything from a piece of a MySQL Packet to several MySQL Packets. The client or server may bundle several MySQL packets, compress it and send it as one compressed packet.

##  Example: One MySQL Packet

A COM_QUERY for `select "012345678901234567890123456789012345"` without CLIENT_COMPRESS has a _payload length_ of 46 bytes and looks like:

2e 00 00 00 03 73 65 6c 65 63 74 20 22 30 31 32 .....select "012

33 34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 3456789012345678

39 30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 9012345678901234

35 22 5"

With CLIENT_COMPRESS the packet is:

22 00 00 00 32 00 00 78 9c d3 63 60 60 60 2e 4e "...2..x..c```.N

cd 49 4d 2e 51 50 32 30 34 32 36 31 35 33 b7 b0 .IM.QP20426153..

c4 cd 52 02 00 0c d1 0a 6c ..R.....l

| comp-length | seq-id | uncomp-len | Compressed Payload |
| --- | --- | --- | --- |
| 22 00 00 | 00 | 32 00 00 | compress("\x2e\x00\x00\x00\x03select ...")` | 

The compressed packet is 41 bytes long and splits into:

raw packet [length](https://dev.mysql.com/doc/dev/mysql-server/latest/namespacegis.html#a1e3bf735dbe640151561b282f0f4dba5) -> 41

compressed payload [length](https://dev.mysql.com/doc/dev/mysql-server/latest/namespacegis.html#a1e3bf735dbe640151561b282f0f4dba5) = 22 00 00 -> 34 (41 - 7)

[sequence](https://dev.mysql.com/doc/dev/mysql-server/latest/udf__example_8cc.html#aa48a6c218d5a51dadae7378c4e83c109) id = 00 -> 0

uncompressed payload [length](https://dev.mysql.com/doc/dev/mysql-server/latest/namespacegis.html#a1e3bf735dbe640151561b282f0f4dba5) = 32 00 00 -> 50

[gis::length](https://dev.mysql.com/doc/dev/mysql-server/latest/namespacegis.html#a1e3bf735dbe640151561b282f0f4dba5)

bool length(const dd::Spatial_reference_system *srs, const Geometry *g1, double *length, bool *null) noexcept

Computes the length of linestrings and multilinestrings.

**Definition:** length.cc:76

[sequence](https://dev.mysql.com/doc/dev/mysql-server/latest/udf__example_8cc.html#aa48a6c218d5a51dadae7378c4e83c109)

long long sequence(UDF_INIT *initid, UDF_ARGS *args, unsigned char *, unsigned char *)

**Definition:** udf_example.cc:568

##  Example: Several MySQL Packets

Executing `SELECT repeat("a", 50)` results in uncompressed ProtocolText::Resultset like: 

01 00 00 01 01 25 00 00 02 03 64 65 66 00 00 00 .....%....def...

0f 72 65 70 65 61 74 28 22 61 22 2c 20 35 30 29 .repeat("a", 50)

00 0c 08 00 32 00 00 00 fd 01 00 1f 00 00 05 00 ....2...........

00 03 fe 00 00 02 00 33 00 00 04 32 61 61 61 61 .......3...2aaaa

61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 aaaaaaaaaaaaaaaa

61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 aaaaaaaaaaaaaaaa

61 61 61 61 61 61 61 61 61 61 61 61 61 61 05 00 aaaaaaaaaaaaaa..

00 05 fe 00 00 02 00 .......

which consists of 5 [Protocol::Packet](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_packets.html#sect_protocol_basic_packets_packet) :

  * `01 00 00 01 01`
  * `25 00 00 02 03 64 65 66 00 00 00 0f 72 65 70 65 61 74 28 22 61 22 2c 20 35 30 29 00 0c 08 00 32 00 00 00 fd 01 00 1f 00 00`
  * `05 00 00 03 fe 00 00 02 00`
  * `33 00 00 04 32 61 61 61 61 ...`
  * `05 00 00 05 fe 00 00 02 00`

If compression is enabled a compressed packet containing the compressed version of all 5 packets is sent to the client:

4a 00 00 01 77 00 00 78 9c 63 64 60 60 64 54 65 J...w..x.cd``dTe

60 60 62 4e 49 4d 63 60 60 e0 2f 4a 2d 48 4d 2c ``bNIMc``./J-HM,

[d1](https://dev.mysql.com/doc/dev/mysql-server/latest/dtoa_8cc.html#a1fe17aa2ff1722c937379044a27da68a) 50 4a 54 d2 51 30 35 [d0](https://dev.mysql.com/doc/dev/mysql-server/latest/dtoa_8cc.html#ade11f3df9cc63f54fa743250c646e270) 64 e0 e1 60 30 02 8a .PJT.Q05.d..`0..

ff 65 64 90 67 60 60 65 60 60 fe 07 54 cc 60 cc .ed.g``e``..[T](https://dev.mysql.com/doc/dev/mysql-server/latest/jit__executor__value_8cc.html#a0acb682b8260ab1c60b918599864e2e5).`.

c0 c0 62 94 48 32 00 ea 67 05 eb 07 00 8d f9 1c ..b.H2..g.......

64 d

[d1](https://dev.mysql.com/doc/dev/mysql-server/latest/dtoa_8cc.html#a1fe17aa2ff1722c937379044a27da68a)

#define d1

[d0](https://dev.mysql.com/doc/dev/mysql-server/latest/dtoa_8cc.html#ade11f3df9cc63f54fa743250c646e270)

#define d0

[T](https://dev.mysql.com/doc/dev/mysql-server/latest/jit__executor__value_8cc.html#a0acb682b8260ab1c60b918599864e2e5)

#define T

**Definition:** jit_executor_value.cc:373

Note
    sending a MySQL Packet of the size 224-5 to 224-1 via compression leads to at least one extra compressed packet. If the uncompressed MySQL Packet is like 

fe ff ff 03 ... -- [length](https://dev.mysql.com/doc/dev/mysql-server/latest/namespacegis.html#a1e3bf735dbe640151561b282f0f4dba5) = 2^24-2, [sequence](https://dev.mysql.com/doc/dev/mysql-server/latest/udf__example_8cc.html#aa48a6c218d5a51dadae7378c4e83c109) id = 3

compressing it would result in the _length of payload before compression_ in the [Compressed Packet Header](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_compression_packet.html#sect_protocol_basic_compression_packet_header) being: 

[length](https://dev.mysql.com/doc/dev/mysql-server/latest/namespacegis.html#a1e3bf735dbe640151561b282f0f4dba5) of [mysql](https://dev.mysql.com/doc/dev/mysql-server/latest/namespacemysql.html) packet payload: 2^24-2

[length](https://dev.mysql.com/doc/dev/mysql-server/latest/namespacegis.html#a1e3bf735dbe640151561b282f0f4dba5) of [mysql](https://dev.mysql.com/doc/dev/mysql-server/latest/namespacemysql.html) packet header: 4

[length](https://dev.mysql.com/doc/dev/mysql-server/latest/namespacegis.html#a1e3bf735dbe640151561b282f0f4dba5) of payload before compression: 2^24+2

[mysql](https://dev.mysql.com/doc/dev/mysql-server/latest/namespacemysql.html)

**Definition:** system_info_linux.cc:46

which can not be represented in one compressed packet. Instead two or more packets have to be sent.

#  Uncompressed Payload

For small packets it may be to costly to compress the packet:

  * compressing the packet may lead to more data and sending the data uncompressed
  * CPU overhead may be not worth to compress the data 

Tip
    Usually payloads less than 50 bytes (MIN_COMPRESS_LENGTH) aren't compressed.
To send an [Uncompressed Payload](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_compression_packet.html#sect_protocol_basic_compression_packet_uncompressed_payload) :
  * set _length of payload before compression_ in [Compressed Packet Header](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_compression_packet.html#sect_protocol_basic_compression_packet_header) to 0
  * The [Compressed Payload](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_compression_packet.html#sect_protocol_basic_compression_packet_compressed_payload) contains the [Uncompressed Payload](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_compression_packet.html#sect_protocol_basic_compression_packet_uncompressed_payload) instead.

Sending a `SELECT 1` query as [Uncompressed Payload](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_compression_packet.html#sect_protocol_basic_compression_packet_uncompressed_payload) to the server looks like: 

0d 00 00 00 00 00 00 09 00 00 00 03 53 45 4c 45 ............SELE

43 54 20 31 CT 1

decodes into: 

raw packet [length](https://dev.mysql.com/doc/dev/mysql-server/latest/namespacegis.html#a1e3bf735dbe640151561b282f0f4dba5) -> 20

compressed payload [length](https://dev.mysql.com/doc/dev/mysql-server/latest/namespacegis.html#a1e3bf735dbe640151561b282f0f4dba5) = 0d 00 00 -> 13 (20 - 7)

[sequence](https://dev.mysql.com/doc/dev/mysql-server/latest/udf__example_8cc.html#aa48a6c218d5a51dadae7378c4e83c109) id = 00 -> 0

uncompressed payload [length](https://dev.mysql.com/doc/dev/mysql-server/latest/namespacegis.html#a1e3bf735dbe640151561b282f0f4dba5) = 00 00 00 -> uncompressed

... with the _uncompressed payload_ starting right after the 7 byte header:

09 00 00 00 03 53 45 4c 45 43 54 20 31 -- [SELECT](https://dev.mysql.com/doc/dev/mysql-server/latest/namespaceconsts.html#ae42e6bb9561cb112c8df234e2d9ed34a) 1

[consts::SELECT](https://dev.mysql.com/doc/dev/mysql-server/latest/namespaceconsts.html#ae42e6bb9561cb112c8df234e2d9ed34a)

const std::string SELECT("SELECT")

Name of the static privileges.
