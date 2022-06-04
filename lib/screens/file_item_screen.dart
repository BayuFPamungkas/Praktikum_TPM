import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FileItemScreen extends StatefulWidget {
  const FileItemScreen({Key? key}) : super(key: key);

  @override
  State<FileItemScreen> createState() => _FileItemScreenState();
}

class _FileItemScreenState extends State<FileItemScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {},
          )
        ],
        elevation: 0.0,
        title: Text(
          'Grocery Item',
          style: GoogleFonts.lato(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
