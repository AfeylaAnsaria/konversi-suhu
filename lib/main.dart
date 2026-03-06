import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Konversi Suhu',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Konversi Suhu'),
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
  final TextEditingController inputController = TextEditingController();
  double hasil = 0;
  String satuanHasil = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 10),
            TextField(
              controller: inputController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Masukkan suhu dalam Celsius',
              ),
              keyboardType: TextInputType.numberWithOptions(
                signed: true,
                decimal: true,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    double celsius = double.parse(inputController.text);
                    setState(() {
                      hasil = celsius * 9 / 5 + 32;
                      satuanHasil = 'Fahrenheit';
                    });
                  },
                  child: const Text('°F'),
                ),
                ElevatedButton(
                  onPressed: () {
                    double celsius = double.parse(inputController.text);
                    setState(() {
                      hasil = celsius + 273.15;
                      satuanHasil = 'Kelvin';
                    });
                  },
                  child: const Text('K'),
                ),
                ElevatedButton(
                  onPressed: () {
                    double celsius = double.parse(inputController.text);
                    setState(() {
                      hasil = celsius * 4 / 5;
                      satuanHasil = 'Reamur';
                    });
                  },
                  child: const Text('°R'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              satuanHasil.isEmpty ? 'Hasil : -' : 'Hasil : $hasil $satuanHasil',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 15,
                background: Paint()
                  ..strokeWidth = 25.0
                  ..color = Colors.lightGreen
                  ..style = PaintingStyle.stroke
                  ..strokeJoin = StrokeJoin.round,
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
