// ignore_for_file: camel_case_types
import 'package:app_vault/apps/android_splash_screen/lib/main.dart';
import 'package:app_vault/apps/material_3_demo/main.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Vault | Tu app multi-aplicaciones',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'App Vault | Tu app multi-aplicaciones'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                //header
                const Text(
                  "Selecciona la aplicación que más te gusta:",
                  textAlign: TextAlign.start,
                ),
                // Cards
                cardCompose(context),
                //Footer
                const Text("Version 1.0.1")
              ],
            ),
          ),
        ));
  }
}

Widget cardCompose(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    mainAxisSize: MainAxisSize.min,
    children: [
      cardElement(
          onTap: () {
            GoRouter.of(context).go('/home');
          },
          title: "Plantilla de juegos",
          imagePath: 'lib/assets/dados.jpg',
          description:
              "Una plantilla diseñada para probar el desarrollo de videojuegos\ncon Flutter."),
      const SizedBox(width: 25,),
      cardElement(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context)=> const MySplashHomePage(title: "Android Center"))
            );
          },
          title: "Android Splash Screen",
          imagePath: 'lib/assets/androidIcon.png',
          description:
              "Un ejemplo de aplicación básica de Flutter, incorporando\nun contador y un Clipper."),
      const SizedBox(width: 25,),
      cardElement(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context)=> const App())
            );
          },
          title: "Material You Demostration",
          imagePath: 'lib/assets/material_you.jpeg',
          description:
              "Conoce las novedades del lenguaje de diseño de Google\nintegrado desde Android 12"),
    ],
  );
}

class cardElement extends StatefulWidget {
  const cardElement(
      {super.key,
      required this.onTap,
      required this.title,
      required this.imagePath,
      required this.description});

  final String title;
  final String imagePath;
  final String description;
  final VoidCallback onTap;

  @override
  State<cardElement> createState() => _cardElementState();
}

class _cardElementState extends State<cardElement> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 400,
              height: 200,
                child: Image.asset(
                widget.imagePath,
                fit: BoxFit.cover,
                scale: 2.5,
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            Text(
              widget.title,
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(widget.description),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              children: [
                FilledButton(
                    onPressed: widget.onTap,
                    child: const Row(
                      children: [
                        Icon(Icons.gamepad),
                        SizedBox(width: 8),
                        Text("Probar")
                      ],
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
