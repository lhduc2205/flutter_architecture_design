import 'package:architecture_designed/core/constants/endpoint.dart';
import 'package:architecture_designed/core/errors/exception.dart';
import 'package:architecture_designed/core/errors/failure.dart';
import 'package:architecture_designed/core/params/photo_params.dart';
import 'package:architecture_designed/core/platform/network_info.dart';
import 'package:architecture_designed/data/datasources/remote/photo.remote.datasource.dart';
import 'package:architecture_designed/data/models/photo/photo.model.dart';
import 'package:architecture_designed/domain/entities/photo.entity.dart';
import 'package:architecture_designed/domain/repositories/photo.repository.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  const PhotoRepositoryImpl({
    required this.remoteDatasource,
    required this.networkInfo,
  });

  final PhotoRemoteDataSource remoteDatasource;
  final NetworkInfo networkInfo;

  @override
  Future<(Failure?, List<Photo>?)> getAll(PhotoPageLimitParams params) async {
    if (await networkInfo.isDisconnected) {
      return (NetworkFailure(), null);
    }

    try {
      final response = await remoteDatasource.getAll(params);
      final List<PhotoModel> photos = (response.data as List).map((e) => PhotoModel.fromJson(e)).toList();
      return (null, photos);
    } on ServerException {
      String failureMessage = 'Can not connect to Remote Server\n${RemoteEndpoint.photos}';
      return (LocalServerFailure(properties: {'message': failureMessage}), null);
    }
  }
}
