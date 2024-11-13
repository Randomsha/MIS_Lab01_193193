import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: '193193'), // Set your index number here
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    // Sample list of clothing items
    final clothingItems = [
      {
        'name': 'T-shirt',
        'description': 'A comfy cotton T-shirt',
        'price': '10eu',
        'image': 'assets/images/bluzon1.jpg'
      },
      {
        'name': 'Jeans',
        'description': 'Classic blue jeans',
        'price': '20eu',
        'image': 'assets/images/farmerki1.jpg'
      },
      {
        'name': 'Jacket',
        'description': 'Warm and cozy jacket',
        'price': '30eu',
        'image': 'assets/images/jakna1.jpg'
      },
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: ListView.builder(
        itemCount: clothingItems.length,
        itemBuilder: (context, index) {
          final item = clothingItems[index];
          return Card(
            child: ListTile(
              leading: Image.asset(item['image']!), 
              title: Text(item['name']!),
              subtitle: Text(item['price']!),
              onTap: () {
                // Navigate to the details screen with item details
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsScreen(item: item),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class DetailsScreen extends StatelessWidget {
  final Map<String, String> item;

  const DetailsScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item['name']!),
      ),
      body: SingleChildScrollView( // Make the body scrollable
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(item['image']!),
            const SizedBox(height: 16),
            Text(
              item['name']!,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 8),
            Text(item['description']!),
            const SizedBox(height: 16),
            Text(
              'Price: ${item['price']}',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ],
        ),
      ),
    );
  }
}


