import 'dart:math';
import 'package:flutter/material.dart';
import '../models/book.dart';

class RandomBookWidget extends StatefulWidget {
  final List<Book> books;
  const RandomBookWidget({Key? key, required this.books}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _RandomBookWidgetState createState() => _RandomBookWidgetState();
}

class _RandomBookWidgetState extends State<RandomBookWidget> {
  Book? book;

  @override
  void initState() {
    super.initState();
    _loadRandomBook();
  }

  void _loadRandomBook() {
    final randomIndex = Random().nextInt(widget.books.length);
    setState(() {
      book = widget.books[randomIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    if (book == null) {
      return const SizedBox();
    }

    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(book!.coverUrl),
              fit: BoxFit.cover,
            ),
          ),
          height: 250,
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(0.6),
                Colors.grey.withOpacity(0.3),
              ],
            ),
          ),
          height: 250,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 30,
              top: 20,
              right: 30,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: Colors.blue[900],
                    ),
                    child: Text(
                      book!.category,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ]),
                const SizedBox(height: 10),
                Row(children: [
                  Flexible(
                    child: Text(
                      book!.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 3,
                    ),
                  ),
                ]),
                const SizedBox(height: 7),
                Row(children: [
                  Text(
                    book!.author,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    maxLines: 1,
                  ),
                ]),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
