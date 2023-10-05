import 'package:flutter/material.dart';
import 'main.dart';
import 'stopwatch.dart';
import 'data_kelompok.dart';
import 'rekomendasi.dart';
import 'favorit.dart';
import 'panduan.dart';

class Beranda extends StatefulWidget {
  @override
  _BerandaState createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    Beranda(),
    Panduan(), // Add your PanduanAplikasi screen here
    // Add your Log Out screen here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Beranda'),
        backgroundColor: Color(0xFF4E0189),
        foregroundColor: Colors.white ,
      ),
      body: Center(
        child: SizedBox(
          child: ListView(
            children: <Widget>[
              InkWell(
                borderRadius: BorderRadius.circular(30),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => DataKelompok()));
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.list_alt,
                        size: 70,
                      ),
                      Text(
                        'Daftar Anggota Kelompok',
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                borderRadius: BorderRadius.circular(30),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => StopwatchApp()));
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.access_alarm,
                        size: 70,
                      ),
                      Text(
                        'Stopwatch',
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 18
                        ),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                borderRadius: BorderRadius.circular(30),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Rekomendasi()));
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.thumb_up_alt_outlined,
                        size: 70,
                      ),
                      Text(
                        'Situs Rekomendasi',
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 18
                        ),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                borderRadius: BorderRadius.circular(30),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Favorit()));
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.bookmark_added_outlined,
                        size: 70,
                      ),
                      Text(
                        'Favorit',
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 18
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color(0xFF4E0189),
        currentIndex: _currentIndex,
        onTap: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Panduan()),
            );
          }
          if (index == 2) {
            _showLogoutDialog(context);
          } else {
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
}