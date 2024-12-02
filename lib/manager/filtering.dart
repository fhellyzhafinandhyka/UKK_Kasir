import 'package:flutter/material.dart';
import 'package:ukkcafe/admin/beranda_admin.dart';
import 'package:ukkcafe/kasir/meja.dart';
import 'package:ukkcafe/kasir/transaksi_kasir.dart';
import 'package:ukkcafe/manager/menu_manager.dart';
import 'package:ukkcafe/manager/transaksi_manager.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5EFE9), // Background warna utama
      appBar: AppBar(
        backgroundColor: Color(0xFFF5EFE9),
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Transaction Data',
          style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Container(
          alignment: Alignment.topCenter,
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Color(0xFFF7EED0),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DropdownButton<String>(
                    value: '2024',
                    items: const [
                      DropdownMenuItem(
                        value: '2024',
                        child: Text('2024'),
                      ),
                    ],
                    onChanged: (_) {},
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const Text(
                'September',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Table(
                children: [
                  const TableRow(
                    children: [
                      Center(child: Text('Sun')),
                      Center(child: Text('Mon')),
                      Center(child: Text('Tue')),
                      Center(child: Text('Wed')),
                      Center(child: Text('Thu')),
                      Center(child: Text('Fri')),
                      Center(child: Text('Sat')),
                    ],
                  ),
                  TableRow(
                    children: List.generate(7, (index) => _buildCalendarCell('')),
                  ),
                  TableRow(
                    children: List.generate(7, (index) => _buildCalendarCell(index < 5 ? '' : '${index - 4}')),
                  ),
                  TableRow(
                    children: List.generate(7, (index) => _buildCalendarCell('${index + 8}')),
                  ),
                  TableRow(
                    children: List.generate(7, (index) {
                      if (index == 2) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => TransactionManagerPage()), // Ganti dengan halaman tujuan
                            );
                          },
                          child: _buildCalendarCell('10', highlighted: true),
                        );
                      } else {
                        return _buildCalendarCell('${index + 15}');
                      }
                    }),
                  ),
                  TableRow(
                    children: List.generate(7, (index) => _buildCalendarCell('${index + 22}')),
                  ),
                  TableRow(
                    children: List.generate(7, (index) {
                      return _buildCalendarCell(index < 2 ? '${index + 29}' : '');
                    }),
                  ),
                ],
              ),
            ],
          ),
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

  Widget _buildCalendarCell(String day, {bool highlighted = false}) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Center(
        child: Container(
          width: 30,
          height: 30,
          decoration: highlighted
              ? BoxDecoration(
                  color: Colors.brown[300],
                  shape: BoxShape.circle,
                )
              : null,
          child: Center(
            child: Text(
              day,
              style: TextStyle(
                color: highlighted ? Colors.white : Colors.black,
                fontWeight: highlighted ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

