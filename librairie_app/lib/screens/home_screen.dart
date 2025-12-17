import 'package:flutter/material.dart';
import '../models/book.dart';
import '../services/auth_service.dart';
import 'login_screen.dart';
import 'book_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  // Liste de livres
  final List<Book> books = [
    Book(
      title: 'Le Petit Prince',
      author: 'Antoine de Saint-Exupéry',
      description: 'Un conte poétique et philosophique.',
    ),
    Book(
      title: 'L\'Étranger',
      author: 'Albert Camus',
      description: 'Un roman sur l\'absurdité de la vie.',
    ),
    Book(
      title: '1984',
      author: 'George Orwell',
      description: 'Un roman dystopique sur un régime totalitaire.',
    ),
    Book(
      title: 'Les Misérables',
      author: 'Victor Hugo',
      description: 'Un roman historique et social français.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Librairie'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Se déconnecter',
            onPressed: () async {
              // Supprimer les informations de connexion
              await AuthService().logout();

              // Rediriger vers LoginScreen
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const LoginScreen()),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          final book = books[index];
          return ListTile(
            title: Text(book.title),
            subtitle: Text(book.author),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => BookDetailScreen(book: book),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
