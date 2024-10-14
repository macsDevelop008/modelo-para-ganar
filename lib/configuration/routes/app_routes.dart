import 'package:go_router/go_router.dart';
import 'package:modelo_para_ganar/presentation/presentation.dart';

final appRouter = GoRouter(
  initialLocation: '/${LogInScreen.name}',
  routes: [
    //! LogIn
    GoRoute(
      path: '/${LogInScreen.name}',
      name: LogInScreen.name,
      builder: (context, state) => const LogInScreen(),
    ),
    //! Base Internal
    ShellRoute(
      builder: (context, state, child) {
        return BaseInternalScreen(
          child: child,
        );
      },
      routes: [
        //! Summary - Base
        ShellRoute(
          builder: (context, state, child) {
            return SummaryBaseScreen(child: child);
          },
          routes: [
            //! Resumen
            GoRoute(
              path: '/${SummaryTabSummayScreen.name}',
              name: SummaryTabSummayScreen.name,
              builder: (context, state) => const SummaryTabSummayScreen(),
            ),
            //! Autoejecucion
            //! Radiografía
          ],
        ),
        //! Bonus
        GoRoute(
          path: '/${BonusScreen.name}',
          name: BonusScreen.name,
          builder: (context, state) => const BonusScreen(),
        ),
        //! SelfExecuting
        GoRoute(
          path: '/${SelfExecutingScreen.name}',
          name: SelfExecutingScreen.name,
          builder: (context, state) => const SelfExecutingScreen(),
        ),
      ],
    ),
  ],
);
