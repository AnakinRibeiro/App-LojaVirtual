import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:loja_flutter/tabs/category_tile.dart';

// Lista de tiles de categorias de produtos
class ProductsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: Firestore.instance.collection("products").getDocuments(),
      builder: (context, snapshot) {
        if(!snapshot.hasData)
          return Center(child: CircularProgressIndicator(),);
        else {

          var dividedTiles = ListTile.divideTiles(tiles: snapshot.data.documents.map(
              (doc) {
                return CategoryTile(doc);
              }
            ).toList(), color: Colors.grey[500]).toList();

          return ListView(
            children: dividedTiles,
          );
        }
      },
    );
  }
}