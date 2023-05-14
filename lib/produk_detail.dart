import 'package:flutter/material.dart';

class ProdukDetail extends StatefulWidget {
  final String? NamaBarang;
  final String? Merk;
  final int? HargaBarang;
  final int? StokBarang;

  const ProdukDetail({
    Key? key,
    this.NamaBarang,
    this.Merk,
    this.HargaBarang,
    this.StokBarang,
  }) : super(key: key);

  @override
  _ProdukDetailState createState() => _ProdukDetailState();
}

class _ProdukDetailState extends State<ProdukDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Barang'),
      ),
      body: Column(
        children: [
          Text("Nama Barang : ${widget.NamaBarang}"),
          Text("Merk : ${widget.NamaBarang}"),
          Text("Stok Barang : ${widget.StokBarang}"),
          Text("Harga Barang : ${widget.HargaBarang}")
          
        ],
      ),
    );
  }
}
