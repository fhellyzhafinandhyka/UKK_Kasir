import 'package:flutter/material.dart';
import 'package:ukkcafe/kasir/transaksi_kasir.dart';

class NotaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF7D7051), // Background coklat di luar
      appBar: AppBar(
        backgroundColor: Color(0xFFF5EFE9), // Warna latar belakang AppBar
        elevation: 0,
        leading: Icon(Icons.arrow_back, color: Colors.black),
        title: Text(
          'Your Order Detail',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFF5EFE9), // Background warna putih pada container utama
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Color(0xFFEFEFEF), // Warna latar struk
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'WK',
                              style: TextStyle(
                                  fontSize: 40, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Wikusama Kafe',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            Divider(thickness: 1),
                            SizedBox(height: 4),
                            Text('Cashier : Tanaya', style: TextStyle(fontSize: 12)),
                            Text('10/09/2024', style: TextStyle(fontSize: 12)),
                            SizedBox(height: 10),
                            Text('Table Regular (D)', style: TextStyle(fontSize: 12)),
                            Divider(thickness: 1),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Burger', style: TextStyle(fontSize: 14)),
                                Text('x 1 = Rp 15.000,00',
                                    style: TextStyle(fontSize: 14)),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Ice Tea', style: TextStyle(fontSize: 14)),
                                Text('x 1 = Rp 5.000,00',
                                    style: TextStyle(fontSize: 14)),
                              ],
                            ),
                            Divider(thickness: 1),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('=> 2 item', style: TextStyle(fontSize: 12)),
                                Text('TOTAL', style: TextStyle(fontSize: 14)),
                                Text('Rp 20.000,00', style: TextStyle(fontSize: 14)),
                              ],
                            ),
                            Divider(thickness: 1),
                            SizedBox(height: 20),
                            Text('*TERIMA KASIH*',
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigasi ke halaman berikutnya
                    Navigator.push(context, MaterialPageRoute(builder: (context) => TransactionPage()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFB3A895), // Warna tombol
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Selesai',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


