import 'package:flutter/material.dart';
import 'package:paypal/config/theme/app_theme.dart';
import 'presentation/views/carousel_card.dart';
import 'presentation/views/section_botons.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;

  // Track the selected index
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme().theme(),
      debugShowCheckedModeBanner: false,
      title: 'Paypal App',
      home: Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          backgroundColor: Colors.grey[300],
          title: Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Center(
              child: Text(
                'Home',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[900],
                ),
              ),
            ),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 30),
              child: Icon(Icons.edit_notifications),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          onTap: _onItemTapped,
        ),
        backgroundColor: Colors.grey[300],
        body: SizedBox.expand(
          child: Column(
            children: [
              const ContainerCarousel(),
              const SizedBox(height: 30),
              const SectionBotons(),
              const SizedBox(height: 30),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Transaction",
                      style: TextStyle(
                        fontSize: 23,
                        color: Color.fromARGB(255, 5, 32, 73),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "View all",
                      style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 5, 32, 73),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                    ),
                    child: ListView.builder(
                      itemCount: _transactionData.length,
                      itemBuilder: (context, index) {
                        final item = _transactionData[index];
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (index == 0 ||
                                _transactionData[index].date !=
                                    _transactionData[index - 1].date)
                              Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child: Text(
                                  item.date,
                                  style: const TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ListTile(
                              contentPadding: EdgeInsets.zero,
                              leading: CircleAvatar(
                                radius: 30,
                                child: Image.network(item.imageUrl),
                              ),
                              title: Text(item.title),
                              subtitle: Text(item.subtitle),
                              trailing: Text(
                                item.amount,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: item.amount.contains('-')
                                      ? Colors.red
                                      : Colors.green,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Transaction {
  final String date;
  final String imageUrl;
  final String title;
  final String subtitle;
  final String amount;

  Transaction({
    required this.date,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.amount,
  });
}

final List<Transaction> _transactionData = [
  Transaction(
    date: '5 September 2024',
    imageUrl:
        'https://static.vecteezy.com/system/resources/previews/018/930/572/non_2x/youtube-logo-youtube-icon-transparent-free-png.png',
    title: 'Youtube Ads.',
    subtitle: '"Income"',
    amount: '+ \$421.00',
  ),
  Transaction(
    date: '5 September 2024',
    imageUrl:
        'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhIHO6OHLL4Bxl-CfG1C9iszyTsqLC6jCHrMECzKNPOIbVUGwci--XzYl6WZC4sypCuixEVrWRU5g5NLU4prRoQ0asEvBWnm_HZcxXt9yBkDCTHn9NIVDqPe2AwuXaPZVR8F--VOGVvsGlKg7f-VtFjtgCFn0_LGhKxxKgb4IYkjCdEEzcWfLA5uvah/s1328/1671574095469.jpg',
    title: 'Luciana Vasquez.',
    subtitle: '"Pay month"',
    amount: '- \$821.00',
  ),
  Transaction(
    date: '28 August 2024',
    imageUrl:
        'https://static.vecteezy.com/system/resources/previews/018/930/572/non_2x/youtube-logo-youtube-icon-transparent-free-png.png',
    title: 'Youtube Ads.',
    subtitle: '"Income"',
    amount: '+ \$755.00',
  ),
  Transaction(
    date: '28 August 2024',
    imageUrl:
        'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhIHO6OHLL4Bxl-CfG1C9iszyTsqLC6jCHrMECzKNPOIbVUGwci--XzYl6WZC4sypCuixEVrWRU5g5NLU4prRoQ0asEvBWnm_HZcxXt9yBkDCTHn9NIVDqPe2AwuXaPZVR8F--VOGVvsGlKg7f-VtFjtgCFn0_LGhKxxKgb4IYkjCdEEzcWfLA5uvah/s1328/1671574095469.jpg',
    title: 'Youtube Ads.',
    subtitle: '"Income"',
    amount: '- \$821.00',
  ),
  Transaction(
    date: '20 July 2024',
    imageUrl:
        'https://static.vecteezy.com/system/resources/previews/018/930/572/non_2x/youtube-logo-youtube-icon-transparent-free-png.png',
    title: 'Youtube Ads.',
    subtitle: '"Income"',
    amount: '+ \$755.00',
  ),
  Transaction(
    date: '20 July 2024',
    imageUrl:
        'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhIHO6OHLL4Bxl-CfG1C9iszyTsqLC6jCHrMECzKNPOIbVUGwci--XzYl6WZC4sypCuixEVrWRU5g5NLU4prRoQ0asEvBWnm_HZcxXt9yBkDCTHn9NIVDqPe2AwuXaPZVR8F--VOGVvsGlKg7f-VtFjtgCFn0_LGhKxxKgb4IYkjCdEEzcWfLA5uvah/s1328/1671574095469.jpg',
    title: 'Youtube Ads.',
    subtitle: '"Income"',
    amount: '- \$821.00',
  ),
  // Add more transactions here if needed
];
