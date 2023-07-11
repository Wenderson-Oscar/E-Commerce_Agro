import 'package:flutter/material.dart';
import 'package:myapp/controller/menu.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:myapp/page/registerproduct.dart';

class ListProductsSell extends StatefulWidget {
  @override
  _ListProductsSellState createState() => _ListProductsSellState();
}

class _ListProductsSellState extends State<ListProductsSell> {
  List<Product> products = [];
  List<Product> filteredProducts = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    final url = Uri.parse('http://10.8.30.139:8000/list_my_product/1/');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> responseData = jsonDecode(response.body);
      final List<Product> fetchedProducts =
          responseData.map((data) => Product.fromJson(data)).toList();

      setState(() {
        products = fetchedProducts;
        filteredProducts = products;
      });
    } else {
      _showSnackBar(context, 'Erro ao carregar os produtos');
    }
  }
}


  void filterProducts(String query) {
    setState(() {
      if (query.isNotEmpty) {
        filteredProducts = products
            .where((product) =>
                product.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
      } else {
        filteredProducts = products;
      }
    });
  }

  void showProductDetails(Product product) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(product.name),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(product.imageUrl),
              SizedBox(height: 10),
              Text('Nome ${product.name}'),
              SizedBox(height: 10),
              Text('Preço: R\$${product.value.toStringAsFixed(2)}'),
              SizedBox(height: 10),
              Text('Descrição: ${product.description}'),
              SizedBox(height: 10),
              Text('Vendedor: ${product.sellerName}'),
              SizedBox(height: 10),
              Text('Email do Vendedor: ${product.sellerEmail}'),
              SizedBox(height: 10),
              Text('Telefone: ${product.sellerPhone}'),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  deleteProduct(product.id); // Passa o ID do produto
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.delete),
                    SizedBox(width: 5),
                    Text('Excluir'),
                  ],
                ),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Fechar'),
            ),
          ],
        );
      },
    );
  }

  void deleteProduct(String productId) async {
    final url = Uri.parse('http://10.8.30.139:8000/delete_product/$productId/');
    final response = await http.delete(url);

    if (response.statusCode == 204) {
      setState(() {
        products.removeWhere((product) => product.id == productId);
        filteredProducts.removeWhere((product) => product.id == productId);
      });
    } else {
      _showSnackBar(context, 'Erro ao excluir o produto');
    }
  }
}



  void navigateToRegisterProduct() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RegisterProduct()),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listar meus Produtos'),
      ),
      drawer: MenuDrawer(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              onChanged: filterProducts,
              decoration: InputDecoration(
                labelText: 'Pesquisar Produto',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: filteredProducts.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Nenhum produto cadastrado'),
                        SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: navigateToRegisterProduct,
                          child: Text('Cadastrar Produto'),
                        ),
                      ],
                    ),
                  )
                : GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: filteredProducts.length,
                    itemBuilder: (context, index) {
                      Product product = filteredProducts[index];
                      return GestureDetector(
                        onTap: () {
                          showProductDetails(product);
                        },
                        child: Card(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Image.network(
                                  product.imageUrl,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      product.name,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'R\$${product.value.toStringAsFixed(2)}',
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

class Product {
  final String id;
  final String name;
  final double value;
  final String imageUrl;
  final String description;
  final String sellerName;
  final String sellerEmail;
  final String sellerPhone;

  Product({
    required this.id,
    required this.name,
    required this.value,
    required this.imageUrl,
    required this.description,
    required this.sellerName,
    required this.sellerEmail,
    required this.sellerPhone,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'].toString(),
      name: json['name'],
      value: json['value'].toDouble(),
      imageUrl: json['profile'],
      description: json['description'],
      sellerName: json['owner_name'],
      sellerEmail: json['owner_email'],
      sellerPhone: json['owner_phone'],
    );
  }
}
