import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Controllers for your 4 input fields
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _phoneController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _phoneController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          top: true,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              // Bottom background image decoration
              Positioned(
                bottom: -50,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    'assets/Rectangle5.png',
                    width: MediaQuery.of(context).size.width,
                    height: 446,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              // Main content body
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const SizedBox(height: 20),
                    // Header / Logo Section
                    Image.network(
                      'assets/Logo.png',
                      width: 205,
                      height: 167,
                      fit: BoxFit.cover,
                    ),
                    Text(
                      'Gabung Sekarang',
                      style: GoogleFonts.montserrat(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24.0, vertical: 8.0),
                      child: Text(
                        'Mulailah mengubah limbah anda menjadi sesuatu yang bermanfaat bagi bumi dan orang lain.',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Form Card Container
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 24.0),
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 115, 217, 119), // Semi-transparent green
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Buat Akun',
                              style: GoogleFonts.montserrat(
                                fontSize: 23,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            const SizedBox(height: 16),

                            // Input Field: Full Name
                            _buildInputField(
                              controller: _nameController,
                              label: 'Nama Lengkap',
                              hint: 'Masukkan Nama Lengkap',
                              icon: Icons.account_circle,
                            ),
                            _buildInputField(
                              controller: _nameController,
                              label: 'Alamat Email',
                              hint: 'Masukkan Alamat Email',
                              icon: Icons.email_outlined,
                            ),
                            _buildInputField(
                              controller: _nameController,
                              label: 'Kata Sandi',
                              hint: 'Masukkan Kata Sandi',
                              icon: Icons.lock,
                            ),
                            _buildInputField(
                              controller: _nameController,
                              label: 'Konfirmasi Kata Sandi',
                              hint: 'Masukkan Konfirmasi Kata Sandi',
                              icon: Icons.lock,
                            ),

                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: SizedBox(
                                width: 500,
                                height: 50,
                                child: ElevatedButton(
                                  onPressed: () {
                                    print('Button pressed ...');
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Colors.green, // Warna tombol
                                    foregroundColor: Colors
                                        .white, // Warna teks (dan ripple effect)
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          20), // Border radius
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                  ),
                                  child: const Text(
                                    'Buat Akun',
                                    style: TextStyle(
                                      fontFamily:
                                          'Inter', // Memakai fallback font Inter standar jika ada, atau hapus baris ini
                                      fontWeight: FontWeight.bold,
                                      fontSize:
                                          16, // Menyesuaikan ukuran text standar titleSmall
                                      letterSpacing: 0.0,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                        height:
                            400), // Gives scrolling breathing room above the stacked asset
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Clean, reusable builder method for text input fields
  Widget _buildInputField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    bool obscureText = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        height: 55,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            )
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          children: [
            Icon(icon, color: Colors.black54, size: 24),
            const SizedBox(width: 12),
            Expanded(
              child: TextFormField(
                controller: controller,
                obscureText: obscureText,
                style: GoogleFonts.poppins(fontSize: 13),
                decoration: InputDecoration(
                  isDense: true,
                  labelText: label,
                  labelStyle:
                      GoogleFonts.inter(color: Colors.black45, fontSize: 13),
                  hintText: hint,
                  hintStyle:
                      GoogleFonts.inter(color: Colors.black38, fontSize: 13),
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
