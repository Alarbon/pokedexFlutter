import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({
    super.key,
    required this.topPadding,
  });

  final double topPadding;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              "assets/imagenCarga.png",
              fit: BoxFit.cover,
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: topPadding),
                  child: const Center(
                    child: Text(
                      "LOADING POKEDEX",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(20),
                  child: LinearProgressIndicator(
                    minHeight: 20,
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
