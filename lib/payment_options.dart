import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:inertia_flutter/model/payment_card.dart';

class PaymentOptions extends StatefulWidget {
  final List<PaymentCard> cards;
  final ValueChanged<PaymentCard?> onCardSelected;

  const PaymentOptions(
      {super.key, required this.cards, required this.onCardSelected});

  @override
  _PaymentOptionsState createState() => _PaymentOptionsState();
}

class _PaymentOptionsState extends State<PaymentOptions> {
  PaymentCard? _selectedCard;

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black, // Fundo preto
        borderRadius: BorderRadius.circular(12.0), // Bordas arredondadas
      ),
      child: Column(
        children: widget.cards.map((card) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(8.0), // Bordas arredondadas
            ),
            child: RadioListTile<PaymentCard>(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
              controlAffinity: ListTileControlAffinity.trailing, // Check na direita
              title: Row(
                children: [
                  SvgPicture.asset(
                    'assets/mastercard_icon.svg', // Adicione a extensão do arquivo SVG
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 30.0), // Espaço entre a imagem e o texto
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${card.brand} - ${card.lastNumbers}',
                            style: const TextStyle(color: Colors.white, fontSize: 15), // Texto branco
                            overflow: TextOverflow.ellipsis, // Evita que o texto ultrapasse os limites
                          ),
                          Text(
                              card.expDate,
                            style: const TextStyle(fontSize: 12, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              value: card, // Usando o número do cartão como valor
              groupValue: _selectedCard,
              onChanged: (PaymentCard? value) {
                setState(() {
                  _selectedCard = value;
                });
                widget.onCardSelected(value); // Notificar sobre a seleção
              },
            ),
          );
        }).toList(),
      ),
    );
  }

}
