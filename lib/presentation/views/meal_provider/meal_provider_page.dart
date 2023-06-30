import 'package:architecture_designed/core/constants/endpoint.dart';
import 'package:architecture_designed/core/extensions/extension.dart';
import 'package:architecture_designed/core/theme/app_styles.dart';
import 'package:architecture_designed/domain/entities/meal_provider.entity.dart';
import 'package:architecture_designed/presentation/widgets/app_section.dart';
import 'package:architecture_designed/presentation/widgets/meal_item.dart';
import 'package:architecture_designed/presentation/widgets/rating_chip.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class MealProviderPage extends StatefulWidget {
  const MealProviderPage({
    Key? key,
    required this.mealProvider,
  }) : super(key: key);

  factory MealProviderPage.routeBuilder(_, GoRouterState state) {
    MealProvider mealProvider = state.extra! as MealProvider;
    return MealProviderPage(
      key: const Key('meal_provider_page'),
      mealProvider: mealProvider,
    );
  }

  final MealProvider mealProvider;

  @override
  State<MealProviderPage> createState() => _MealProviderPageState();
}

class _MealProviderPageState extends State<MealProviderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scrollbar(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              expandedHeight: context.mediaQuerySize.width / 2,
              title: Text(
                widget.mealProvider.name,
                style: TextStyle(
                  color: context.colorScheme.background,
                ),
              ),
              leading: IconButton.filledTonal(
                onPressed: () => context.pop(),
                style: IconButton.styleFrom(
                  backgroundColor: Colors.white.withOpacity(0.3),
                  foregroundColor: Colors.white,
                ),
                icon: const Icon(Icons.arrow_back_ios_new),
              ),
              backgroundColor: context.colorScheme.primary,
              flexibleSpace: FlexibleSpaceBar(
                background: Hero(
                  tag: widget.mealProvider.image,
                  child: Image.network(
                    '${LocalEndpoint.baseUrl}/${widget.mealProvider.image}',
                    fit: BoxFit.cover,
                    colorBlendMode: BlendMode.darken,
                    color: Colors.black38,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppSection(
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: const Icon(
                          Icons.verified_user,
                          color: Colors.orange,
                        ),
                        title: Text(
                          widget.mealProvider.name,
                          style: AppStyles.headlineH5,
                        ),
                      ),
                      Row(
                        children: [
                          RatingChip(
                            rating: 4.5,
                            side: BorderSide(color: context.colorScheme.surfaceVariant),
                          ),
                          const SizedBox(width: 10),
                          Chip(
                            shape: StadiumBorder(),
                            backgroundColor: context.colorScheme.primaryContainer.withOpacity(0.5),
                            side: BorderSide.none,
                            label: Row(
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.solidComment,
                                  color: context.colorScheme.primary,
                                  size: 20,
                                ),
                                const SizedBox(width: 5),
                                const Text(
                                  '999',
                                  style: AppStyles.bodySM,
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: () {},
                            icon: const FaIcon(FontAwesomeIcons.heart),
                            style: IconButton.styleFrom(
                              foregroundColor: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const _Divider(),
                  AppSection(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          'Popular',
                          style: AppStyles.bodyXL.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Column(
                        children: [
                          SingleChildScrollView(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                MealItem(
                                  widget.mealProvider.meals.first,
                                  onTap: () {},
                                ),
                                const SizedBox(width: 20),
                                MealItem(
                                  widget.mealProvider.meals.last,
                                  onTap: () {},
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const _Divider(),
                  AppSection(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          'Food',
                          style: AppStyles.bodyXL.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        separatorBuilder: (_, __) => const SizedBox(height: 20),
                        itemCount: widget.mealProvider.meals.length,
                        itemBuilder: (context, index) {
                          final meal = widget.mealProvider.meals[index];
                          return MealItem(
                            meal,
                            onTap: () {},
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
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class _Divider extends StatelessWidget {
  const _Divider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(thickness: 8, color: context.colorScheme.surfaceVariant);
  }
}

