import 'package:flutter/material.dart';
import 'package:inertia_flutter/login.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String textTitle;

  const DefaultAppBar({super.key, required this.textTitle});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Scaffold(body: LoginPage()),
              ));
        },
      ),
      title: Text(
        textTitle,
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.black, // Cor do fundo do AppBar
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
