import 'package:customers_app/screens/tabs_screen/screens/taps.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import './api/firebase_api.dart';
import './screens/auth_screen/views/auth_screen.dart';
import './screens/auth_screen/providers/auth_provider.dart';
import './providers/user_provider.dart';
import './screens/splash_screen.dart';
import './screens/home_screen/views/home.dart';
import './screens/home_screen/provider/home_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseAPI().initPushAndLocalNotifications('test_topic');
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => UserProvider(),
        ),
      ],
      child: Consumer<UserProvider>(builder: (context, userConsumer, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: userConsumer.isAuth
              ? Builder(builder: (context) => const MyApp22())
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
        );
      }),
    );
  }
}
