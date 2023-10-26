// ignore_for_file: unused_import

import 'package:customers_app/screens/tabs_screen/views/tabs_screen.dart';
import 'package:customers_app/theme/customers_theme.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import './api/firebase_api.dart';
import './screens/auth_screen/views/auth_screen.dart';
import './screens/auth_screen/providers/auth_provider.dart';
import './providers/user_provider.dart';
import './screens/splash_screen.dart';
import './screens/tabs_screen/providers/tabs_provider.dart';
import './screens/tabs_screen/screens/home_screen/views/home_screen.dart';
import './screens/tabs_screen/screens/home_screen/providers/home_provider.dart';
import './screens/search_screen/views/search_screen.dart';
import './screens/product_item_details_screen/views/product_item_details_screen.dart';
import './screens/product_item_details_screen/providers/product_item_details_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await dotenv.load(fileName: 'lib/.env');
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // return MaterialApp(home: TabsScreen(),);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => UserProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => TabsProvider(),
        ),
      ],
      child: Consumer<UserProvider>(builder: (context, userConsumer, _) {
        return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          locale: const Locale('ar', 'YE'),
          supportedLocales: const [
            Locale('ar', 'YE'),
          ],
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          home: userConsumer.isAuth
              ? Builder(builder: (context) => TabsScreen())
              : FutureBuilder(
                  future: Future.delayed(const Duration(milliseconds: 2000),
                      () => userConsumer.tryAutoLogin()),
                  builder: (ctx, authResultSnapshot) =>
                      authResultSnapshot.connectionState ==
                              ConnectionState.waiting
                          ? const SplashScreen()
                          : ChangeNotifierProvider.value(
                              value: AuthProvider(), child: const AuthScreen()),
                ),
          routes: {
            SearchScreen.routeName: (ctx) => const SearchScreen(),
            ProductItemDetailsScreen.routeName: (ctx) =>
                ChangeNotifierProvider.value(
                  value: ProductItemDetailsProvider(),
                  child: const ProductItemDetailsScreen(),
                ),
          },
        );
      }),
    );
  }
}
