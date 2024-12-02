import 'package:flutter/material.dart';
import 'package:ukkcafe/admin/beranda_admin.dart';
import 'package:ukkcafe/kasir/beranda_kasir.dart';
import 'package:ukkcafe/manager/beranda_manager.dart';

class RoleSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F0ED), // Background color
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Top circle decoration
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  color: Color(0xFF908370), // Circle color
                  shape: BoxShape.circle,
                ),
              ),
            ),
            SizedBox(height: 40), // Space below the circle
            // Title text
            Text(
              'Choose',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              'Your Role!',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 40),

            // Admin button
            RoleButton(
              text: 'Admin',
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AdminHomePage()));
              },
            ),

            // Manager button
            RoleButton(
              text: 'Manager',
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ManagerHomePage()));
              },
            ),

            // Cashier button
            RoleButton(
              text: 'Cashier',
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => KasirHomePage()));
              },
            ),

            SizedBox(height: 40),

            // Next button (for future use)
            ElevatedButton(
              onPressed: () {
                // Next button action
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFB0A895), // Next button color
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Next',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RoleButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  RoleButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFFE4DCCB), // Button background color
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
