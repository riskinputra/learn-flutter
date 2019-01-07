import 'package:flutter/material.dart';

class ProductControl extends StatelessWidget {
  final Function addproduct;

  ProductControl(this.addproduct);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        addproduct('Sweets');
      },
      child: Text('Add Product'),
    );
  }
}
