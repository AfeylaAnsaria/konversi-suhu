import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'providers/temperature_provider.dart';
import 'screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyC7pSjKczyr4gyGp3Z7tw-r8wfiJ3AoJZg",
      authDomain: "konversi-suhu-auth.firebaseapp.com",
      projectId: "konversi-suhu-auth",
      storageBucket: "konversi-suhu-auth.firebasestorage.app",
      messagingSenderId: "122442000507",
      appId: "1:122442000507:android:3ffa72a484115e23c55ade",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TemperatureProvider(),
      child: MaterialApp(
        title: 'Konversi Suhu',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const LoginScreen(),
      ),
    );
  }
}
