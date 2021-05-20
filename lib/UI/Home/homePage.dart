import 'package:challange_app/components/product_item.dart';
import 'package:challange_app/components/reminder_item.dart';
import 'package:challange_app/components/service_item.dart';
import 'package:challange_app/model/product.dart';
import 'package:challange_app/model/service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static String routeName = "/home";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Service> services = [
    Service(serviceName: 'Products', seviceImagePath: 'assets/pills.png'),
    Service(serviceName: 'Labs', seviceImagePath: 'assets/lab.png'),
    Service(serviceName: 'Doctors', seviceImagePath: 'assets/doctor.png'),
    Service(serviceName: 'Hospitals', seviceImagePath: 'assets/hospital.png'),
  ];
  final List<Product> recommendedproducts = [
    Product(
        descountPresent: null,
        productName: 'Dark kiss - Bath&Body Work…',
        productImagePath: 'assets/reco1.png',
        reviewsNumber: '(107 Reviews)',
        price: '765.00 EGP',
        oldPrice: "",
        savedMoney: "",
        rate: 3),
    Product(
        descountPresent: "-52%",
        productName: 'Stars travel size giftset Bath …',
        productImagePath: 'assets/reco2.png',
        reviewsNumber: '(7 Reviews)',
        price: '550.00 EGP',
        oldPrice: '1,010.00 EGP',
        savedMoney: 'You Saved 460.00 EGP ',
        rate: 4),
    Product(
        descountPresent: "-52%",
        productName: 'A thousands miles Bath&Bo…',
        productImagePath: 'assets/reco3.png',
        reviewsNumber: '(7 Reviews)',
        price: '550.00 EGP',
        oldPrice: '1,010.00 EGP',
        savedMoney: 'You Saved 460.00 EGP  ',
        rate: 4),
  ];
  final List<Product> mostSelling = [
    Product(
        descountPresent: null,
        productName: 'Organic Argan Oil For Hair&…',
        productImagePath: 'assets/most1.png',
        reviewsNumber: '(107 Reviews)',
        price: '650.00 EGP',
        oldPrice: "",
        savedMoney: "",
        rate: 3),
    Product(
        descountPresent: "-52%",
        productName: 'Stars travel size giftset Bath …',
        productImagePath: 'assets/most2.png',
        reviewsNumber: '(7 Reviews)',
        price: '550.00 EGP',
        oldPrice: '1,010.00 EGP',
        savedMoney: 'You Saved 460.00 EGP ',
        rate: 4),
    Product(
        descountPresent: "-52%",
        productName: 'A thousands miles Bath&Bo…',
        productImagePath: 'assets/most3.png',
        reviewsNumber: '(7 Reviews)',
        price: '550.00 EGP',
        oldPrice: '1,010.00 EGP',
        savedMoney: 'You Saved 460.00 EGP  ',
        rate: 4),
  ];
  int _currentindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(242, 244, 247, 1),
      appBar: buildAppbar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildSearchField(),
              SizedBox(
                height: 10,
              ),
              buildTrendingSection(),
              SizedBox(
                height: 8,
              ),
              buildServicesSection(),
              buildRemindersSection(),
              buildRecommendedSection(),
              buildMostSellingSection()
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentindex,
        fixedColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        unselectedLabelStyle: TextStyle(color: Colors.grey),
        onTap: (index) {
          setState(() {
            _currentindex = index;
          });
        },
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.receipt), label: "Recorde"),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: "Explore"),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_hospital), label: "Insurance "),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }

  Widget sectionName(String sectionName) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Text(
            sectionName,
            style: TextStyle(
                fontSize: 23, color: Colors.black, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }

  Widget buildAppbar() {
    return AppBar(
      backgroundColor: Color.fromRGBO(242, 244, 247, 1),
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 20,
          width: 20,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(90),
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("assets/profilePicture.png"))),
        ),
      ),
      title: Text(
        "Good evening Ali",
        style: TextStyle(color: Colors.black, fontSize: 14),
      ),
      actions: [
        IconButton(
            icon: Icon(
              Icons.menu,
              color: Color.fromRGBO(15, 90, 242, 1),
            ),
            onPressed: () {})
      ],
    );
  }

  Widget buildSearchField() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      padding: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15.0)),
      child: TextField(
        decoration: InputDecoration(
          hintText: "What are you looking for ?",
          border: InputBorder.none,
          icon: IconButton(onPressed: () {}, icon: Icon(Icons.search)),
        ),
      ),
    );
  }

  Widget buildTrendingSection() {
    return Column(
      children: [
        sectionName("Trending"),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.65,
                height: MediaQuery.of(context).size.height * 0.2,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/bannar.png"),
                        fit: BoxFit.fill)),
              ),
              Expanded(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  color: Color.fromRGBO(34, 64, 126, 1),
                  child: Stack(
                    children: [
                      Positioned(
                          bottom: 10,
                          right: 20,
                          left: 20,
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: Text(
                                "Learn More",
                                style: TextStyle(
                                    color: Colors.blueAccent, fontSize: 12),
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget buildServicesSection() {
    return Column(
      children: [
        sectionName("Our Services"),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.12,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: services.length,
                itemBuilder: (context, index) {
                  return ServiceItem(
                    service: services[index],
                  );
                }),
          ),
        )
      ],
    );
  }

  Widget buildRemindersSection() {
    return Column(
      children: [
        sectionName("Reminders"),
        RemiderItem("Dose Reminder", "Next Dosage", "assets/dose.png"),
        RemiderItem("Appointments", "See Your Next Appointment ",
            "assets/appointments.png")
      ],
    );
  }

  Widget buildRecommendedSection() {
    return Column(
      children: [
        sectionName("Recommended For You"),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.23,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: recommendedproducts.length,
                itemBuilder: (context, index) {
                  return ProductItem(
                    product: recommendedproducts[index],
                  );
                }),
          ),
        )
      ],
    );
  }

  Widget buildMostSellingSection() {
    return Column(
      children: [
        sectionName("Most Selling"),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.23,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: mostSelling.length,
                itemBuilder: (context, index) {
                  return ProductItem(
                    product: mostSelling[index],
                  );
                }),
          ),
        )
      ],
    );
  }
}
