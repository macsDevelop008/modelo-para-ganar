import 'package:go_router/go_router.dart';
import 'package:modelo_para_ganar/configuration/configuration.dart';
import 'package:modelo_para_ganar/presentation/presentation.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
            //! Summary - tab
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
  redirect: (context, state) async {
    // Instancia shared preferences
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    // Obtener user id logeado
    final userIdentification =
        prefs.get(EnvironmentVariables.userIdentification);

    // Si se quiere ir al logIn y ya se ha iniciado seción
    if (state.uri.toString() == '/${LogInScreen.name}') {
      if (userIdentification != null && userIdentification != '') {
        return '/${SummaryTabSummayScreen.name}';
      }
    }
    // Si no, no redireccionar
    return null;
  },
);
