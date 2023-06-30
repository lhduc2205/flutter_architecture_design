import 'package:architecture_designed/core/constants/endpoint.dart';
import 'package:architecture_designed/core/extensions/extension.dart';
import 'package:architecture_designed/core/theme/app_colors.dart';
import 'package:architecture_designed/core/theme/app_styles.dart';
import 'package:architecture_designed/domain/entities/meal.entity.dart';
import 'package:architecture_designed/gen/assets.gen.dart';
import 'package:architecture_designed/presentation/widgets/counter_button.dart';
import 'package:architecture_designed/presentation/widgets/rating_chip.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class MealDetailPage extends StatefulWidget {
  const MealDetailPage({
    Key? key,
    required this.meal,
  }) : super(key: key);

  factory MealDetailPage.routeBuilder(_, GoRouterState state) {
    Meal meal = state.extra! as Meal;
    return MealDetailPage(
      key: const Key('meal_detail_page'),
      meal: meal,
    );
  }

  final Meal meal;

  @override
  State<MealDetailPage> createState() => _MealDetailPageState();
}

class _MealDetailPageState extends State<MealDetailPage> {
  int orderQuantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            Container(
              constraints: BoxConstraints(
                minWidth: context.mediaQuerySize.width / 3,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Total',
                    style: AppStyles.bodyLG,
                  ),
                  Text(
                    (widget.meal.price * orderQuantity).toUSD,
                    style: AppStyles.headlineH6.copyWith(
                      color: context.colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: FilledButton(
                onPressed: () {},
                style: FilledButton.styleFrom(minimumSize: const Size.fromHeight(60)),
                child: Text(
                  'Add to cart',
                  style: AppStyles.bodyLG.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: context.mediaQuerySize.width,
              color: context.colorScheme.surfaceVariant.withOpacity(0.4),
              padding: const EdgeInsets.all(10),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Hero(
                    tag: widget.meal.image,
                    child: Image.network(
                      '${LocalEndpoint.baseUrl}/${widget.meal.image}',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).padding.top,
                    left: 10,
                    child: IconButton.filled(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back_ios_new),
                      style: IconButton.styleFrom(
                        backgroundColor: context.colorScheme.background,
                        foregroundColor: context.colorScheme.onBackground,
                        padding: const EdgeInsets.all(12),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 20,
                    bottom: 20,
                    child: Hero(
                      tag: widget.meal.image + widget.meal.name,
                      child: const CircleAvatar(
                        radius: 30,
                        backgroundColor: AppColors.seedPaletteRed60,
                        foregroundColor: Colors.white,
                        child: Text('-50%'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.meal.name,
                        style: AppStyles.headlineH5,
                      ),
                      // IconButton.filled(
                      //   onPressed: () {},
                      //   icon: const FaIcon(FontAwesomeIcons.solidHeart),
                      //   style: IconButton.styleFrom(
                      //     backgroundColor: context.colorScheme.surfaceVariant.withOpacity(0.5),
                      //     foregroundColor: Colors.redAccent,
                      //     padding: const EdgeInsets.all(12),
                      //   ),
                      // ),
                      RatingChip(
                        rating: 4.5,
                        side: BorderSide(color: context.colorScheme.surfaceVariant),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        widget.meal.price.toUSD,
                        style: AppStyles.headlineH5.copyWith(
                          color: context.colorScheme.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        widget.meal.price.toUSD,
                        style: AppStyles.bodyLG.copyWith(
                          fontWeight: FontWeight.w200,
                          color: context.colorScheme.secondary,
                          decoration: TextDecoration.lineThrough,
                          decorationColor: context.colorScheme.secondary.withOpacity(0.4),
                        ),
                      ),
                      const Spacer(),
                      CounterButton(
                        initial: orderQuantity,
                        min: 1,
                        max: 20,
                        onCallback: (value) {
                          setState(() {
                            orderQuantity = value;
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  Text(
                    'Description',
                    style: AppStyles.bodyXL.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    widget.meal.description,
                    style: AppStyles.bodyLG.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
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
