import 'package:flutter/material.dart';
import 'package:ukkcafe/admin/beranda_admin.dart';
import 'package:ukkcafe/kasir/transaksi_kasir.dart';
import 'package:ukkcafe/manager/menu_manager.dart';

class TableListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F0ED), // Background color
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Table List',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // VIP section
            Text(
              'VIP',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8), // Kurangi jarak antara label dan grid
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 4,
              crossAxisSpacing: 8, // Kurangi jarak horizontal
              mainAxisSpacing: 8,  // Kurangi jarak vertikal
              children: List.generate(8, (index) {
                return TableButton(
                  label: (index + 1).toString(),
                );
              }),
            ),
            SizedBox(height: 8), // Kurangi jarak antara grid VIP dan Regular

            // Regular section
            Text(
              'Regular',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8),
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 4,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              children: List.generate(8, (index) {
                return TableButton(
                  label: String.fromCharCode(65 + index), // A-F
                );
              }),
            ),
          ],
        ),
      ),
   bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF6F6147),
        selectedItemColor: const Color.fromARGB(255, 12, 12, 12),
        unselectedItemColor: const Color.fromARGB(153, 9, 9, 9),
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AdminHomePage()),
              );
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MenuManagerPage()),
              );
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TableListScreen()),
              );
              break;
            case 3:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TransactionPage()),
              );
              break;
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fastfood),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.table_restaurant),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt),
            label: '',
          ),
        ],
      ),
    );
  }
}

class TableButton extends StatelessWidget {
  final String label;

  TableButton({required this.label});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF7B6D59), // Button background color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8), // Kurangi padding tombol
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 16, // Kurangi ukuran font
          color: Colors.white,
        ),
      ),
    );
  }
}
