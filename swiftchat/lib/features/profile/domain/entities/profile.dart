import 'package:equatable/equatable.dart';

class Profile extends Equatable {
  const Profile({
    required this.id,
    required this.username,
    this.bio,
    this.photoPath,
    required this.publicKey,
    this.topics = const [],
    this.isMe = false,
  });

  final String id;
  final String username;
  final String? bio;
  final String? photoPath;
  final String publicKey;
  final List<String> topics;
  final bool isMe;

  @override
  List<Object?> get props => [id, username, bio, photoPath, publicKey, topics, isMe];

  Profile copyWith({
    String? id,
    String? username,
    String? bio,
    String? photoPath,
    String? publicKey,
    List<String>? topics,
    bool? isMe,
  }) {
    return Profile(
      id: id ?? this.id,
      username: username ?? this.username,
      bio: bio ?? this.bio,
      photoPath: photoPath ?? this.photoPath,
      publicKey: publicKey ?? this.publicKey,
      topics: topics ?? this.topics,
      isMe: isMe ?? this.isMe,
    );
  }
}
