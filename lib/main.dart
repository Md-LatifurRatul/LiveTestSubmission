import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News Feed',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NewsFeedPage(),
    );
  }
}

class NewsFeedPage extends StatelessWidget {
  NewsFeedPage({super.key});

  final List<String> thumbnailUrls = [
    'https://placekitten.com/150/150',
    'https://placekitten.com/151/151',
    'https://placekitten.com/152/152',
    'https://placekitten.com/153/153',
    'https://placekitten.com/154/154',
    'https://placekitten.com/155/155',
    'https://placekitten.com/156/156',
    'https://placekitten.com/157/157',
    'https://placekitten.com/158/158',
    'https://placekitten.com/159/159',
  ];

  @override
  Widget build(BuildContext context) {
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'News Feed',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
        elevation: 8.0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: isPortrait ? _buildVerticalLayout() : _buildHorizontalLayout(),
      ),
    );
  }

  Widget _buildVerticalLayout() {
    return ListView.builder(
      itemCount: thumbnailUrls.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 4.0,
          margin: const EdgeInsets.all(8.0),
          child: Container(
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image:
                    NetworkImage(thumbnailUrls[index % thumbnailUrls.length]),
                fit: BoxFit.contain,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildHorizontalLayout() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1,
      ),
      itemCount: thumbnailUrls.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 4.0,
          margin: const EdgeInsets.all(8.0),
          child: Container(
            height: 300,
            decoration: BoxDecoration(
              image: DecorationImage(
                image:
                    NetworkImage(thumbnailUrls[index % thumbnailUrls.length]),
                fit: BoxFit.contain,
              ),
            ),
          ),
        );
      },
    );
  }
}
