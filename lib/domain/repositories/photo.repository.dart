import 'package:architecture_designed/core/errors/failure.dart';
import 'package:architecture_designed/core/params/photo_params.dart';
import 'package:architecture_designed/domain/entities/photo.entity.dart';

abstract class PhotoRepository {
  Future<(Failure?, List<Photo>?)> getAll(PhotoPageLimitParams params);
}