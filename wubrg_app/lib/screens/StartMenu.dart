import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wubrg_app/themes/theme.dart' as Theme;

import '../providers/card_state.dart';

class StartMenu extends StatelessWidget {
  const StartMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final cardState = Provider.of<CardState>(context);
    return Scaffold(
      backgroundColor: Theme.Colores.loginGradientEnd,
      appBar: AppBar(
        backgroundColor: Theme.Colores.primaryColor,
        title: const Text("WURB Drafter", style: TextStyle(fontSize: 30, color: Colors.white)),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Theme.Colores.loginGradientStart,
              Theme.Colores.loginGradientEnd
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              "assets/pato.png",
            ),
            OutlinedButton(
              style: const ButtonStyle(
                padding: MaterialStatePropertyAll(EdgeInsets.all(24)),
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                ),
              ),
              onPressed: () async {
                await cardState.generateRandomCardSet();
                Navigator.pushNamed(context, "/drafter");
              },
              child: const Text(
                "Start Drafting",
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class StartMenu extends StatelessWidget {
//   const StartMenu({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue),
//         useMaterial3: false,
//       ),
//       home: const MyHomePage(title: 'StartMenu'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.primary,
//         title: Text(widget.title),
//       ),
//       body: Column(
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               children: <Widget>[
//                 const SizedBox(height: 100), // Add a SizedBox for a bigger gap
//                 const Align(
//                   alignment: Alignment.center,
//                   child: Text(
//                     'WUBRG',
//                     style: TextStyle(fontSize: 80),
//                   ),
//                 ),
//                 const SizedBox(height: 100),
//                 TextButton(
//                   onPressed: () {
//                     // Navigate to the GamePhrase widget when the button is pressed
//                     Navigator.pushNamed(context, "start-game");
//                   },
//                   child: const Text(
//                     'Start Playing',
//                     style: TextStyle(fontSize: 50),
//                   ),
//                 ),
//                 const SizedBox(height: 50),
//                 const Align(
//                   alignment: Alignment.center,
//                   child: Text(
//                     'Rules',
//                     style: TextStyle(fontSize: 30),
//                   ),
//                 ),
//                 const SizedBox(height: 230),
//                 const Align(
//                   alignment: Alignment.center,
//                   child: Text(
//                     'Terms & policy',
//                     style: TextStyle(fontSize: 10),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
