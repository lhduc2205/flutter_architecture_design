part of router;

class CustomSlideTransition extends CustomTransitionPage<void> {
  CustomSlideTransition({super.key, required super.child})
      : super(
          transitionDuration: const Duration(milliseconds: 250),
          transitionsBuilder: (_, animation, __, child) {
            return SlideTransition(
              position: animation.drive(
                Tween(
                  begin: const Offset(1, 0),
                  end: Offset.zero,
                ).chain(
                  CurveTween(curve: Curves.ease),
                ),
              ),
              child: child,
            );
          },
        );
}

class CustomFadeTransition extends CustomTransitionPage<void> {
  CustomFadeTransition({super.key, required super.child})
      : super(
          transitionDuration: const Duration(milliseconds: 150),
          reverseTransitionDuration: const Duration(milliseconds: 150),
          transitionsBuilder: (_, animation, __, child) {
            return FadeTransition(
              opacity: Tween(
                begin: 0.0,
                end: 1.0,
              ).animate(animation),
              child: child,
            );
          },
        );
}