import 'package:equatable/equatable.dart';

enum ConnectionStatus {
  discovered,
  connecting,
  connected,
  disconnected,
  rejected,
}

class Peer extends Equatable {
  const Peer({
    required this.endpointId,
    required this.endpointName,
    this.status = ConnectionStatus.discovered,
    this.userName,
  });

  final String endpointId;
  final String endpointName; // This will be the JSON-encoded Profile on discovery
  final ConnectionStatus status;
  final String? userName;

  @override
  List<Object?> get props => [endpointId, endpointName, status, userName];

  Peer copyWith({
    String? endpointId,
    String? endpointName,
    ConnectionStatus? status,
    String? userName,
  }) {
    return Peer(
      endpointId: endpointId ?? this.endpointId,
      endpointName: endpointName ?? this.endpointName,
      status: status ?? this.status,
      userName: userName ?? this.userName,
    );
  }
}
