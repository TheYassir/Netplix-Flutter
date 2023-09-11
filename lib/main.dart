import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
        scaffoldBackgroundColor: Colors.black,
        colorScheme: ColorScheme.fromSeed(
            brightness: Brightness.dark, seedColor: Colors.black),
      ),
      home: MyHomePage(title: 'Netflix'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key, required this.title});

  final String title;

  final List<String> images = List.filled(40, "https://picsum.photos/500/750");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.menu),
            tooltip: 'Menu Snackbar',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('This is a Menu')));
            },
          ),
          // title: Image.asset(
          //   "assets/logo.png",
          //   width: 250,
          //   height: 75,
          //   fit: BoxFit.contain,
          // ),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              tooltip: 'Seach Snackbar',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('This is a Seach')));
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  "Continuer de regarder",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
              ),
              SizedBox(
                height: 300,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: images.length,
                  itemBuilder: ((BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Image.network(
                        images[index] +
                            "?${Random().nextDouble()}", // l'ajout du random permet de contourner le cache automatique,
                        width: 175,
                        height: 300,
                        fit: BoxFit.cover,
                      ),
                    );
                  }),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  "On pense que vous aimerez",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
              ),
              SizedBox(
                height: 300,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: 20,
                  itemBuilder: ((BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8),
                      child: Image.network(
                        images[index] +
                            "?${Random().nextDouble()}", // l'ajout du timestamp permet (un peu) de contourner le cache automatique
                        width: 175,
                        height: 300,
                        fit: BoxFit.cover,
                      ),
                    );
                  }),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  "Recommandé pour vous",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
              ),
              SizedBox(
                height: 300,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: 20,
                  itemBuilder: ((BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8),
                      child: Image.network(
                        images[index] +
                            "?${Random().nextDouble()}", // l'ajout du timestamp permet (un peu) de contourner le cache automatique,
                        width: 175,
                        height: 300,
                        fit: BoxFit.cover,
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        ));
  }
}
