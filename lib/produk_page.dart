import 'package:uts_unggul/produk_detail.dart';
import 'package:uts_unggul/produk_form.dart';
import 'package:uts_unggul/login.dart';
import 'package:uts_unggul/home.dart';
import 'package:flutter/material.dart';

class ProdukPage extends StatefulWidget {
  const ProdukPage({Key? key}) : super(key: key);

  @override
  _ProdukPageState createState() => _ProdukPageState();
}

class _ProdukPageState extends State<ProdukPage> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (_selectedIndex == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Home()),
      );
    } else if (_selectedIndex == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ProdukPage()),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Login()),
      );
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Barang'),
        actions: [
          GestureDetector(
              // menampilkan icon +
              child: const Icon(Icons.add),
              onTap: () async {
                // berpindah ke halaman ProdukForm

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProdukForm()));
              })
        ],
      ),
      body: ListView(
        children: const [
          // List 1
          ItemProduk(
            NamaBarang: "Laptop Lenovo",
            Merk: "Lenovo",
            StokBarang: 100,
            HargaBarang: 8000000,
          ),
          ItemProduk(
            NamaBarang: "Monitor 19 inch",
            Merk: "LG",
            StokBarang: 25,
            HargaBarang: 1500000,
          ),
          ItemProduk(
            NamaBarang: "Monitor 15 inch",
            Merk: "LG",
            StokBarang: 40,
            HargaBarang: 1000000,
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
  final String? NamaBarang;
  final String? Merk;
  final int? HargaBarang;
  final int? StokBarang;

  const ItemProduk({
    Key? key,
    this.NamaBarang,
    this.Merk,
    this.HargaBarang,
    this.StokBarang,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        child: ListTile(
          title: Text(NamaBarang.toString()),
          subtitle: Text(HargaBarang.toString()),
        ),
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProdukDetail(
                      NamaBarang: NamaBarang,
                      Merk: Merk,
                      HargaBarang: HargaBarang,
                      StokBarang: StokBarang,
                    )));
      },
    );
  }
}
