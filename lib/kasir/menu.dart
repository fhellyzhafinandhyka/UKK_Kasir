import 'package:flutter/material.dart';
import 'package:ukkcafe/admin/beranda_admin.dart';
import 'package:ukkcafe/kasir/checkout.dart';
import 'package:ukkcafe/kasir/meja.dart';
import 'package:ukkcafe/kasir/transaksi_kasir.dart';
import 'package:ukkcafe/manager/menu_manager.dart';

class MenuList extends StatefulWidget {
  @override
  _MenuListState createState() => _MenuListState();
}

class _MenuListState extends State<MenuList> {
  int burgerCount = 1;
  int cheeseCakeCount = 0;
  int iceTeaCount = 1;
  int lemonTeaCount = 0;

  int get totalPrice =>
      (burgerCount * 15000) +
      (cheeseCakeCount * 18000) +
      (iceTeaCount * 5000) +
      (lemonTeaCount * 5000);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu List'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Food',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            buildMenuItem(
              'Burger',
              15000,
              'lib/assets/burger.png', // Use the actual path for burger image
              burgerCount,
              (newCount) => setState(() => burgerCount = newCount),
            ),
            buildMenuItem(
              'Cheese cake',
              18000,
              'lib/assets/cheesecake.png', // Use the actual path for cheesecake image
              cheeseCakeCount,
              (newCount) => setState(() => cheeseCakeCount = newCount),
            ),
            SizedBox(height: 20),
            Text(
              'Drink',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            buildMenuItem(
              'Ice tea',
              5000,
              'lib/assets/tea.png', // Use the actual path for ice tea image
              iceTeaCount,
              (newCount) => setState(() => iceTeaCount = newCount),
            ),
            buildMenuItem(
              'Lemon tea',
              5000,
              'lib/assets/lemon.png', // Use the actual path for lemon tea image
              lemonTeaCount,
              (newCount) => setState(() => lemonTeaCount = newCount),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                // Navigate directly to OrderPage when user taps the total
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OrderPage(),
                  ),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'TOTAL',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${burgerCount + cheeseCakeCount + iceTeaCount + lemonTeaCount} item',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Rp ${totalPrice},00',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
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

  Widget buildMenuItem(String title, int price, String imagePath, int count,
      ValueChanged<int> onCountChanged) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.asset(imagePath, width: 50, height: 50),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text('Rp $price,00'),
                ],
              ),
            ),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    if (count > 0) onCountChanged(count - 1);
                  },
                ),
                Text('$count'),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    onCountChanged(count + 1);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
