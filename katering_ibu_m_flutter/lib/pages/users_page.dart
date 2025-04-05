// lib/pages/users_page.dart

import 'package:flutter/material.dart';
import '../services/api_service.dart';
import 'add_user_page.dart';

class UsersPage extends StatefulWidget {
  @override
  _UsersPageState createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  late Future<List<dynamic>> futureUsers;
  final ApiService apiService = ApiService();

  @override
  void initState() {
    super.initState();
    futureUsers = apiService.fetchUsers(); // Memanggil API untuk mengambil data pengguna
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users List'),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: futureUsers,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No users found'));
          } else {
            final users = snapshot.data!;
            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return ListTile(
                  title: Text(user['name']),
                  subtitle: Text(user['email']),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () async {
                      try {
                        await apiService.deleteUser(user['id']);
                        setState(() {
                          futureUsers = apiService.fetchUsers(); // Refresh data setelah penghapusan
                        });
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Failed to delete user')),
                        );
                      }
                    },
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddUserPage()),
          ).then((_) {
            setState(() {
              futureUsers = apiService.fetchUsers(); // Refresh data setelah menambahkan pengguna
            });
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}