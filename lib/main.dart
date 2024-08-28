import 'package:flutter/material.dart';
import 'package:inertia_flutter/login.dart';
import 'package:inertia_flutter/payment.dart';
import 'package:inertia_flutter/rent_locker.dart';
import 'package:inertia_flutter/success_locker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/rent_locker': (context) => const RentLocker(),
        '/success' : (context) => const SuccessLocker(),
      },
        onGenerateRoute: (settings) {
          if (settings.name == '/payment') {
            final args = settings.arguments as String;
            return MaterialPageRoute(
              builder: (context) {
                return Payment(lockerAddress: args);
              },
            );
          }
          assert(false, 'Need to implement ${settings.name}');
          return null;
        }

    );
  }
}
