// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

class Book {
  String name;
  Gener gener;
  Color color = Color.fromARGB(255, 127, 86, 197);
  Book({
    required this.name,
    required this.gener,
  }) {
    color = gener == Gener.Action
        ? const Color.fromARGB(255, 127, 86, 197)
        : gener == Gener.Horror
            ? const Color.fromARGB(255, 161, 46, 94)
            : gener == Gener.Novels
                ? const Color.fromARGB(255, 78, 111, 216)
                : gener == Gener.Romance
                    ? const Color.fromARGB(255, 219, 35, 189)
                    : const Color.fromARGB(255, 66, 177, 116);
  }
}

enum Gener {
  ScienceFiction,
  Novels,
  Romance,
  Action,
  Horror,
}
