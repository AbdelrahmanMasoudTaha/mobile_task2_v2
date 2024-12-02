import 'package:flutter/material.dart';
import 'package:task2/widgets/book_card.dart';
import 'add_screen.dart';
import 'book.dart';

import '../models/book.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Book> books = [
    Book(name: 'name1', gener: Gener.Novels),
    Book(name: 'name2', gener: Gener.Romance),
    Book(name: 'name3', gener: Gener.Action),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('The Books',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
              onPressed: () async {
                final newBook = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddScreen(),
                  ),
                );
                if (newBook != null) {
                  setState(() {
                    books.add(newBook);
                  });
                }
              },
              icon: const Icon(Icons.add))
        ],
        centerTitle: true,
      ),
      body: Column(
        children: [
          Text(
            'Total Books is ${books.length}',
            style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 20,
                fontWeight: FontWeight.w500),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BookScreen(book: books[index]),
                    ),
                  ),
                  onLongPress: () {
                    setState(() {
                      books.removeAt(index);
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('A book is deleted')));
                    });
                  },
                  child: BookCard(book: books[index]),
                );
              },
              itemCount: books.length,
            ),
          ),
        ],
      ),
    );
  }
}
