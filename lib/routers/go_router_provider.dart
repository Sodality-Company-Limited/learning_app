import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning_app/pages/dio_page.dart';
import 'package:learning_app/pages/post_page.dart';
import 'package:learning_app/pages/based_page.dart';
import 'package:learning_app/pages/line_login_page.dart';
import 'package:learning_app/pages/event_page.dart';
import 'package:learning_app/routers/named_route.dart';
import '../pages/home_page.dart';
import '../pages/login_page.dart';

final intentionLocProvider = StateProvider<String>((ref) => '/');
final goRouterProvider = Provider<GoRouter>((ref) {
  final initialLocation = ref.watch(intentionLocProvider);
  return GoRouter(
      debugLogDiagnostics: true,
      initialLocation: initialLocation,
      routes: [
        GoRoute(
          path: '/',
          name: "home",
          builder: (context, state) {
            return MediaQuery(
                data: MediaQuery.of(context)
                    .copyWith(textScaler: const TextScaler.linear(1.0)),
                child: MainPage());
          },
        ),
        GoRoute(
          path: '/login',
          builder: (context, state) {
            return MediaQuery(
                data: MediaQuery.of(context)
                    .copyWith(textScaler: const TextScaler.linear(1.0)),
                child: const LoginPage());
          },
        ),
        GoRoute(
          path: '/home',
          builder: (context, state) {
            return MediaQuery(
                data: MediaQuery.of(context)
                    .copyWith(textScaler: const TextScaler.linear(1.0)),
                child: const HomePage());
          },
        ),
        GoRoute(
          path: '/post',
          builder: (context, state) {
            return MediaQuery(
                data: MediaQuery.of(context)
                    .copyWith(textScaler: const TextScaler.linear(1.0)),
                child: const PostPage());
          },
        ),
        GoRoute(
          path: '/line',
          builder: (context, state) {
            return MediaQuery(
                data: MediaQuery.of(context)
                    .copyWith(textScaler: const TextScaler.linear(1.0)),
                child: LineLoginPage());
          },
        ),
        GoRoute(
          path: '/event',
          builder: (context, state) {
            return MediaQuery(
                data: MediaQuery.of(context)
                    .copyWith(textScaler: const TextScaler.linear(1.0)),
                child: EventGridPage());
          },
        ),
        GoRoute(
          path: '/dio',
          builder: (context, state) {
            return MediaQuery(
                data: MediaQuery.of(context)
                    .copyWith(textScaler: const TextScaler.linear(1.0)),
                child: DioPage());
          },
        ),
      ]);
});
