import 'package:architecture_designed/core/constants/endpoint.dart';
import 'package:architecture_designed/core/extensions/extension.dart';
import 'package:architecture_designed/core/theme/app_colors.dart';
import 'package:architecture_designed/core/theme/app_styles.dart';
import 'package:architecture_designed/domain/entities/meal.entity.dart';
import 'package:architecture_designed/presentation/widgets/network_image.dart';
import 'package:flutter/material.dart';

class MealItem extends StatelessWidget {
  const MealItem(
    this.meal, {
    Key? key,
    required this.onTap,
    this.hasTrailingSpacer = false,
    this.trailing,
  }) : super(key: key);

  final Meal meal;
  final VoidCallback onTap;
  final bool hasTrailingSpacer;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              Container(
                width: context.mediaQuerySize.width / 4,
                height: context.mediaQuerySize.width / 4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Hero(
                  tag: meal.image,
                  child: AppNetworkImage(
                    url: '${LocalEndpoint.baseUrl}/${meal.image}',
                  ),
                ),
              ),
              Hero(
                tag: meal.image + meal.name,
                child: CircleAvatar(
                  backgroundColor: AppColors.seedPaletteRed60,
                  foregroundColor: Colors.white,
                  child: Text(
                    '-50%',
                    style: AppStyles.bodySM.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                meal.name,
                style: AppStyles.bodyXL,
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Text(
                    meal.price.toUSD,
                    style: AppStyles.bodyXL.copyWith(
                      color: context.colorScheme.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    meal.price.toUSD,
                    style: AppStyles.bodySM.copyWith(
                      fontWeight: FontWeight.w300,
                      decoration: TextDecoration.lineThrough,
                      decorationColor: context.colorScheme.onBackground.withOpacity(0.8),
                    ),
                  ),
                ],
              ),
            ],
          ),
          if (hasTrailingSpacer)
          const Spacer(),

          if (trailing != null)
            trailing!
        ],
      ),
    );
  }
}
