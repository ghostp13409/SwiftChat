import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/use_cases/use_case.dart';
import '../entities/profile.dart';
import '../repositories/profile_repository.dart';

class SaveProfile implements UseCase<void, Profile> {
  SaveProfile(this.repository);
  final ProfileRepository repository;

  @override
  Future<Either<Failure, void>> call(Profile profile) async {
    return await repository.saveProfile(profile);
  }
}
