import 'package:uts_unggul/login.dart';
import 'package:uts_unggul/produk_detail.dart';
import 'package:uts_unggul/produk_form.dart';
import 'package:uts_unggul/produk_page.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (_selectedIndex == 0) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Home()));
    } else if (_selectedIndex == 1) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const ProdukPage()));
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Login()));
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu Utama'),
      ),
      body: ListView(
        children: const [
          // List 1
          ItemProduk(
            NamaMenu: "Lihat Daftar Barang",
          ),
          ItemProduk(
            NamaMenu: "Tambah Barang",
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.trolley), label: 'Produk'),
          BottomNavigationBarItem(icon: Icon(Icons.logout), label: 'Logout'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class ItemProduk extends StatelessWidget {
  final String? NamaMenu;

  const ItemProduk(
      {Key? key, this.NamaMenu})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        child: ListTile(
          title: Text(NamaMenu.toString()),
        ),
      ),
      onTap: () {
        if (NamaMenu.toString() == "Lihat Daftar Barang") {
          Navigator.push(
          context, MaterialPageRoute(builder: (context) => const ProdukPage()));
        }
        else if (NamaMenu.toString() == "Tambah Barang") {
          Navigator.push(
          context, MaterialPageRoute(builder: (context) => const ProdukForm()));
        }
      },
    );
  }
}
