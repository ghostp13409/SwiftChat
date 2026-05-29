import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/profile.dart';

abstract class ProfileRepository {
  Future<Either<Failure, Profile>> getMyProfile();
  Future<Either<Failure, void>> saveProfile(Profile profile);
  Future<Either<Failure, List<Profile>>> getNearbyPeers();
  Future<Either<Failure, void>> savePeer(Profile peer);
}
