import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrExampleScreen extends StatefulWidget {
  const QrExampleScreen({super.key});

  @override
  State<QrExampleScreen> createState() => _QrExampleScreenState();
}

class _QrExampleScreenState extends State<QrExampleScreen> {
  final TextEditingController qrTextController = TextEditingController();
  bool _isQrLoading = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        shadowColor: Colors.grey,
        bottomOpacity: 20,
        scrolledUnderElevation: 12,
        backgroundColor: Colors.lightGreenAccent,
        title: Text('QR Code Generate'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 500,
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: TextFormField(
                        controller: qrTextController,
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.black,),
                      onPressed: () {
                    setState(()  {
                      qrTextController.text = qrTextController.text;
                    });
                  }, child: Text('Generate QR',style: TextStyle(color:  Colors.lightGreenAccent),)),
                ],
              ),
            ),

            SizedBox(height: 10,),

            Container(
              height: 355,
              width: 355,
              decoration: BoxDecoration(border: Border.all(color: Colors.red)),
              child: qrTextController.text.isNotEmpty ? QrImageView(
                data: '${qrTextController.text}',
                // data: 'manigandanshuba@okicici',
                version: QrVersions.auto,
                size: 350.0,
                gapless: false,
                embeddedImage: AssetImage('assets/images/mn_logo_bg_white.png'),
                embeddedImageStyle: QrEmbeddedImageStyle(
                  size: Size(80, 80),
                ),
              ) : Center(child: Text('Empty',style:TextStyle(fontSize: 20),)),
            ),



          ],
        ),
      ),
    ));
  }
}
