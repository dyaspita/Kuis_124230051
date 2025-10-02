import 'package:flutter/material.dart';
import 'package:kuis_124230051/book_data.dart';
import 'book_data.dart';
import 'package:url_launcher/url_launcher.dart';



class BookDetail extends StatelessWidget {
  final Book book;
  const BookDetail({super.key, required this.book});
  

  Future<void> _launchGoogle() async {
    final url = Uri.parse("https://www.google.com");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Buku'),
        backgroundColor: const Color.fromARGB(255, 68, 119, 248),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                book.imageUrls.first,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.image, size: 200, color: Colors.red),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              book.title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Author: ${book.author}',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              book.description,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            _buildDetailRow('Harga', book.price),
            _buildDetailRow('Link', book.officialUrl),
            const SizedBox(height: 20),
            Center(
              child: 
             ElevatedButton(
                onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Berhasil Membeli Buku')),
        );
                },
                style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 68, 119, 248),
                foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 55, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text('Beli', style: TextStyle(fontSize: 16)),
              ),
            ),
            
            const SizedBox(height: 10),
            Center(
              child: 
                  ElevatedButton(
                    onPressed: _launchGoogle,
                    style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 68, 119, 248),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 55, vertical: 16),
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                    child: const Text("Buka Browser"),
                  ),
            ),     
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              '$label:',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Text(value),
          ),
        ],
      ),
    );
  }
}