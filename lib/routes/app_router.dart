// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:navigation/routes/app_routes.dart';

// import 'package:navigation/screens/home_screen.dart';
// import 'package:navigation/screens/login_screen.dart';
// import 'package:navigation/screens/more_screen.dart';
// import 'package:navigation/screens/profile_screen.dart';
// import 'package:navigation/screens/settings_screen.dart';

// class AppRouter {
//   static final GoRouter router = GoRouter(
//     routes: <RouteBase>[
//       GoRoute(
//         path: '/',
//         builder: (BuildContext context, GoRouterState state) {
//           return const LoginScreen();
//         },
//         routes: <RouteBase>[
//           GoRoute(
//             path: Routes.HomeScreen,
//             builder: (BuildContext context, GoRouterState state) {
//               String isLogin = state.extra.toString();
//               return HomeScreen(isLogin: isLogin);
//             },
//             routes: <RouteBase>[
//               GoRoute(
//                 path: Routes.ProfileScreen,
//                 builder: (BuildContext context, GoRouterState state) {
//                   return const ProfileScreen();
//                 },
//                 routes: <RouteBase>[
//                   GoRoute(
//                     path: '/settings',
//                     builder: (BuildContext context, GoRouterState state) {
//                       return const SettingsScreen();
//                     },
//                     routes: <RouteBase>[
//                       GoRoute(
//                         path: '/more',
//                         builder: (BuildContext context, GoRouterState state) {
//                           return const MoreScreen();
//                         },
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ],
//       ),
//     ],
//     // errorPageBuilder: (context, state) {
//     //   return MaterialPage(child: Center(child: Text("Page not Found")));
//     // },
//   );
// }

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:navigation/routes/app_routes.dart';

import 'package:navigation/screens/home_screen.dart';
import 'package:navigation/screens/login_screen.dart';
import 'package:navigation/screens/more_screen.dart';
import 'package:navigation/screens/product_screen.dart';
import 'package:navigation/screens/profile_screen.dart';
import 'package:navigation/screens/settings_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const LoginScreen();
        },

        routes: <RouteBase>[
          GoRoute(
            path: '/product',
            builder: (BuildContext context, GoRouterState state) {
              return const ProductScreen();
            },
          ),
          GoRoute(
            path: 'profile',
            builder: (BuildContext context, GoRouterState state) {
              final data = state.extra as String;
              return ProfileScreen(data: data);
            },
            routes: <RouteBase>[
              GoRoute(
                path: 'settings',
                builder: (BuildContext context, GoRouterState state) {
                  return const SettingsScreen();
                },
                routes: <RouteBase>[
                  GoRoute(
                    path: 'more',
                    builder: (BuildContext context, GoRouterState state) {
                      return const MoreScreen();
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
    // errorBuilder:
    errorPageBuilder: (context, state) {
      return MaterialPage(child: Text('something went wrong'));
    },
  );
}
