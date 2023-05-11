import 'package:flutter/material.dart';
import 'product_model.dart';
import 'apidata.dart';

class PageList extends StatefulWidget {
  @override
  _PageListState createState() => _PageListState();
}

class _PageListState extends State<PageList> {
  late Future<List<ProductModel>> _futureProductList;

  @override
  void initState() {
    super.initState();
    _futureProductList = ApiDataSource.getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
      ),
      body: FutureBuilder<List<ProductModel>>(
        future: _futureProductList,
        builder: (BuildContext context,
            AsyncSnapshot<List<ProductModel>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Failed to load data'),
            );
          } else if (!snapshot.hasData) {
            return Center(
              child: Text('No data'),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(snapshot.data![index].title),
                  subtitle: Text(snapshot.data![index].description),
                  trailing: Text('\$${snapshot.data![index].price}'),
                );
              },
            );
          }
        },
      ),
    );
  }
}
