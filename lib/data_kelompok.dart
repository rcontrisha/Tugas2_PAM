import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DataKelompok extends StatelessWidget {
  void _launchURL(String url) async {
    try {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    } catch (error) {
      print('Error launching URL: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Anggota Kelompok"),
        backgroundColor: Color(0xFF4E0189),
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Container(
            child:
            InkWell(
              onTap: () => _launchURL('https://www.instagram.com/siddiqial_/'),
              child: ListTile(
                leading: CircleAvatar(
                  child: Text('S'),
                  backgroundColor: Color(0xFF4E0189),
                  foregroundColor: Colors.white,
                ),
                title: Text('Siddiqi Albiruny 124210003'),
              ),
            ),
          ),
          InkWell(
            onTap: () => _launchURL('https://www.instagram.com/ridho_contrisha/'),
            child: ListTile(
                leading: CircleAvatar(
                  child: Text('R'),
                  backgroundColor: Color(0xFF4E0189),
                  foregroundColor: Colors.white,
                ),
                title: Text('Ridho Contrisha 124210022')),
          ),
          InkWell(
            onTap: () => _launchURL('https://www.instagram.com/carlosngln/'),
            child: ListTile(
                leading: CircleAvatar(
                  child: Text('C'),
                  backgroundColor: Color(0xFF4E0189),
                  foregroundColor: Colors.white,
                ),
                title: Text('Carlos Nainggolan 124210045')
            ),
          ),
        ],
      ),
    );
  }
}