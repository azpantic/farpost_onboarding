import 'package:flutter/material.dart';
import 'package:flutter_mobile_application_template/subpages/dialog_page.dart';
import 'package:flutter_mobile_application_template/subpages/settings_subpage.dart';

import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import 'controllers/main_controller.dart';
import 'i18n/strings.g.dart';
import 'pages/castom_page.dart';
import 'pages/home_page.dart';
import 'pages/profile_page.dart';

final MainController _controller = Get.find();
final _rootNavigationKey = GlobalKey<NavigatorState>();
final _shellNavigationKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _rootNavigationKey,
  initialLocation: '/home',
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigationKey,
      // ShellRoute показывает UI-оболочку вокруг соответствующего дочернего маршрута
      builder: (context, state, child) {
        // UI-оболочка - это Scaffold с NavigationBar
        return Obx(
          () => Scaffold(
            body: child,
            bottomNavigationBar: NavigationBar(
              selectedIndex: _controller.page(),
              // Используем tabs для создания NavigationBarDestination
              destinations: [
                NavigationDestination(
                  selectedIcon: const Icon(Icons.home),
                  icon: const Icon(Icons.home_outlined),
                  label: t.navbar.homepage,
                ),
                NavigationDestination(
                  selectedIcon: const Icon(Icons.library_books),
                  icon: const Icon(Icons.library_books_outlined),
                  label: t.navbar.castompage,
                ),
                NavigationDestination(
                  selectedIcon: const Icon(Icons.person_2),
                  icon: const Icon(Icons.person_2_outlined),
                  label: t.navbar.profile,
                )
              ],
              // Используем context.go для перехода к нужному маршруту при нажатии на вкладку
              onDestinationSelected: (index) {
                _controller.page(index);
                return context.go(
                  ['/home', '/custom', '/profile'][index],
                );
              },
            ),
          ),
        );
      },
      // Вложенные маршруты для каждой вкладки
      routes: [
        GoRoute(
          path: '/home',
          pageBuilder: (context, state) => NoTransitionPage<void>(
            key: state.pageKey,
            child: HomePage(),
          ),
          routes: [
            GoRoute(
              path: 'dialog',
              pageBuilder: (context, state) => NoTransitionPage<void>(
                key: state.pageKey,
                child: DialogPage(),
              ),
              routes: [],
            ),
          ],
        ),
        GoRoute(
          path: '/custom',
          pageBuilder: (context, state) => NoTransitionPage<void>(
            key: state.pageKey,
            child: CastomPage(),
          ),
          routes: [],
        ),
        GoRoute(
          path: '/profile',
          pageBuilder: (context, state) => NoTransitionPage<void>(
            key: state.pageKey,
            child: ProfilePage(),
          ),
          routes: [
            GoRoute(
              parentNavigatorKey: _rootNavigationKey,
              path: 'settings',
              pageBuilder: (context, state) => MaterialPage<void>(
                key: state.pageKey,
                child: SettingsSubpage(),
              ),
              routes: [],
            ),
          ],
        ),
      ],
    ),
  ],
);
