import 'package:flutter/material.dart';
import 'package:myapp/controller/menu.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ListerProducts extends StatelessWidget {
  final int userId;

  ListerProducts({required this.userId});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Produto',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: ProductListScreen(userId: userId,),
    );
  }
}

class ProductListScreen extends StatefulWidget {
  final int userId;

  ProductListScreen({required this.userId});

  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  bool isLoading = true;
  List<Product> products = [];
  List<Product> filteredProducts = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    final url = Uri.parse('http://10.8.30.139:8000/list_product/');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> responseData = jsonDecode(response.body);
      final List<Product> fetchedProducts =
          responseData.map((data) => Product.fromJson(data)).toList();

      setState(() {
        products = fetchedProducts;
        filteredProducts = products;
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
      _showSnackBar(context, 'Erro ao carregar os produtos');
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
              Text('Preço: R\$${product.price.toStringAsFixed(2)}'),
              SizedBox(height: 10),
              Text('Descrição: ${product.description}'),
              SizedBox(height: 10),
              Text('Vendedor: ${product.sellerName}'),
              Text('Email do Vendedor: ${product.sellerEmail}'),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  launchWhatsApp(product.sellerPhone);
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.chat),
                    SizedBox(width: 5),
                    Text('Entrar em Contato'),
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

  void launchWhatsApp(String phone) async {
    final whatsappUrl = "https://web.whatsapp.com/$phone";
    if (await canLaunch(whatsappUrl)) {
      await launch(whatsappUrl);
    } else {
      throw 'Não foi possível abrir o WhatsApp';
    }
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
        title: Text('Lista de Produtos'),
      ),
      drawer: MenuDrawer(userId: widget.userId),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: searchController,
                    onChanged: filterProducts,
                    decoration: InputDecoration(
                      labelText: 'Pesquisar Produtos',
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
                Expanded(
                  child: GridView.builder(
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
                                        'R\$${product.price.toStringAsFixed(2)}'),
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
  final String name;
  final double price;
  final String imageUrl;
  final String description;
  final String sellerName;
  final String sellerEmail;
  final String sellerPhone;

  Product({
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.description,
    required this.sellerName,
    required this.sellerEmail,
    required this.sellerPhone,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['name'],
      price: json['value'].toDouble(),
      imageUrl: json['profile'],
      description: json['description'],
      sellerName: json['owner_name'],
      sellerEmail: json['owner_email'],
      sellerPhone: json['owner_phone'],
    );
  }
}

