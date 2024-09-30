import 'package:flutter/material.dart';
class ImageGalleryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: 6, // Number of images
      itemBuilder: (context, index) {
        return Card(
          child: Image.network(
            // 'https://via.placeholder.com/150',
            'https://images.unsplash.com/photo-1723083661302-ca5b3459e278?q=80&w=2069&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
            fit: BoxFit.cover,
          ),


        );
      },
    );
  }
}
