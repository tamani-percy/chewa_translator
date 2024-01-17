import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:translator/translator.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    systemNavigationBarColor: Colors.black,
  ));
  runApp(const MyHomePage(title: 'Chewa Translator'));
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String translatedText = 'Translation';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
              leading: const Icon(Icons.translate, color: Colors.orange),
              title: const Text('Chewa Translator'),
              backgroundColor: Colors.black,
              elevation: 0.0),
          body: Card(
            margin: const EdgeInsets.all(12),
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                const Text('English (US)'),
                const SizedBox(height: 8),
                TextField(
                  style: const TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: const InputDecoration(hintText: 'Enter text'),
                  onChanged: (text) async {

                    final translation = await text.translate(
                      from: 'en',
                      to: 'ny'
                    );
                    setState(() {
                      translatedText = translation.text;
                    });
                  },
                ),
                const Divider(height: 32),
                Text(
                    translatedText,
                    style: const TextStyle(
                        fontSize: 36,
                        color: Colors.lightBlueAccent,
                        fontWeight: FontWeight.bold))
              ],
            ),
          ) // This trailing comma makes auto-formatting nicer for build methods.
          ),
    );
  }
}
