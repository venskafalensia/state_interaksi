import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Buku Kontak',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Arial',
        scaffoldBackgroundColor: const Color(0xFFF6F7FF),
      ),
      home: const ContactPage(),
    );
  }
}

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  // Controller untuk Nama
  final TextEditingController namaController = TextEditingController();

  // Controller untuk Email
  final TextEditingController emailController = TextEditingController();

  // Controller untuk Nomor Handphone
  final TextEditingController nomorController = TextEditingController();

  // Controller untuk Kategori
  final TextEditingController kategoriController = TextEditingController();

  // List untuk menyimpan data kontak
  List<Map<String, String?>> contacts = [];

  // Fungsi untuk menyimpan kontak
  void simpanKontak() {
    if (namaController.text.isEmpty ||
        emailController.text.isEmpty ||
        nomorController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Lengkapi semua data terlebih dahulu!'),
        ),
      );
      return;
    }

    setState(() {
      contacts.add({
        'nama': namaController.text,
        'email': emailController.text,
        'nomor': nomorController.text,
        'kategori': kategoriController.text.isEmpty
            ? null
            : kategoriController.text,
      });

      // Mengosongkan form setelah data disimpan
      namaController.clear();
      emailController.clear();
      nomorController.clear();
      kategoriController.clear();
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Kontak berhasil disimpan!'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFF5F3FF),
              Color(0xFFF8F9FF),
              Color(0xFFEFF1FF),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // =========================
              // HEADER
              // =========================
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 20,
                ),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF536DFE),
                      Color(0xFF7C4DFF),
                    ],
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(28),
                    bottomRight: Radius.circular(28),
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 52,
                      height: 52,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Icon(
                        Icons.contact_page_rounded,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),

                    const SizedBox(width: 15),

                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Buku Kontak',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 3),
                          Text(
                            'Simpan kontak temanmu dengan mudah',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.person_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),

              // =========================
              // ISI
              // =========================
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(20),
                  children: [
                    // =========================
                    // FORM TAMBAH KONTAK
                    // =========================
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.deepPurple.withOpacity(0.08),
                            blurRadius: 20,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFEDE9FE),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Icon(
                                  Icons.person_add_rounded,
                                  color: Color(0xFF6C4DE8),
                                ),
                              ),

                              const SizedBox(width: 12),

                              const Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Tambah Kontak Baru',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF25234A),
                                    ),
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                    'Masukkan data kontak',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),

                          const SizedBox(height: 22),

                          // NAMA
                          const Text(
                            'Nama Lengkap',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF34324A),
                            ),
                          ),

                          const SizedBox(height: 8),

                          TextField(
                            controller: namaController,
                            decoration: InputDecoration(
                              hintText: 'Masukkan nama lengkap',
                              prefixIcon: const Icon(
                                Icons.person_outline_rounded,
                              ),
                              filled: true,
                              fillColor: const Color(0xFFF8F8FC),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),

                          const SizedBox(height: 16),

                          // EMAIL
                          const Text(
                            'Email',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF34324A),
                            ),
                          ),

                          const SizedBox(height: 8),

                          TextField(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              hintText: 'Masukkan email',
                              prefixIcon: const Icon(
                                Icons.email_outlined,
                              ),
                              filled: true,
                              fillColor: const Color(0xFFF8F8FC),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),

                          const SizedBox(height: 16),

                          // NOMOR HANDPHONE
                          const Text(
                            'Nomor Handphone',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF34324A),
                            ),
                          ),

                          const SizedBox(height: 8),

                          TextField(
                            controller: nomorController,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              hintText: 'Masukkan nomor handphone',
                              prefixIcon: const Icon(
                                Icons.phone_outlined,
                              ),
                              filled: true,
                              fillColor: const Color(0xFFF8F8FC),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),

                          const SizedBox(height: 16),

                          // KATEGORI
                          const Text(
                            'Kategori',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF34324A),
                            ),
                          ),

                          const SizedBox(height: 8),

                          TextField(
                            controller: kategoriController,
                            decoration: InputDecoration(
                              hintText: 'Contoh: Keluarga, Teman, Kerja',
                              prefixIcon: const Icon(
                                Icons.category_outlined,
                              ),
                              filled: true,
                              fillColor: const Color(0xFFF8F8FC),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),

                          const SizedBox(height: 20),

                          // TOMBOL SIMPAN
                          SizedBox(
                            width: double.infinity,
                            height: 52,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xFF536DFE),
                                    Color(0xFF7C4DFF),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: ElevatedButton.icon(
                                onPressed: simpanKontak,
                                icon: const Icon(
                                  Icons.save_rounded,
                                  color: Colors.white,
                                ),
                                label: const Text(
                                  'Simpan Kontak',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  shadowColor: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(14),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 25),

                    // =========================
                    // JUDUL DAFTAR KONTAK
                    // =========================
                    Row(
                      children: [
                        const Expanded(
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Daftar Kontak',
                                style: TextStyle(
                                  fontSize: 21,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF25234A),
                                ),
                              ),
                              SizedBox(height: 3),
                              Text(
                                'Kontak yang telah kamu simpan',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),

                        // JUMLAH KONTAK
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xFF536DFE),
                                Color(0xFF7C4DFF),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            '${contacts.length} Kontak',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 14),

                    // =========================
                    // LIST KONTAK
                    // =========================
                    if (contacts.isEmpty)
                      Container(
                        padding: const EdgeInsets.all(35),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Column(
                          children: [
                            Icon(
                              Icons.contact_page_outlined,
                              size: 60,
                              color: Color(0xFFB7B5D6),
                            ),
                            SizedBox(height: 12),
                            Text(
                              'Belum ada kontak',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Tambahkan kontak menggunakan form di atas.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      )
                    else
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: contacts.length,
                        itemBuilder: (context, index) {
                          final contact = contacts[index];

                          return Container(
                            margin: const EdgeInsets.only(bottom: 12),
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      Colors.deepPurple.withOpacity(0.06),
                                  blurRadius: 15,
                                  offset: const Offset(0, 5),
                                ),
                              ],
                            ),
                            child: ListTile(
                              contentPadding: EdgeInsets.zero,

                              // CIRCLE AVATAR
                              leading: CircleAvatar(
                                radius: 26,
                                backgroundColor:
                                    const Color(0xFF6C4DE8),
                                child: Text(
                                  contact['nama']!
                                      .substring(0, 1)
                                      .toUpperCase(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),

                              // DATA KONTAK
                              title: Text(
                                contact['nama']!,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Color(0xFF25234A),
                                ),
                              ),

                              subtitle: Padding(
                                padding:
                                    const EdgeInsets.only(top: 6),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    // EMAIL
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.email_outlined,
                                          size: 15,
                                          color: Color(0xFF6C4DE8),
                                        ),
                                        const SizedBox(width: 6),
                                        Expanded(
                                          child: Text(
                                            contact['email']!,
                                            overflow:
                                                TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),

                                    const SizedBox(height: 4),

                                    // NOMOR
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.phone_outlined,
                                          size: 15,
                                          color: Color(0xFF6C4DE8),
                                        ),
                                        const SizedBox(width: 6),
                                        Text(
                                          contact['nomor']!,
                                        ),
                                      ],
                                    ),

                                    const SizedBox(height: 4),

                                    // KATEGORI
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.category_outlined,
                                          size: 15,
                                          color: Color(0xFF6C4DE8),
                                        ),
                                        const SizedBox(width: 6),
                                        Text(
                                          contact['kategori'] ??
                                              'Tanpa kategori',
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),

                              trailing: const Icon(
                                Icons.more_vert_rounded,
                                color: Color(0xFF6C4DE8),
                              ),
                            ),
                          );
                        },
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}