import 'package:auto_route/auto_route.dart';
import 'package:pixelfield/app_routes/app_routes.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashScreen.page, initial: true),
        AutoRoute(page: SignInScreen.page),
        AutoRoute(page: DashboardScreen.page),
      ];
}
