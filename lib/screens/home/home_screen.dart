import 'package:flutter/material.dart';
import 'package:prueba_tecnica_tl/screens/screens.dart';
import 'package:prueba_tecnica_tl/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const CustomDrawer(),
        appBar: customAppbar(context),
        body: Stack(
          children: [
            Positioned(
              bottom: 10,
              left: MediaQuery.of(context).size.width / 5,
              child: Image.asset(
                'assets/images/fondo.png',
                width: 250,
                colorBlendMode: BlendMode.hue,
              ),
            ),
            const DashboardScreen(),
            const Positioned(
              bottom: 20,
              // right: 20,
              left: 90,
              // width: double.infinity,
              child: Text(
                'Prueba tecnica : Alex avila',
                style: TextStyle(
                  fontSize: 12,
                  // color: theme,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
