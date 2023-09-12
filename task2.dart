// ignore_for_file: unnecessary_string_interpolations, dead_code

import 'package:flutter/material.dart';

void main() {
  runApp(ListViewApp());
}

// ignore: use_key_in_widget_constructors
class ListViewApp extends StatelessWidget {
  final List<String> entries = ['Idea', 'Food', 'Work', 'Sport', 'Music'];
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chose Activity',
      routes: {
        '/detail': (context) => DetailScreen(),
      },
      home: Scaffold(
        body: SafeArea(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Choose activity',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: entries.length,
                    itemBuilder: (BuildContext context, index) {
                      index += 0;
                      double price = index * 2;
                      return Container(
                        margin: const EdgeInsets.all(8),
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(color: Colors.grey.shade200),
                        child: ListTile(
                          title: Text(
                            '${entries[index]}',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text("price ($price)USDT"),
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              '/detail',
                              arguments: entries[index],
                            );
                          },
                          leading: const Icon(
                            Icons.add_a_photo,
                            color: Colors.blueAccent,
                          ),
                          trailing: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.chevron_right,
                              color: Colors.blueAccent,
                            ),
                          ),
                        ),
                      );
                    })),
          ]),
        ),
      ),
    );
  }
}

// ignore: use_key_in_widget_constructors
class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String entires = ModalRoute.of(context)?.settings.arguments as String;

    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            entires,
            style: const TextStyle(fontSize: 30.0),
          ),
        ),
      ),
    );
  }
}
