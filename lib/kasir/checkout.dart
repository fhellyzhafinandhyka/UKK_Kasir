import 'package:flutter/material.dart';
import 'package:ukkcafe/admin/beranda_admin.dart';
import 'package:ukkcafe/kasir/meja.dart';
import 'package:ukkcafe/kasir/nota.dart';
import 'package:ukkcafe/kasir/transaksi_kasir.dart';
import 'package:ukkcafe/manager/menu_manager.dart';

class OrderPage extends StatefulWidget {
  @override
  _OrderDetailPageState createState() => _OrderDetailPageState();
}

class _OrderDetailPageState extends State<OrderPage> {
  String selectedTable = ''; // Kosongkan pilihan meja sebelum dipilih
  String selectedCategory = ''; // Kosongkan kategori meja sebelum dipilih
  bool showTableSelection = false;

  void _toggleTableSelection() {
    setState(() {
      showTableSelection = !showTableSelection;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5EFE9), // Warna background sesuai gambar
      appBar: AppBar(
        leading: Icon(Icons.arrow_back, color: Colors.black),
        title: Text(
          'Your Order Detail',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color(0xFFF5EFE9),
        elevation: 0,
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: _toggleTableSelection,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFEFE5D8),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Table List',
                        style: TextStyle(fontSize: 18),
                      ),
                      Row(
                        children: [
                          Text(
                            selectedTable.isNotEmpty && selectedCategory.isNotEmpty
                                ? '$selectedCategory ($selectedTable)' // Menampilkan kategori dan nomor meja
                                : 'Select Table', // Kosongkan sebelum memilih
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                          SizedBox(width: 10),
                          Icon(Icons.arrow_drop_down),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (showTableSelection)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFEFE5D8),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.all(0),
                  child: Column(
                    children: [
                      Text('VIP', style: TextStyle(fontWeight: FontWeight.bold)),
                      GridView.count(
                        crossAxisCount: 4,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        children: [
                          _buildTableButton('1', 'VIP'),
                          _buildTableButton('2', 'VIP'),
                          _buildTableButton('3', 'VIP'),
                          _buildTableButton('4', 'VIP'),
                          _buildTableButton('5', 'VIP'),
                          _buildTableButton('6', 'VIP'),
                          _buildTableButton('7', 'VIP'),
                          _buildTableButton('8', 'VIP'),
                        ],
                      ),
                      SizedBox(height: 8),
                      Text('Regular', style: TextStyle(fontWeight: FontWeight.bold)),
                      GridView.count(
                        crossAxisCount: 4,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        children: [
                          _buildTableButton('A', 'Regular'),
                          _buildTableButton('B', 'Regular'),
                          _buildTableButton('C', 'Regular'),
                          _buildTableButton('D', 'Regular'),
                          _buildTableButton('E', 'Regular'),
                          _buildTableButton('F', 'Regular'),
                          _buildTableButton('G', 'Regular'),
                          _buildTableButton('H', 'Regular'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFEFE5D8),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Order Summary:',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    _buildOrderItem('1x Burger', 'Rp 15.000,00'),
                    _buildOrderItem('1x Ice Tea', 'Rp 5.000,00'),
                    SizedBox(height: 10),
                    GestureDetector(
                      onTap: () {
                        // Function for edit order
                      },
                      child: Text(
                        'Edit',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              // Navigasi ke halaman nota
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotaPage()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFB3A895),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text(
              'Checkout (Rp 20.000,00)',
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTableButton(String label, String category) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          selectedTable = label;
          selectedCategory = category;
          showTableSelection = false;
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFFB3A895),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        label,
        style: TextStyle(fontSize: 18, color: Colors.black),
      ),
    );
  }

  Widget _buildOrderItem(String name, String price) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(name, style: TextStyle(fontSize: 16)),
        Text(price, style: TextStyle(fontSize: 16)),
      ],
    );
  }
}

// Halaman Checkout
class CheckoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout Page'),
      ),
      body: Center(
        child: Text(
          'This is the checkout page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
