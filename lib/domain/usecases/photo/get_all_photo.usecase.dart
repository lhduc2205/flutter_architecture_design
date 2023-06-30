import 'package:architecture_designed/core/errors/failure.dart';
import 'package:architecture_designed/core/params/photo_params.dart';
import 'package:architecture_designed/core/usecase/use_case.dart';
import 'package:architecture_designed/domain/entities/photo.entity.dart';
import 'package:architecture_designed/domain/repositories/photo.repository.dart';

class GetAllPhotoUseCase implements UseCase<List<Photo>, PhotoPageLimitParams> {
  const GetAllPhotoUseCase(this.photoRepository);

  final PhotoRepository photoRepository;

  @override
  Future<(Failure?, List<Photo>?)> call(PhotoPageLimitParams params) async {
    return await photoRepository.getAll(params);
  }
}