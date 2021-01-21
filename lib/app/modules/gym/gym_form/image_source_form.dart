import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:image_picker_web/image_picker_web.dart';
// import 'package:http/http.dart' as http;
// import 'package:path_provider/path_provider.dart';
// import 'dart:io';
// import 'dart:math';

class ImageSourceForm extends StatelessWidget {

  final Function(File) onImageSelected;

  ImageSourceForm({ @required this.onImageSelected });

  void imageSelected(File image) async {
    if (image != null) {
      onImageSelected(image);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.camera_enhance),
            title: Text('Camera'),
            onTap: () async {
              File image = await ImagePicker.pickImage(source: ImageSource.camera);
              imageSelected(image);
            },
          ),
          ListTile(
            leading: Icon(Icons.image),
            title: Text('Gallery'),
            onTap: () async {
              File image = await ImagePicker.pickImage(source: ImageSource.gallery);
              //Uint8List bytesFromPicker = await ImagePickerWeb.getImage(outputType: ImageType.bytes);
              //File image = File.fromRawPath(bytesFromPicker);
              //Image image = await ImagePickerWeb.getImage(outputType: ImageType.bytes) as File;
              //File image = await urlToFile("https://picsum.photos/200/300");
              //File image = File("assets/pileczka.jpg");
              imageSelected(image);
            },
          )
        ],
      ),
    );
  }
//   Future<File> urlToFile(String imageUrl) async {
// // generate random number.
//     var rng = new Random();
// // get temporary directory of device.
//     Directory tempDir = await getApplicationDocumentsDirectory();
// // get temporary path from temporary directory.
//     String tempPath = tempDir.path;
// // create a new file in temporary path with random file name.
//     File file = new File('$tempPath'+ (rng.nextInt(100)).toString() +'.png');
// // call http.get method and pass imageUrl into it to get response.
//     http.Response response = await http.get(imageUrl);
// // write bodyBytes received in response to file.
//     await file.writeAsBytes(response.bodyBytes);
// // now return the file which is created with random name in
// // temporary directory and image bytes from response is written to // that file.
//     return file;
//   }
}

