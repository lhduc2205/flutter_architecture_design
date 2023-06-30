import 'package:architecture_designed/domain/entities/photo.entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'photo.model.freezed.dart';
part 'photo.model.g.dart';

@freezed
class PhotoModel extends Photo with _$PhotoModel {
  const factory PhotoModel({
    int? id,
    required int albumId,
    required String title,
    required String url,
    required String thumbnailUrl,
  }) = $_PhotoModel;

  factory PhotoModel.fromJson(Map<String, Object?> json) => _$PhotoModelFromJson(json);
}
