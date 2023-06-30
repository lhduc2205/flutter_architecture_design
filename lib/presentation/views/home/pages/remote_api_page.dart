import 'package:architecture_designed/core/theme/app_styles.dart';
import 'package:architecture_designed/gen/assets.gen.dart';
import 'package:architecture_designed/presentation/bloc/photo/photo_bloc.dart';
import 'package:architecture_designed/presentation/widgets/app_loading.dart';
import 'package:architecture_designed/presentation/widgets/failure_widget.dart';
import 'package:architecture_designed/presentation/widgets/network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RemoteApiPage extends StatefulWidget {
  const RemoteApiPage({Key? key}) : super(key: key);

  factory RemoteApiPage.routeBuilder(_, __) {
    return const RemoteApiPage(
      key: Key('remote_api_page'),
    );
  }

  @override
  State<RemoteApiPage> createState() => _RemoteApiPageState();
}

class _RemoteApiPageState extends State<RemoteApiPage> {
  final scrollController = ScrollController();
  bool isLoadingMore = false;

  @override
  void initState() {
    scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Infinite scroll'),
      ),
      body: BlocBuilder<PhotoBloc, PhotoState>(
        builder: (context, state) {
          if (state.status == PhotoStatus.loading) {
            return const AppLoading();
          }
          if (state.status == PhotoStatus.failure) {
            return FailureWidget(
              state.failure!,
              onRetry: () => context.read<PhotoBloc>().add(const GetAllPhotosEvent()),
            );
          }
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: GridView.builder(
              controller: scrollController,
              padding: const EdgeInsets.all(20),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
              ),
              itemCount: isLoadingMore ? state.photos.length : state.photos.length + 2,
              itemBuilder: (context, index) {
                if (index >= state.photos.length) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Assets.lotties.imageLoading.lottie(),
                  );
                }
                return Stack(
                  children: [
                    AppNetworkImage(url: state.photos[index].url),
                    Positioned(
                      top: 10,
                      left: 10,
                      child: CircleAvatar(
                        child: Text(state.photos[index].id.toString()),
                      ),
                    ),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }

  Future<void> _scrollListener() async {
    if (scrollController.position.pixels >= scrollController.position.maxScrollExtent * 0.8) {
      setState(() => isLoadingMore = true);
      await Future.delayed(const Duration(seconds: 1));
      loadFirstPagePhotos();
      print('End');
    } else {
      print('NO');
      setState(() => isLoadingMore = false);
    }
  }

  void loadFirstPagePhotos() {
    context.read<PhotoBloc>().add(const LoadMorePhotosEvent());
  }

  @override
  void dispose() {
    scrollController.removeListener;
    super.dispose();
  }
}
