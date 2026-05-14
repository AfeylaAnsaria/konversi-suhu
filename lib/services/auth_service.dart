import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String?> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') return 'Email tidak ditemukan';
      if (e.code == 'wrong-password') return 'Password salah';
      if (e.code == 'invalid-email') return 'Format email tidak valid';
      if (e.code == 'invalid-credential') return 'Email atau password salah';
      return e.message ?? 'Terjadi kesalahan';
    } catch (e) {
      return 'Terjadi kesalahan: $e';
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
  }
}
