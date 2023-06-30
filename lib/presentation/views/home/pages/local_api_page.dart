import 'package:architecture_designed/core/constants/endpoint.dart';
import 'package:architecture_designed/core/extensions/extension.dart';
import 'package:architecture_designed/core/theme/app_colors.dart';
import 'package:architecture_designed/core/theme/app_styles.dart';
import 'package:architecture_designed/gen/assets.gen.dart';
import 'package:architecture_designed/presentation/bloc/meal_provider/meal_provider_bloc.dart';
import 'package:architecture_designed/presentation/widgets/app_loading.dart';
import 'package:architecture_designed/presentation/widgets/failure_widget.dart';
import 'package:architecture_designed/presentation/widgets/meal_item.dart';
import 'package:architecture_designed/presentation/widgets/network_image.dart';
import 'package:architecture_designed/router/router_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class LocalApiPage extends StatefulWidget {
  const LocalApiPage({Key? key}) : super(key: key);

  factory LocalApiPage.routeBuilder(_, __) {
    return const LocalApiPage(key: Key('local_api_page'));
  }

  @override
  State<LocalApiPage> createState() => _LocalApiPageState();
}

class _LocalApiPageState extends State<LocalApiPage> {
  @override
  void initState() {
    context.read<MealProviderBloc>().add(const GetAllMealProviderEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Local Api'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Badge(
              alignment: Alignment.bottomRight,
              offset: const Offset(5, 5),
              label: const Text('1'),
              isLabelVisible: false,
              child: Assets.images.vectors.bag.svg(
                width: 25,
                colorFilter: ColorFilter.mode(
                  context.colorScheme.onBackground,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: BlocBuilder<MealProviderBloc, MealProviderState>(
        builder: (context, state) {
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: state.when(
              initial: () => const Text('Init'),
              loading: () => const AppLoading(),
              error: (failure) => FailureWidget(
                failure,
                onRetry: () => context.read<MealProviderBloc>().add(const GetAllMealProviderEvent()),
              ),
              loaded: (mealProviders) {
                return Scrollbar(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: SearchBar(
                            backgroundColor: MaterialStateProperty.all(
                              context.colorScheme.surfaceVariant.withOpacity(0.6),
                            ),
                            elevation: MaterialStateProperty.all(0),
                            shadowColor: MaterialStateColor.resolveWith((states) => Colors.transparent),
                            leading: const FaIcon(
                              FontAwesomeIcons.magnifyingGlass,
                              color: AppColors.seedPaletteNeutral70,
                            ),
                            padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 15)),
                            hintText: 'What will you eat today?',
                            hintStyle: MaterialStateProperty.all(
                              AppStyles.bodyLG.copyWith(color: AppColors.seedPaletteNeutral60),
                            ),
                            textStyle: MaterialStateProperty.all(
                              AppStyles.bodyLG.copyWith(color: AppColors.seedPaletteNeutral10),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Top provider',
                                style: AppStyles.bodyXL.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: const Text('See all'),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          height: 230,
                          child: ListView.separated(
                              itemCount: mealProviders.length,
                              separatorBuilder: (_, __) => const SizedBox(width: 10),
                              scrollDirection: Axis.horizontal,
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              itemBuilder: (context, index) {
                                final mealProvider = mealProviders[index];
                                return GestureDetector(
                                  onTap: () => context.push(RouterPath.mealProvider, extra: mealProvider),
                                  child: Hero(
                                    tag: mealProvider.image,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Container(
                                        width: MediaQuery.of(context).size.width / 2.3,
                                        decoration: BoxDecoration(
                                          color: context.colorScheme.surfaceVariant,
                                          image: DecorationImage(
                                            image: NetworkImage('${LocalEndpoint.baseUrl}/${mealProvider.image}'),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        child: Stack(
                                          alignment: Alignment.bottomLeft,
                                          children: [
                                            Container(
                                              decoration: const BoxDecoration(
                                                gradient: LinearGradient(
                                                  stops: [0.6, 1],
                                                  begin: Alignment.topCenter,
                                                  end: Alignment.bottomCenter,
                                                  colors: [Colors.transparent, Colors.black87],
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              top: 10,
                                              right: 10,
                                              child: Container(
                                                padding: const EdgeInsets.all(5),
                                                decoration: BoxDecoration(
                                                  color: Colors.white.withOpacity(0.8),
                                                  borderRadius: BorderRadius.circular(7),
                                                ),
                                                child: const Center(
                                                  child: FaIcon(
                                                    FontAwesomeIcons.heart,
                                                    color: Colors.red,
                                                    size: 15,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(10),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    mealProvider.name,
                                                    style: AppStyles.headlineH6.copyWith(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  const Spacer(),
                                                  const FaIcon(
                                                    FontAwesomeIcons.solidStar,
                                                    color: AppColors.seedPaletteYellow60,
                                                    size: 12,
                                                  ),
                                                  const SizedBox(width: 5),
                                                  const Text(
                                                    '4.5',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ),
                        const SizedBox(height: 30),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Popular food',
                                style: AppStyles.bodyXL.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              TextButton(onPressed: () {}, child: const Text('More')),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            separatorBuilder: (_, __) => const SizedBox(height: 10),
                            itemCount: mealProviders.first.meals.length,
                            itemBuilder: (context, index) {
                              final meal = mealProviders.first.meals[index];
                              return MealItem(
                                meal,
                                onTap: () => context.push(RouterPath.mealDetail, extra: meal),
                                hasTrailingSpacer: true,
                                trailing: FilledButton.tonal(
                                  onPressed: () {},
                                  child: const FaIcon(
                                    FontAwesomeIcons.plus,
                                    size: 15,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
