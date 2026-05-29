import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'collections/profile_collection.dart';
import 'collections/message_collection.dart';
import 'collections/mesh_packet_collection.dart';

class IsarDatabase {
  static late Isar isar;

  static Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open([
      ProfileCollectionSchema,
      MessageCollectionSchema,
      MeshPacketCollectionSchema,
    ], directory: dir.path);
  }
}
