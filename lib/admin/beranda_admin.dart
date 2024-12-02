import 'package:flutter/material.dart';
import 'package:ukkcafe/admin/add_menu.dart';
import 'package:ukkcafe/admin/add_table.dart';
import 'package:ukkcafe/admin/add_user.dart';
import 'package:ukkcafe/kasir/meja.dart';
import 'package:ukkcafe/kasir/menu.dart';
import 'package:ukkcafe/kasir/transaksi_kasir.dart';
import 'package:ukkcafe/manager/menu_manager.dart';
import 'package:ukkcafe/pages/login_page.dart';


class AdminHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAF5EF), // Background color
      appBar: AppBar(
        backgroundColor: Color(0xFFEDE4D5), // Same as background color for seamless look
        elevation: 0, // Remove shadow
        toolbarHeight: 80,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tanaya,',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              'as cashier',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              // Navigate back to login page when exit icon is pressed
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
            icon: Icon(Icons.exit_to_app, color: Colors.black),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 20),
            // Add Menu Button
            AdminButton(
              label: 'Menu List',
              imageAsset: 'lib/assets/add menu.png', // Replace with burger image path
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => AddMenuPage()));
              },
            ),
            SizedBox(height: 20),
            // Add User Button
            AdminButton(
              label: 'Table List',
              imageAsset: 'lib/assets/add user.png', // Replace with user icon path
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => AddUserPage()));
              },
            ),
            SizedBox(height: 20),
            // Add Table Button
            AdminButton(
              label: 'Transaction Data',
              imageAsset: 'lib/assets/transaksi.png', // Replace with table icon path
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => AddTablePage()));
              },
            ),
          ],
        ),
      ),
      // Bottom Navigation Bar
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

class AdminButton extends StatelessWidget {
  final String label;
  final String imageAsset;
  final VoidCallback onPressed; // Add this line

  const AdminButton({
    required this.label,
    required this.imageAsset,
    required this.onPressed, // Add this line
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed, // Call onPressed when tapped
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFEDE4D5), // Card background color
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: 2,
              blurRadius: 6,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
          child: Row(
            children: [
              Image.asset(imageAsset, width: 50, height: 50), // Image of icon
              SizedBox(width: 16),
              Expanded(
                child: Text(
                  label,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Icon(Icons.add_circle, size: 40, color: Colors.black),
            ],
          ),
        ),
      ),
    );
  }
}
