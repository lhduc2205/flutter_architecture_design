part of 'photo_bloc.dart';

enum PhotoStatus {
  initial,
  loading,
  loaded,
  failure,
}

@freezed
class PhotoState with _$PhotoState {
  const factory PhotoState({
    @Default(PhotoStatus.initial) PhotoStatus status,
    @Default([]) List<Photo> photos,
    @Default(1) int page,
    Failure? failure,
  }) = _PhotoState;
}
