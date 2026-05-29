import 'package:isar/isar.dart';

part 'profile_collection.g.dart';

@collection
class ProfileCollection {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late String peerId;
  
  late String username;
  String? bio;
  String? photoPath;
  late String publicKey;
  late List<String> topics;
  late bool isMe;
}
