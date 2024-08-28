import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:inertia_flutter/defaultAppBar.dart';
import 'package:inertia_flutter/login.dart'; // Certifique-se de que esse arquivo existe ou remova a importação se não for usado
import 'package:inertia_flutter/model/payment_card.dart';
import 'package:inertia_flutter/payment_options.dart';
import 'package:inertia_flutter/success_locker.dart';

class Payment extends StatelessWidget {
  final String lockerAddress;
  const Payment({super.key,required this.lockerAddress});

  @override
  Widget build(BuildContext context) {

   return Scaffold(
        appBar: const DefaultAppBar(textTitle: 'Pagamento'),
        backgroundColor: const Color.fromRGBO(171, 168, 163, 60),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 16),
              buildBlackSquare(lockerAddress, context),
              const SizedBox(height: 50),
              const Text(
                'R\$30,00',
                style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  color: Colors.lightGreenAccent,
                ),
              ),
              const SizedBox(height: 35),
              PaymentOptions(
                cards: [
                  PaymentCard(
                      brand: "MasterCard",
                      expDate: "12/26",
                      lastNumbers: "3489"),
                  PaymentCard(
                      brand: "MasterCard",
                      expDate: "08/25",
                      lastNumbers: "8663"),
                  PaymentCard(
                      brand: "MasterCard",
                      expDate: "01/27",
                      lastNumbers: "7439")
                ],
                onCardSelected: (selectedCard) {},
              ),
              const SizedBox(height: 70),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context,'/success'
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
              )
            ],
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
              width: 24,
              height: 24,
              alignment: Alignment.centerLeft,
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                text,
                style: const TextStyle(color: Colors.white, fontSize: 14),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
