import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'item_view_model.dart';
import 'home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ItemViewModel()..fetchItems(),
      child: MaterialApp(
        title: 'CRUD API App',
        theme: ThemeData(primarySwatch: Colors.indigo),
        home: const HomeScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
