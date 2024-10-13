import 'package:go_router/go_router.dart';
import 'package:modelo_para_ganar/presentation/presentation.dart';

final appRouter = GoRouter(initialLocation: '/${HomeScreen.name}', routes: [
  //! LogIn
  GoRoute(
      path: '/${LogInScreen.name}',
      name: LogInScreen.name,
      builder: (context, state) => const LogInScreen()),

  //! Home
  GoRoute(
      path: '/${HomeScreen.name}',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen()),
]);
