import 'package:flutter/material.dart';

class SliverPage extends StatefulWidget {
  const SliverPage({Key? key}) : super(key: key);

  @override
  _SliverPageState createState() => _SliverPageState();
}

class _SliverPageState extends State<SliverPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              snap: false,
              floating: false,
              expandedHeight: 160,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text("Flutter es guay"),
                background: Image.network(
                  "https://images.unsplash.com/photo-1636622697498-8f60b9226824?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1170&q=80",
                  fit: BoxFit.cover,
                ),

              ),
            ),
            SliverList(
              
              delegate:SliverChildBuilderDelegate(
                (context,idx){
                  return ListTile(
                    title: Text("Elemento $idx"),
                  );
                },
                childCount: 15
              ) 
            )
          ],
        ),
      );
  }
}

