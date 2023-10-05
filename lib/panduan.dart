import 'package:flutter/material.dart';
import 'beranda.dart';
import 'main.dart';

class Panduan extends StatefulWidget {
  const Panduan({super.key});

  @override
  State<Panduan> createState() => _PanduanState();
}

class _PanduanState extends State<Panduan> {
  int _currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Panduan Penggunaan Aplikasi'),
        backgroundColor: Color(0xFF4E0189),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildStep('Login', [
              'Buka aplikasi dan Anda akan diarahkan ke halaman login.',
              'Masukkan kredensial login Anda (username dan password).',
              'Tekan tombol "Login" untuk masuk ke dalam aplikasi.'
            ]),
            _buildStep('Daftar Anggota Kelompok', [
              'Setelah login, Anda dapat mengakses menu "Daftar Anggota Kelompok".',
              'Pada halaman ini, Anda akan melihat daftar anggota kelompok yang telah terdaftar.',
              'Klik pada salah satu anggota kelompok untuk mengunjungi profil Instagram.',
            ]),
            _buildStep('Stopwatch', [
              'Menu "Stopwatch" memungkinkan Anda untuk menggunakan stopwatch.',
              'Pilih menu "Stopwatch" untuk membuka layar stopwatch.',
              'Tekan tombol "Start" untuk memulai penghitungan waktu, "Stop" untuk menghentikan sementara, dan "Reset" untuk mengulang penghitungan.'
            ]),
            _buildStep('Daftar Situs Rekomendasi', [
              'Pilih menu "Daftar Situs Rekomendasi" untuk melihat daftar situs yang direkomendasikan.',
              'Anda dapat menjelajahi berbagai situs yang mungkin bermanfaat dan klik pada situs tertentu untuk membuka halaman tersebut.'
                  'Anda dapat menandai sebuah situs sebagai favorit dengan menekan tombol bookmark pada setiap item situs.',
              'Situs yang ditandai sebagai favorit akan tersimpan di sini untuk referensi cepat di masa mendatang.'

            ]),
            _buildStep('Daftar Situs Favorit', [
              'Pilih menu "Daftar Situs Favorit" untuk melihat daftar situs yang Anda tandai sebagai favorit.',
              'Situs yang ditandai sebagai favorit akan tersimpan di sini untuk referensi cepat di masa mendatang.'
                  'Klik pada salah satu situs untuk membuka halaman situs.'
            ]),
            _buildStep('Logout', [
              'Untuk keluar dari aplikasi, Anda dapat menekan tombol "Logout" yang terdapat pada navigation bar.',
              'Pastikan untuk melakukan logout untuk menjaga keamanan akun Anda.'
            ]),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color(0xFF4E0189),
        currentIndex: _currentIndex,
        onTap: (index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Beranda()),
            );
          }
          else if (index == 2) {
            _showLogoutDialog(context);
          }
          else {
            setState(() {
              _currentIndex = index;
            });
          }
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Beranda',
              backgroundColor: Color(0xFF4E0189)
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.menu_book_rounded),
              label: 'Panduan Aplikasi',
              backgroundColor: Color(0xFF4E0189)
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.logout),
              label: 'Log Out',
              backgroundColor: Color(0xFF4E0189)
          ),
        ],
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Logout'),
          content: Text('Are you sure you want to log out?'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Logout'),
              onPressed: () {
                // Perform logout actions here
                // For example, navigate to login screen or clear user data
                // Navigate to the login screen
                Navigator.of(context).pop(); // Close the dialog
                // Add your logout logic here
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyApp()),
                );
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildStep(String title, List<String> steps) {
    return Card(
      elevation: 2.0,
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: steps
                  .map((step) => Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text('- $step'),
              ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}