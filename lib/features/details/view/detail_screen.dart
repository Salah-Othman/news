import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String image, title, description, contect;

  const DetailScreen({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.contect,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text('News Details'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(image),
              SizedBox(height: 12),
              Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Color.fromRGBO(20, 20, 20, 1),
                ),
              ),

              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('9-12-2025'),
                  Icon(Icons.bookmark_border_sharp),
                ],
              ),
              SizedBox(height: 20),
              Text(
                description,
                maxLines: 100,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(54, 54, 54, 1),
                ),
              ),
              SizedBox(height: 20),
              Text(contect),
            ],
          ),
        ),
      ),
    );
  }
}
