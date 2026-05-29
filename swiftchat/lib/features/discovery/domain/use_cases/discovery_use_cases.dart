import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/use_cases/use_case.dart';
import '../repositories/discovery_repository.dart';

class StartAdvertising implements UseCase<void, String> {
  StartAdvertising(this.repository);
  final DiscoveryRepository repository;

  @override
  Future<Either<Failure, void>> call(String userName) async {
    return repository.startAdvertising(userName);
  }
}

class StopAdvertising implements UseCase<void, NoParams> {
  StopAdvertising(this.repository);
  final DiscoveryRepository repository;

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    return repository.stopAdvertising();
  }
}

class StartDiscovery implements UseCase<void, NoParams> {
  StartDiscovery(this.repository);
  final DiscoveryRepository repository;

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    return repository.startDiscovery();
  }
}

class StopDiscovery implements UseCase<void, NoParams> {
  StopDiscovery(this.repository);
  final DiscoveryRepository repository;

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    return repository.stopDiscovery();
  }
}

class RequestConnection implements UseCase<void, String> {
  RequestConnection(this.repository);
  final DiscoveryRepository repository;

  @override
  Future<Either<Failure, void>> call(String endpointId) async {
    return repository.requestConnection(endpointId);
  }
}
