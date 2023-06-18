import 'package:architecture_designed/presentation/bloc/meal_provider_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:architecture_designed/l10n/l10n.dart';

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
  void initState() {
    context.read<MealProviderBloc>().add(const GetAllMealProviderEvent());
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.hello;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: BlocBuilder<MealProviderBloc, MealProviderState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Text("Init"),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: () => const Center(child: Text("Error")),
            loaded: (mealProviders) {
              return ListView.builder(
                itemCount: mealProviders.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(mealProviders[index].name ?? "Default"),
                    trailing: Text(mealProviders[index].phoneNumber ?? "Default"),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
