import 'package:isar/isar.dart';

part 'mesh_packet_collection.g.dart';

@collection
class MeshPacketCollection {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late String messageHash;

  @Index()
  late String recipientId;

  late String payload; // Encrypted JSON

  @Index()
  late DateTime ttl;

  late DateTime createdAt;
}
