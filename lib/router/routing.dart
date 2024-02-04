part of 'router.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey();

final RouteObserver<ModalRoute<dynamic>> rootRouteObserver = RouteObserver<ModalRoute<dynamic>>();

GoRouter goRouterConfig = GoRouter(
  debugLogDiagnostics: Config.enableNavigatorObserverLog,
  navigatorKey: rootNavigatorKey,
  observers: <NavigatorObserver>[rootRouteObserver],
  initialLocation: const AuthRoute().location,
  refreshListenable: getIt.get<AuthBloc>().userRefresh(),
  routes: $appRoutes,
  redirect: (BuildContext context, GoRouterState state) async {
    final bool isAuthPath = state.fullPath?.startsWith(const AuthRoute().location) ?? false;
    final bool isAuthenticated = getIt.get<AuthBloc>().state.isAuthenticated;

    if (!isAuthenticated && !isAuthPath) {
      return const AuthRoute().location;
    }
    if (isAuthenticated && isAuthPath) {
      return const HomeRoute().location;
    }

    return null;
  },
);
