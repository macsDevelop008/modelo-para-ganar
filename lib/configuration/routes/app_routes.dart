import 'package:go_router/go_router.dart';
import 'package:modelo_para_ganar/presentation/presentation.dart';

final appRouter = GoRouter(initialLocation: '/${LogInScreen.name}', routes: [
  //! LogIn
  GoRoute(
      path: '/${LogInScreen.name}',
      name: LogInScreen.name,
      builder: (context, state) => const LogInScreen()),

  //! Home
]);
