import 'package:flutter/material.dart';
import 'package:flutter_easy/core/utility.dart';
import 'package:flutter_easy/demo/scan/scan_focus.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanView extends StatefulWidget {
  @override
  _ScanViewState createState() => _ScanViewState();
}

class _ScanViewState extends State<ScanView> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Stack(children: [
        QRView(
          key: qrKey,
          onQRViewCreated: _onQRViewCreated,
        ),
        Container(
          margin: EdgeInsets.only(top: kToolbarHeight),
          alignment: Alignment.center,
          child: ScanFocus(),
        ),
        AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.white),
          leading: const CloseButton(),
          centerTitle: true,
          title: const Text('SCAN DEMO', style: TextStyle(color: Colors.white),),
          actions: <Widget>[
            IconButton(
              icon: Icon(isFlash ? Icons.flash_off : Icons.flash_on, color: Colors.white,),
              onPressed: () {
                controller.toggleFlash();
                setState(() {
                  isFlash = !isFlash;
                });
              },
            )
          ],
        ),
      ]),
    );
  }

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController controller;
  bool isFlash = false;

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen(onScan);
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  void onScan(String data) {
    if(data != null && data.isNotEmpty){
      Utility.showSnackBar(_scaffoldKey, data);
    }
  }
}
