import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String username;

  const ProfilePage({super.key, required this.username});

  // Function to handle edit profile
  void _handleEditProfile(BuildContext context) {
    try {
      // Tampilkan snackbar untuk memberi tahu user
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Edit Profile feature coming soon!'),
          duration: Duration(seconds: 2),
        ),
      );

      // Alternatif: Navigasi ke halaman edit profile
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => EditProfilePage(username: username),
      //   ),
      // );
    } catch (e) {
      // Handle any potential errors
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('An error occurred: ${e.toString()}'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              
              child: 
              Column(
                children: [
                  const SizedBox(height: 20),
                  // Profile Picture with gesture detector
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Image.asset(
                      'assets/images/logo.png', // Sesuaikan dengan nama file gambar Anda
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Username
                  Text(
                    username,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Stats Section with gesture detectors
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    child: _buildStatItem('Project Done', '125'),
                  ),
                  GestureDetector(
                    child: _buildStatItem('Project Progress', '30'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Profile Info with gesture detectors
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Edit email coming soon!')),
                      );
                    },
                    child: _buildInfoItem(Icons.email, '$username@email.com'),
                  ),
                  const SizedBox(height: 15),
                  InkWell(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Edit location coming soon!')),
                      );
                    },
                    child:
                        _buildInfoItem(Icons.location_on, 'Jakarta, Indonesia'),
                  ),
                  const SizedBox(height: 15),
                  InkWell(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Edit job coming soon!')),
                      );
                    },
                    child: _buildInfoItem(Icons.work, 'Software Developer'),
                  ),
                ],
              ),
            ),
            // Edit Profile Button with error handling
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildInfoItem(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: Colors.blue, size: 24),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
