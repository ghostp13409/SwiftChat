import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/peer.dart';

abstract class DiscoveryRepository {
  Future<Either<Failure, void>> startAdvertising(String userName);
  Future<Either<Failure, void>> stopAdvertising();
  Future<Either<Failure, void>> startDiscovery();
  Future<Either<Failure, void>> stopDiscovery();
  Future<Either<Failure, void>> requestConnection(String endpointId);
  Future<Either<Failure, void>> acceptConnection(String endpointId);
  Future<Either<Failure, void>> rejectConnection(String endpointId);
  Future<Either<Failure, void>> disconnect(String endpointId);
  Future<Either<Failure, void>> sendPayload(String endpointId, Map<String, dynamic> data);
  
  Stream<List<Peer>> get discoveredPeers;
  Stream<Map<String, dynamic>> get payloadStream;
}
