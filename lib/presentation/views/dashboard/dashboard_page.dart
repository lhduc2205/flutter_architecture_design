import 'package:architecture_designed/l10n/l10n.dart';
import 'package:architecture_designed/presentation/views/dashboard/cubit/dashboard_page_index_cubit.dart';
import 'package:architecture_designed/presentation/widgets/active_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:architecture_designed/presentation/views/home/home_page.dart';
import 'package:architecture_designed/presentation/views/setting/setting_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key, required this.child}) : super(key: key);

  factory DashboardPage.routeBuilder(_, GoRouterState state, Widget child) {
    return DashboardPage(
      key: const Key('dashboard'),
      child: child,
    );
  }

  final Widget child;

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {

  @override
  Widget build(BuildContext context) {
    final icons = <String, IconData> {
      context.l10n.home: Icons.home,
      context.l10n.settings: Icons.settings,
    };

    return BlocProvider(
      create: (_) => DashboardPageIndexCubit(),
      child: Scaffold(
        backgroundColor: const Color(0xFFF3F3F3),
        body: widget.child,
        bottomNavigationBar: BlocBuilder<DashboardPageIndexCubit, int>(
          builder: (context, pageIndex) {
            return BottomAppBar(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(icons.length, (index) {
                  return ActiveIconButton(
                    icon: icons.values.elementAt(index),
                    label: icons.keys.elementAt(index),
                    isSelected: pageIndex == index,
                    onPressed: () {
                      context.read<DashboardPageIndexCubit>().update(index);
                      switchPage(index);
                    },
                  );
                }),
              ),
            );
          },
        ),
      ),
    );
  }

  void switchPage(int index) {
    switch (index) {
      case 0:
        context.go('/home', extra: 'Home screen');
      case 1:
        context.go('/setting');
    }
  }
}
