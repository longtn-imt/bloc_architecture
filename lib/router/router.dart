import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../core/config/config.dart';
import '../core/config/injector.dart';
import '../module/auth/auth.dart';
import '../module/home/home.dart';

part 'router.g.dart';
part 'routing.dart';

@TypedGoRoute<InitalRoute>(path: '/')
class InitalRoute extends GoRouteData {
  @override
  String? redirect(BuildContext context, GoRouterState state) => const HomeRoute().location;
}

@TypedGoRoute<AuthRoute>(path: '/auth')
class AuthRoute extends GoRouteData {
  const AuthRoute();

  static final GlobalKey<NavigatorState> $parentNavigatorKey = rootNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) => const LoginScreen();
}

@TypedGoRoute<HomeRoute>(path: '/home')
class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomeScreen();
  }
}
