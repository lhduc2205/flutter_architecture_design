import 'package:architecture_designed/core/errors/failure.dart';
import 'package:architecture_designed/core/params/photo_params.dart';
import 'package:architecture_designed/domain/entities/photo.entity.dart';
import 'package:architecture_designed/domain/usecases/photo/get_all_photo.usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'photo_event.dart';

part 'photo_state.dart';

part 'photo_bloc.freezed.dart';

class PhotoBloc extends Bloc<PhotoEvent, PhotoState> {
  PhotoBloc({
    required this.getAllPhotoUseCase,
  }) : super(const PhotoState()) {
    on<PhotoEvent>((events, emit) async {
      await events.map(
        getAll: (event) => _onGetAllPhotos(event, emit),
        loadMore: (event) => _onLoadMorePhotos(event, emit),
      );
    });
  }

  final GetAllPhotoUseCase getAllPhotoUseCase;

  Future<void> _onGetAllPhotos(
    GetAllPhotosEvent event,
    Emitter<PhotoState> emit,
  ) async {
    emit(state.copyWith(status: PhotoStatus.loading));
    await Future.delayed(const Duration(seconds: 1));

    final (error, data) = await getAllPhotoUseCase(event.params ?? const PhotoPageLimitParams());

    if (error != null) {
      emit(state.copyWith(status: PhotoStatus.failure, failure: error));
      return;
    }

    emit(state.copyWith(
      status: PhotoStatus.loaded,
      photos: data!,
    ));
  }

  Future<void> _onLoadMorePhotos(
    LoadMorePhotosEvent event,
    Emitter<PhotoState> emit,
  ) async {
    if (state.page == 1) {
      emit(state.copyWith(status: PhotoStatus.loading));
      await Future.delayed(const Duration(seconds: 1));
    }

    final (error, data) = await getAllPhotoUseCase(PhotoPageLimitParams(page: state.page));

    if (error != null) {
      emit(state.copyWith(status: PhotoStatus.failure, failure: error));
      return;
    }

    if (data!.isEmpty || state.photos.contains(data.first)) {
      return;
    }

    emit(
      state.copyWith(
        status: PhotoStatus.loaded,
        photos: [...state.photos, ...data],
        page: state.page + 1,
      ),
    );
  }
}
