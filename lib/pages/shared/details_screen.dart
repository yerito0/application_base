import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({
    super.key,
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          label,
          style: GoogleFonts.lato(),
        ),
      ),
      body: Center(
        child: Text(
          label,
          style: GoogleFonts.lato(),
        ),
      ),
    );
  }
}
