import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/temperature_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.read<TemperatureProvider>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Konversi Suhu'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 10),
            TextField(
              controller: provider.inputController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Masukkan suhu dalam Celsius',
              ),
              keyboardType: const TextInputType.numberWithOptions(
                signed: true,
                decimal: true,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => provider.konversiKeFahrenheit(),
                  child: const Text('°F'),
                ),
                ElevatedButton(
                  onPressed: () => provider.konversiKeKelvin(),
                  child: const Text('K'),
                ),
                ElevatedButton(
                  onPressed: () => provider.konversiKeReamur(),
                  child: const Text('°R'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Consumer hanya rebuild bagian teks hasil saja
            Consumer<TemperatureProvider>(
              builder: (context, temp, child) {
                return Text(
                  temp.satuanHasil.isEmpty
                      ? 'Hasil : -'
                      : 'Hasil : ${temp.hasil} ${temp.satuanHasil}',
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
                );
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
