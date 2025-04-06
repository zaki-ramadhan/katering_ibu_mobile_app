import 'package:flutter/material.dart';
import '../constants/index.dart'; // Import file konstanta

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _fullNameError = ''; // Pesan kesalahan nama lengkap
  String _usernameError = ''; // Pesan kesalahan username
  String _emailError = ''; // Pesan kesalahan email
  String _passwordError = ''; // Pesan kesalahan password

  @override
  void initState() {
    super.initState();

    // Tambahkan listener untuk membersihkan pesan kesalahan saat pengguna mengetik
    _fullNameController.addListener(_clearFullNameError);
    _usernameController.addListener(_clearUsernameError);
    _emailController.addListener(_clearEmailError);
    _passwordController.addListener(_clearPasswordError);
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // Fungsi untuk membersihkan error nama lengkap
  void _clearFullNameError() {
    if (_fullNameError.isNotEmpty) {
      setState(() {
        _fullNameError = '';
      });
    }
  }

  // Fungsi untuk membersihkan error username
  void _clearUsernameError() {
    if (_usernameError.isNotEmpty) {
      setState(() {
        _usernameError = '';
      });
    }
  }

  // Fungsi untuk membersihkan error email
  void _clearEmailError() {
    if (_emailError.isNotEmpty) {
      setState(() {
        _emailError = '';
      });
    }
  }

  // Fungsi untuk membersihkan error password
  void _clearPasswordError() {
    if (_passwordError.isNotEmpty) {
      setState(() {
        _passwordError = '';
      });
    }
  }

  // Fungsi untuk validasi dan submit
  void _submitForm() {
    setState(() {
      _fullNameError = _fullNameController.text.trim().isEmpty ? 'Nama lengkap wajib diisi' : '';
      _usernameError = _usernameController.text.trim().isEmpty ? 'Username wajib diisi' : '';
      _emailError = _emailController.text.trim().isEmpty ? 'Email wajib diisi' : '';
      _passwordError = _passwordController.text.trim().isEmpty ? 'Password wajib diisi' : '';
    });

    if (_fullNameError.isEmpty &&
        _usernameError.isEmpty &&
        _emailError.isEmpty &&
        _passwordError.isEmpty) {
      // Jika validasi berhasil, tambahkan logika sign-up di sini
      print('Full Name: ${_fullNameController.text}');
      print('Username: ${_usernameController.text}');
      print('Email: ${_emailController.text}');
      print('Password: ${_passwordController.text}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30.0),
                // Logo and brand name
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(shape: BoxShape.circle),
                      child: ClipOval(
                        child: Image.asset(
                          'assets/images/logo.png', // Path ke gambar lokal
                          fit: BoxFit.cover, // Mengatur cara gambar ditampilkan
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Katering Ibu',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Belanja katering anti ribet',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 80),
                // Welcome text
                const Text(
                  'Buat Akun.',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Daftarkan diri Anda untuk mulai menikmati layanan katering praktis dan tanpa ribet.',
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
                const SizedBox(height: 40),
                // Full Name field
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: '* ',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                      TextSpan(
                        text: 'Masukkan Nama Lengkap :',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: _fullNameController,
                  decoration: InputDecoration(
                    hintText: 'John Doe',
                    hintStyle: TextStyle(color: Colors.grey),
                    contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                    filled: true,
                    fillColor: Colors.grey[100],
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: _fullNameError.isNotEmpty ? Colors.red : Colors.transparent,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: _fullNameError.isNotEmpty ? Colors.red : primaryColor,
                        width: 2.0,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Colors.red, width: 2.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Colors.red, width: 2.0),
                    ),
                  ),
                ),
                if (_fullNameError.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      _fullNameError,
                      style: const TextStyle(color: Colors.red, fontSize: 14),
                    ),
                  ),
                const SizedBox(height: 20),
                // Username field
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: '* ',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                      TextSpan(
                        text: 'Buat Username :',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    hintText: 'John D',
                    hintStyle: TextStyle(color: Colors.grey),
                    contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                    filled: true,
                    fillColor: Colors.grey[100],
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: _usernameError.isNotEmpty ? Colors.red : Colors.transparent,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: _usernameError.isNotEmpty ? Colors.red : primaryColor,
                        width: 2.0,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Colors.red, width: 2.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Colors.red, width: 2.0),
                    ),
                  ),
                ),
                if (_usernameError.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      _usernameError,
                      style: const TextStyle(color: Colors.red, fontSize: 14),
                    ),
                  ),
                const SizedBox(height: 20),
                // Email field
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: '* ',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                      TextSpan(
                        text: 'Masukkan Email Aktif :',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'johndoe@gmail.com',
                    hintStyle: TextStyle(color: Colors.grey),
                    contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                    filled: true,
                    fillColor: Colors.grey[100],
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: _emailError.isNotEmpty ? Colors.red : Colors.transparent,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: _emailError.isNotEmpty ? Colors.red : primaryColor,
                        width: 2.0,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Colors.red, width: 2.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Colors.red, width: 2.0),
                    ),
                  ),
                ),
                if (_emailError.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      _emailError,
                      style: const TextStyle(color: Colors.red, fontSize: 14),
                    ),
                  ),
                const SizedBox(height: 20),
                // Password field
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: '* ',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                      TextSpan(
                        text: 'Buat Password :',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: '********',
                    hintStyle: TextStyle(color: Colors.grey),
                    contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                    filled: true,
                    fillColor: Colors.grey[100],
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: _passwordError.isNotEmpty ? Colors.red : Colors.transparent,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: _passwordError.isNotEmpty ? Colors.red : primaryColor,
                        width: 2.0,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Colors.red, width: 2.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Colors.red, width: 2.0),
                    ),
                  ),
                ),
                if (_passwordError.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      _passwordError,
                      style: const TextStyle(color: Colors.red, fontSize: 14),
                    ),
                  ),
                const SizedBox(height: 30),
                // Sign Up button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _submitForm,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Buat akun',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Login prompt
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Sudah punya akun? Silahkan ',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/');
                        },
                        child: Text(
                          'masuk.',
                          style: TextStyle(
                            color: primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}