import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:inertia_flutter/defaultAppBar.dart';
import 'package:inertia_flutter/login.dart';
import 'package:inertia_flutter/rent_locker.dart';

void main() {
  runApp(const SuccessLocker());
}

class SuccessLocker extends StatelessWidget {
  const SuccessLocker({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: const Color.fromRGBO(171, 168, 163, 60),
            // Cor de fundo da tela
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/check_icon.svg",
                    alignment: Alignment.center,
                  ),
                  const Text(
                    'Sucesso!',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  const Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                          textAlign: TextAlign.center,
                          'O seu locker foi reservado na localização escolhida!',
                          style: TextStyle(
                            fontSize: 18,
                          ))),
                  const SizedBox(height: 70),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Scaffold(body: RentLocker()),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 32, vertical: 12),
                          backgroundColor: Colors.lightGreen,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        child: const Text(
                          'Acesse seu locker!',
                          style: TextStyle(color: Colors.black, fontSize: 25),
                        )),
                  ),
                ],
              ),
            )));
  }
}
