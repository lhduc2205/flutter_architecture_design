import 'package:architecture_designed/core/theme/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RatingChip extends Chip {
  RatingChip({
    super.key,
    required double rating,
    super.side,
  }) : super(
          shape: const StadiumBorder(),
          label: Row(
            children: [
              FaIcon(
                FontAwesomeIcons.solidStar,
                color: Colors.orangeAccent[200],
                size: 15,
              ),
              const SizedBox(width: 5),
              Text(
                rating.toString(),
                style: AppStyles.bodySM,
              ),
            ],
          ),
        );
}
