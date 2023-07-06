import 'package:flutter/material.dart';
import 'package:myapp/page/listingproducts.dart';
import 'package:myapp/page/login.dart';
import 'package:myapp/controller/menu.dart';
import 'package:myapp/page/registerproduct.dart';
import 'package:url_launcher/url_launcher.dart';


class ListerProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Produto',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: ProductListScreen(),
    );
  }
}

class ProductListScreen extends StatefulWidget {
  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  List<Product> products = [
    Product(
      name: 'Produto 1',
      price: 10.99,
      imageUrl: 'assets/page/images/repolho.jpg',
      description: 'descrição do produto.',
      sellerName: 'Vendedor 1',
      sellerEmail: 'vendedor1@example.com',
      sellerPhone: '+55123456789',
    ),
    Product(
      name: 'Produto 2',
      price: 19.99,
      imageUrl: 'assets/page/images/repolho.jpg',
      description: 'descrição do produto.',
      sellerName: 'Vendedor 2',
      sellerEmail: 'vendedor2@example.com',
      sellerPhone: '+55987654321',
    ),
    Product(
      name: 'Produto 3',
      price: 5.99,
      imageUrl: 'assets/page/images/repolho.jpg',
      description: 'descrição do produto.',
      sellerName: 'Vendedor 3',
      sellerEmail: 'vendedor3@example.com',
      sellerPhone: '+55456789123',
    ),
    // Add more products as needed
  ];

  List<Product> filteredProducts = [];

  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredProducts = products;
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Produtos'),
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
                              Text('R\$${product.price.toStringAsFixed(2)}'),
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

// EXEMPLO DE DADOS
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
}
