import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';  // Ensure this import is correct.

Future<void> initializeFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class DefaultFirebaseOptions {
  static var currentPlatform;
}
