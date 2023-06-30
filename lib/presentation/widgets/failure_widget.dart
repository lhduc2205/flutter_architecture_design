import 'package:architecture_designed/core/errors/failure.dart';
import 'package:architecture_designed/core/theme/app_colors.dart';
import 'package:architecture_designed/core/theme/app_styles.dart';
import 'package:architecture_designed/gen/assets.gen.dart';
import 'package:architecture_designed/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

class FailureWidget extends StatelessWidget {
  const FailureWidget(
    this.failure, {
    Key? key,
    required this.onRetry,
  }) : super(key: key);

  final Failure failure;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    late String titleMessage;
    late String descMessage;
    late String svgPath;
    late String lottiePath;

    switch (failure) {
      case LocalServerFailure():
        titleMessage = 'Internal Server Error';
        final endpoint = failure.properties['endpoint'];
        descMessage = '${context.l10n.cannotConnectTo('Local Server')}\n$endpoint';
        lottiePath = Assets.lotties.serverError.path;
      case NetworkFailure():
        titleMessage = 'Network Error';
        descMessage = "Can't connect to the Internet!";
        svgPath = Assets.images.vectors.connectionLost.path;
        lottiePath = Assets.lotties.noInternetConnection.path;
      default:
        titleMessage = 'Error';
        descMessage = 'Something went wrong!';
        svgPath = Assets.lotties.wrong.path;
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // SvgPicture.asset(
            //   svgPath,
            //   height: MediaQuery.of(context).size.width / 1.7,
            // ),
            Lottie.asset(
              lottiePath,
              height: MediaQuery.of(context).size.width / 1.7,
            ),
            const SizedBox(height: 20),
            Text(
              titleMessage,
              textAlign: TextAlign.center,
              style: AppStyles.headlineH6,
            ),
            const SizedBox(height: 10),
            Text(
              descMessage,
              textAlign: TextAlign.center,
              style: AppStyles.bodyLG.copyWith(
                color: AppColors.seedPaletteNeutral60,
              ),
            ),
            const SizedBox(height: 30),
            TextButton.icon(
              onPressed: onRetry,
              style: TextButton.styleFrom(
                backgroundColor: AppColors.seedPaletteRed60.withOpacity(0.2),
                foregroundColor: AppColors.seedPaletteRed60,
              ),
              icon: const Icon(Icons.refresh),
              label: Text(
                context.l10n.tryAgain,
                style: AppStyles.buttonLG,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
