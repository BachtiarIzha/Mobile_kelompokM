import 'package:filterin/helper/setor-controller.dart';
import 'package:flutter/material.dart';

class RiwayatSetor extends StatefulWidget {
  @override
  _RiwayatSetorState createState() => _RiwayatSetorState();
}

class _RiwayatSetorState extends State<RiwayatSetor> {

  List data = [];

  void getData() async {
    SetorC.getData().then((value){
      setState(() {
        data = value;
      });
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Riwayat Setor"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, i){
            return Container(
              margin: EdgeInsets.fromLTRB(10, 15, 10, 0),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(width: 0.7, color: Colors.black),
                borderRadius: BorderRadius.all(Radius.circular(15))
              ),
              child: Column(
                children: [
                  Text('pembayaran : ' + data[i]['pembayaran']),
                  Text('tgl : ' + data[i]['tanggal']),
                  Text('jenis sampah : ' + data[i]['jenis_sampah']),
                  Text('berat : ' + data[i]['berat'].toString()),
                ],
              ),
            );
          }
        ),
      ),
    );
  }
}