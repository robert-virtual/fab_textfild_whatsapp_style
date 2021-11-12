import 'package:flutter/material.dart';
import 'package:tests_app/pages/favorite_page.dart';
import 'package:tests_app/pages/multi_selection.dart';
import 'package:tests_app/pages/recargas.dart';
import 'package:tests_app/pages/sliver_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: current,
        children: const [RecargasPage(),MultiSelectionPage(), SliverPage()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: current,
        onTap: (i)=>setState(() {
          current = i;
        }),
        items: const [
          BottomNavigationBarItem(label: "recargas", icon: Icon(Icons.power)),
          BottomNavigationBarItem(label: "paquetes", icon: Icon(Icons.padding)),
          BottomNavigationBarItem(label: "sliver", icon: Icon(Icons.list)),
        ],
      ),
    );
  }
}
