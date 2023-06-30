part of 'photo_bloc.dart';

@freezed
class PhotoEvent with _$PhotoEvent {
  const factory PhotoEvent.getAll({PhotoPageLimitParams? params}) = GetAllPhotosEvent;
  const factory PhotoEvent.loadMore() = LoadMorePhotosEvent;
}
