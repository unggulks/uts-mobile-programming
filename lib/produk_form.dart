import 'dart:io';
import 'package:uts_unggul/produk_detail.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProdukForm extends StatefulWidget {
  const ProdukForm({Key? key}) : super(key: key);

  @override
  _ProdukFormState createState() => _ProdukFormState();
}

class _ProdukFormState extends State<ProdukForm> {
  final _NamaBarangTextboxController = TextEditingController();
  final _MerkTextboxController = TextEditingController();
  final _HargaBarangTextboxController = TextEditingController();
  final _StokBarangTextboxController = TextEditingController();
  XFile? _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Barang'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            _textboxNamaBarang(),
            _textboxMerk(),
            _textboxStokBarang(),
            _textboxHargaBarang(),
            _tombolUploadFoto(),
            _tombolSimpan(),
          ],
        ),
      ),
    );
  }

  _textboxNamaBarang() {
    return TextField(
      decoration: const InputDecoration(
          labelText: "Nama Barang", contentPadding: EdgeInsets.all(12)),
      controller: _NamaBarangTextboxController,
    );
  }

  _textboxMerk() {
    return TextField(
      decoration: const InputDecoration(
          labelText: "Merk", contentPadding: EdgeInsets.all(12)),
      keyboardType: TextInputType.number,
      controller: _MerkTextboxController,
    );
  }

  _textboxStokBarang() {
    return TextField(
      decoration: const InputDecoration(
          labelText: "Stok Barang", contentPadding: EdgeInsets.all(12)),
      keyboardType: TextInputType.number,
      controller: _StokBarangTextboxController,
    );
  }

  _textboxHargaBarang() {
    return TextField(
      decoration: const InputDecoration(
          labelText: "Harga Barang", contentPadding: EdgeInsets.all(12)),
      keyboardType: TextInputType.number,
      controller: _HargaBarangTextboxController,
    );
  }

  _tombolSimpan() {
    return ElevatedButton(
        onPressed: () {
          if (_NamaBarangTextboxController.text.isEmpty ||
              _MerkTextboxController.text.isEmpty ||
              _HargaBarangTextboxController.text.isEmpty ||
              _StokBarangTextboxController.text.isEmpty) {
            Fluttertoast.showToast(
                msg: "Data belum lengkap!",
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.TOP,
                backgroundColor: Colors.red,
                textColor: Colors.white);
            return;
          }

          if (_NamaBarangTextboxController.text.length < 3) {
            Fluttertoast.showToast(
                msg: "Nama Barang minimal 3 karakter",
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.TOP,
                backgroundColor: Colors.red,
                textColor: Colors.white);
            return;
          }

          String NamaBarang = _NamaBarangTextboxController.text;
          String Merk = _MerkTextboxController.text;
          int HargaBarang = int.parse(_HargaBarangTextboxController.text);
          int StokBarang = int.parse(_StokBarangTextboxController.text);

          // pindah ke halaman Produk Detail dan mengirim data
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ProdukDetail(
                    NamaBarang: NamaBarang,
                    Merk: NamaBarang,
                    HargaBarang: HargaBarang,
                    StokBarang: StokBarang,
                  )));
        },
        child: const Text('Simpan'));
  }

  _tombolUploadFoto() {
    final _picker = ImagePicker();
    XFile? _image;

    void _getImage() async {
      final pickedFile = await _picker.pickImage(
          source: ImageSource.camera); // Mengambil gambar dari galeri
      // final pickedFile = await _picker.pickImage(source: ImageSource.camera); // Mengambil gambar dari kamera
      setState(() {
        _image = pickedFile;
      });
    }

    return Column(
      children: [
        ElevatedButton(
          onPressed: _getImage,
          child: Text('Gambar'),
        ),
        if (_image != null)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Image.file(File(_image!.path)),
                Text('Foto yang sudah diupload'),
              ],
            ),
          ),
      ],
    );
  }
}
