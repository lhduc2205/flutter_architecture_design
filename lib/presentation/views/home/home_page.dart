import 'package:architecture_designed/core/constants/endpoint.dart';
import 'package:architecture_designed/core/extensions/extension.dart';
import 'package:architecture_designed/core/theme/app_colors.dart';
import 'package:architecture_designed/core/theme/app_styles.dart';
import 'package:architecture_designed/gen/assets.gen.dart';
import 'package:architecture_designed/l10n/l10n.dart';
import 'package:architecture_designed/presentation/widgets/app_chip.dart';
import 'package:architecture_designed/router/router_path.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  factory HomePage.routeBuilder(_, GoRouterState state) {
    final title = state.extra as String?;
    return HomePage(
      title: title ?? 'Default',
      key: const Key('home'),
    );
  }

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Fetch data',
              style: AppStyles.mobileH6Light.copyWith(
                color: AppColors.seedPaletteNeutral40,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListTile(
              onTap: () {
                context.push(RouterPath.localApi);
              },
              tileColor: context.colorScheme.surfaceVariant,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              title: Text(
                'Local api',
                style: AppStyles.bodyLG.copyWith(fontWeight: FontWeight.w600),
              ),
              subtitle: Text(
                LocalEndpoint.mealProviders,
                style: AppStyles.bodySM.copyWith(fontWeight: FontWeight.w300),
              ),
              trailing: const FaIcon(FontAwesomeIcons.chevronRight, size: 18),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListTile(
              onTap: () {
                context.push(RouterPath.remoteApi);
              },
              tileColor: context.colorScheme.surfaceVariant,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              title: Text(
                'Remote api',
                style: AppStyles.bodyLG.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: Text(
                RemoteEndpoint.photos,
                style: AppStyles.bodySM.copyWith(fontWeight: FontWeight.w300),
              ),
              trailing: const FaIcon(FontAwesomeIcons.chevronRight, size: 18),
            ),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Method channel',
              style: AppStyles.mobileH6Light.copyWith(
                color: AppColors.seedPaletteNeutral40,
              ),
            ),
          ),
          const SizedBox(height: 5),
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                FilledButton.tonalIcon(
                  onPressed: () => context.push(RouterPath.battery),
                  icon: const FaIcon(
                    FontAwesomeIcons.batteryThreeQuarters,
                    size: 15,
                  ),
                  label: Text(context.l10n.battery),
                ),
                const SizedBox(width: 10),
                FilledButton.tonalIcon(
                  onPressed: () => context.push(RouterPath.battery),
                  icon: const FaIcon(
                    FontAwesomeIcons.wifi,
                    size: 15,
                  ),
                  label: const Text('Connection'),
                ),
                const SizedBox(width: 10),
                FilledButton.tonalIcon(
                  onPressed: () => context.push(RouterPath.battery),
                  icon: const FaIcon(
                    FontAwesomeIcons.wifi,
                    size: 15,
                  ),
                  label: const Text('Connection'),
                ),
                const SizedBox(width: 10),
                FilledButton.tonalIcon(
                  onPressed: () => context.push(RouterPath.battery),
                  icon: const FaIcon(
                    FontAwesomeIcons.wifi,
                    size: 15,
                  ),
                  label: const Text('Connection'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
