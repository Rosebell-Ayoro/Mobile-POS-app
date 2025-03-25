import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart'; // This is the generated file
import 'screens/home_screen.dart';
import 'config/theme.dart';
import 'config/routes.dart';
import 'services/firebase_service.dart';

Future<void> setupFirestore() async {
  final firebaseService = FirebaseService();

  // This will check if data exists and only populate if empty
  await firebaseService.populateInitialData();
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    print('Firebase initialized successfully');

    // Set up initial data
    await setupFirestore();
  } catch (e) {
    print('Error initializing Firebase: $e');
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ODDSPRO AI',
      theme: AppTheme.lightTheme,
      routes: AppRoutes.routes,
      initialRoute: AppRoutes.home,
      debugShowCheckedModeBanner: false,
    );
  }
}
