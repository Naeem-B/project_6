import 'package:flutter/material.dart';
import 'package:to_do/pages/add_page.dart';
import 'package:to_do/pages/home_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://dhepusgdonzcwlpaodpk.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRoZXB1c2dkb256Y3dscGFvZHBrIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDAzMDc2NTgsImV4cCI6MjAxNTg4MzY1OH0.KSMlqhhdmv1hjvDXH8sqIVDViW0Lcw0Zjo27LD-4_20',
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomePage());
  }
}
