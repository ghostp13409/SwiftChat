import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/use_cases/use_case.dart';
import '../entities/profile.dart';
import '../repositories/profile_repository.dart';

class GetProfile implements UseCase<Profile, NoParams> {
  GetProfile(this.repository);
  final ProfileRepository repository;

  @override
  Future<Either<Failure, Profile>> call(NoParams params) async {
    return await repository.getMyProfile();
  }
}
