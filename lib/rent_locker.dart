import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:inertia_flutter/defaultAppBar.dart';
import 'package:inertia_flutter/login.dart';
import 'package:inertia_flutter/success_locker.dart';

void main() {
  runApp(const RentLocker());
}

class RentLocker extends StatelessWidget {
  const RentLocker({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: DefaultAppBar(textTitle: 'Alugue um locker'),
        backgroundColor: const Color.fromRGBO(171, 168, 163, 60),
        // Cor de fundo da tela
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Selecione um locker:',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.normal,
                    color: Colors.white),
              ),
              const SizedBox(height: 16),
              // Espaçamento entre o texto e os quadrados
              buildBlackSquare('Av. Sapopemba, 415 - Vila Reg. Feijó', context),
              const SizedBox(height: 16),
              // Espaçamento entre os quadrados
              buildBlackSquare('R. Avaí, 358 - Mooca', context),
              const SizedBox(height: 16),
              buildBlackSquare('R. Martim Burchard, 112 - Brás', context),
              const SizedBox(height: 16),
              buildBlackSquare('Av. Paulista, 1972 - Bela Vista ', context),
              const SizedBox(height: 16),
              buildBlackSquare('Rua Pereira Barreto, 169 - Centro', context)
            ],
          ),
        ),
      ),
    );
  }

  Widget buildBlackSquare(String text, BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all<Color>(Colors.black),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Scaffold(body: SuccessLocker()),
            ),
          );
        },
        child: Container(
          width: double.infinity,
          height: 65,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(width: 10),
              SvgPicture.asset(
                "assets/storage_icon.svg",
                width: 24, // Largura da imagem
                height: 24, // Altura da imagem
                alignment: Alignment.centerLeft,
              ),
              const SizedBox(width: 20),
              Text(
                text,
                style: const TextStyle(color: Colors.white, fontSize: 14),
                // Estilo do texto
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ));
  }
}
