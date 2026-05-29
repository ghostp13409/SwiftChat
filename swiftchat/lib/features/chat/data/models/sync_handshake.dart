class SyncHandshake {
  const SyncHandshake({required this.packets});

  factory SyncHandshake.fromJson(Map<String, dynamic> json) {
    if (json['type'] != 'sync_handshake') {
      throw const FormatException('Invalid handshake type');
    }

    final rawPackets = json['packets'];
    if (rawPackets is! Map) {
      throw const FormatException('Invalid packets format');
    }

    return SyncHandshake(
      packets: Map<String, int>.from(rawPackets.map(
        (key, value) => MapEntry(key.toString(), value as int),
      )),
    );
  }

  final Map<String, int> packets;

  Map<String, dynamic> toJson() {
    return {
      'type': 'sync_handshake',
      'packets': packets,
    };
  }
}
