import 'package:flutter/material.dart';
import 'package:sliver_appbar/garage_page.dart';
import 'package:sliver_appbar/market_page.dart';
import 'package:sliver_appbar/ride_page_common.dart';
import 'package:sliver_appbar/stories_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.red, Colors.orange],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: SafeArea(
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.menu, color: Colors.white),
                  onPressed: () {},
                ),
                const SizedBox(
                  width: 9,
                ),
                const Text(
                  'SURAJ ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    const CircleAvatar(
                        backgroundImage: AssetImage('assets/hppay.png')),
                    IconButton(
                      icon: const Icon(Icons.notifications,
                          size: 30, color: Colors.white),
                      onPressed: () {},
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                        ),
                        child: const Text(
                          'SOS',
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    commonContainerWidget("8 DAYBIKE TRIP TO LEH LADAKH",
                        "Register Now", 200, 80, false),
                    const SizedBox(height: 10),
                    const Text(
                      "EVENTS FOR YOU",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    commonContainerWidget("TVS\n2019 HYDERABAD\nRIDERS MEETUP",
                        "2000-8000 INR", 220, 40, true),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            SliverPersistentHeader(
              floating: false,
              pinned: true,
              delegate: _SliverAppBarDelegate(
                TabBar(
                  controller: _tabController,
                  tabs: const [
                    Tab(text: 'Rides'),
                    Tab(text: 'Stories'),
                    Tab(text: 'Market'),
                    Tab(text: 'Garage'),
                  ],
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  indicator: BoxDecoration(),
                ),
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: [
            RidesPage(),
            StoriesPage(),
            MarketPage(),
            GaragePage(),
          ],
        ),
      ),
    );
  }

  Container commonContainerWidget(String name, String button, double height,
      double heightBetweenText, bool namet) {
    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: const DecorationImage(
          image: AssetImage('assets/bike.avif'),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 8, right: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            namet
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          topRight:
                              Radius.circular(20), // Rounded top-left corner
                        ),
                        child: Container(
                          color: const Color.fromARGB(255, 212, 191,
                              2), // You can change this to any color you like
                          width: 60.0, // Adjust the width as needed
                          height: 40.0,
                          child: const Center(
                              child: Text(
                            "Invited",
                            style: TextStyle(color: Colors.white),
                          )),
                        ),
                      ),
                    ],
                  )
                : const SizedBox(),
            const SizedBox(height: 10),
            Text(
              name,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: heightBetweenText),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 212, 191, 2),
                textStyle: const TextStyle(fontWeight: FontWeight.bold),
              ),
              child: Text(
                button,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;

  _SliverAppBarDelegate(this.tabBar);

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Material(
      //elevation: 0, // Remove shadow by setting elevation to 0
      color: const Color.fromARGB(255, 238, 238,
          238), // Optional: set background color to white or any other color
      child: tabBar,
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

class RidesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 238, 238),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: 3, // Number of ride items
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: RideCard(
              title: 'ride to ${['cochi', 'vayanad', 'kerala'][index]} hills',
              organizerName: 'manish surapaneni',
              bikeName: 'TVS',
              distance: '900 km',
              date: 'July 20 2024',
              location: 'hyderabad',
              coRiders: 12,
              imagePath: 'assets/bike.avif', // Add your image asset
            ),
          );
        },
      ),
    );
  }
}
