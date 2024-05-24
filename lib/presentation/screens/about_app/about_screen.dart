
import 'package:flutter/material.dart';

/// An simple details section of the application with version and other developer descriptions

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SizedBox sizedBox = SizedBox(
      height: MediaQuery.of(context).size.height * 0.03,
    );
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            sizedBox,
            sizedBox,
            const Text(
              "Academy is your go-to academic managing destination, offering a seamless experience for the latest\n features to manage academic tiredness, confusion, and more. Our user-friendly platform provides a wide\n array of high-quality features at easy user interface. With a commitment to customer satisfaction, we strive\n to deliver convenience through a secure logging environment and swift delivery services. Embrace an enjoyable and hassle-free academic management, accompanied by exclusive features. Join us in exploring a world of endless possibilities and unparalleled convenience. At Academy, we're dedicated to elevating your academic experience to the next level.",
            ),
            sizedBox,
            const Text(
              'Thank you for choosing Academy. We hope it serves your needs and respects your privacy.',
              // fontStyle: FontStyle.italic,
              // fontWeight: FontWeight.w600,
            ),
          ],
        ),
      ),
    );
  }
}
