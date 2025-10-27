import 'package:flutter/material.dart';

void main() {
runApp(const MyApp());
}

class MyApp extends StatelessWidget {
const MyApp({super.key});

@override
Widget build(BuildContext context) {
return MaterialApp(
debugShowCheckedModeBanner: false,
title: 'Kripik Pisang Manis',
theme: ThemeData(
colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
useMaterial3: true,
),
home: const MainPage(),
);
}
}

class MainPage extends StatefulWidget {
const MainPage({super.key});

@override
State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
int _selectedIndex = 0;

final List<Widget> _pages = [
const HomePage(),
const ProductPage(),
const AboutPage(),
];

void _onItemTapped(int index) {
setState(() {
_selectedIndex = index;
});
}

@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: const Text("Kripik Pisang Manis"),
backgroundColor: Colors.orange,
foregroundColor: Colors.white,
),
body: _pages[_selectedIndex],
bottomNavigationBar: BottomNavigationBar(
currentIndex: _selectedIndex,
selectedItemColor: Colors.orange,
onTap: _onItemTapped,
items: const [
BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: 'Produk'),
BottomNavigationBarItem(icon: Icon(Icons.info), label: 'Tentang'),
],
),
);
}
}

class HomePage extends StatelessWidget {
const HomePage({super.key});

@override
Widget build(BuildContext context) {
return const Center(
child: Padding(
padding: EdgeInsets.all(16.0),
child: Text(
"Selamat datang di Aplikasi Kripik Pisang Manis! "
"Nikmati cita rasa kripik pisang renyah dengan berbagai varian rasa "
"seperti cokelat, madu, dan keju!",
style: TextStyle(fontSize: 18, height: 1.4),
textAlign: TextAlign.center,
),
),
);
}
}

class ProductPage extends StatelessWidget {
const ProductPage({super.key});

final List<Map<String, dynamic>> products = const [
{"name": "Kripik Pisang Cokelat", "price": 15000, "desc": "Kripik pisang manis dilapisi cokelat lezat."},
{"name": "Kripik Pisang Keju", "price": 16000, "desc": "Renyahnya pisang berpadu gurihnya keju."},
{"name": "Kripik Pisang Madu", "price": 14000, "desc": "Manis alami dari madu pilihan."},
];

@override
Widget build(BuildContext context) {
return ListView.builder(
itemCount: products.length,
itemBuilder: (context, index) {
final product = products[index];
return Card(
margin: const EdgeInsets.all(12),
child: ListTile(
title: Text(
product['name'],
style: const TextStyle(fontWeight: FontWeight.bold),
),
subtitle: Text("Rp ${product['price']}"),
trailing: const Icon(Icons.arrow_forward_ios, size: 16),
onTap: () {
Navigator.push(
context,
MaterialPageRoute(
builder: (_) => ProductDetailPage(
name: product['name'],
price: product['price'],
desc: product['desc'],
),
),
);
},
),
);
},
);
}
}

class ProductDetailPage extends StatelessWidget {
final String name;
final int price;
final String desc;

const ProductDetailPage({
super.key,
required this.name,
required this.price,
required this.desc,
});

@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: const Text("Detail Produk"),
backgroundColor: Colors.orange,
),
body: Padding(
padding: const EdgeInsets.all(16.0),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text(name, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
const SizedBox(height: 8),
Text("Harga: Rp $price", style: const TextStyle(fontSize: 18)),
const SizedBox(height: 16),
Text(desc, style: const TextStyle(fontSize: 16, height: 1.4)),
const Spacer(),
SizedBox(
width: double.infinity,
child: ElevatedButton.icon(
icon: const Icon(Icons.arrow_back),
label: const Text("Kembali"),
onPressed: () => Navigator.pop(context),
),
),
],
),
),
);
}
}

class AboutPage extends StatelessWidget {
const AboutPage({super.key});

@override
Widget build(BuildContext context) {
return const Center(
child: Padding(
padding: EdgeInsets.all(16.0),
child: Text(
"Aplikasi ini dibuat untuk mempromosikan produk Kripik Pisang Manis "
"hasil olahan petani lokal. Dikembangkan menggunakan Flutter "
"sebagai bagian dari tugas UAS.",
style: TextStyle(fontSize: 18, height: 1.4),
textAlign: TextAlign.center,
),
),
);
}
}
