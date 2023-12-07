import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Apprendre le image picker'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ImagePicker imagePicker = ImagePicker();
  File? file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
                child : (file != null)
                    ? Image.file(file!)
                    : const Center(child: Text("Prenez une photo"))
            ),

            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: (() => useCamera(ImageSource.gallery)),
                    child: const Icon(Icons.photo_library_outlined)),
                ElevatedButton(
                    onPressed: (() => useCamera(ImageSource.camera)),
                    child: const Icon(Icons.camera_alt)),
              ],
            )


          ],
        ),
      ),
    );
  }

  Future useCamera(ImageSource source) async {
    XFile? xFile = await imagePicker.pickImage(source: source);
    if (xFile != null) {
      setState(() {
          file = File(xFile!.path);
      });
    }
  }
}
