import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_app/core/models/model.dart';
import 'package:travel_app/core/routing/app_route.dart';
import 'package:travel_app/core/useCase/home.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_app/presentation/widget/popular.dart';
import 'package:travel_app/presentation/widget/wisata.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Login? dataUser;
  TextEditingController searchQueryController = TextEditingController();
  List<Categories> dataCategories = [];
  List<DetailWisata> favorit = [];
  List<DetailWisata> populer = [];

  getData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      dataUser = loginFromJson(prefs.getString('login')!);
    });
    HomeController().getCategories().then((value) => setState((){
      if(value != null){
        dataCategories = value;
      }
    }),);

    HomeController().getWisata().then((value) => setState(() {
      print(value);
      if (value != null) {
        favorit = value[0]["favorit"];
        populer = value[0]["populer"];
      }
    }));
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double tinggi = MediaQuery.of(context).size.height;
    double lebar = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/img/beach.png'),
                    ),
                    SizedBox(width: 10),
                    Row(
                      children: [
                        Text(
                          "HI ${dataUser?.data.name} ",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ],
                ),
                Icon(Icons.notification_add, color: Colors.grey),
              ],
            ),
            SizedBox(height: 20),
            Text(
              "Where do you want to explore today?",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            TextField(
                controller: searchQueryController,
                decoration: InputDecoration(
                  hintText: "Search destination",
                  prefixIcon: Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
                onSubmitted: (value) {
                  if (value.isNotEmpty) {
                    context
                        .goNamed(Routes.search, extra: {'searchQuery': value});
                  }
                  // context.goNamed(Routes.search, extra: value),
                }),
            SizedBox(height: 20),
            Text(
              "Choose Category",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
                children: List.generate(
                    dataCategories.length,
                    (index) => InkWell(
                          onTap: () {
                            context.goNamed(Routes.search,
                                extra: {'categoryID': dataCategories[index].id});
                          },
                          child: categoryContainer(dataCategories[index].name,
                              dataCategories[index].image),
                        ))),
            SizedBox(height: 20),
            Text(
              "Favorite Place",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                child: Wrap(
                  spacing: 10,
                   children: List.generate(favorit.length, (index) => Wisata(favorit[index].gambarwisata, favorit[index].namawisata, favorit[index].lokasiwisata, favorit[index].ratingWisata.toString(), tinggi, lebar, context, false),)
                  
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Popular Package",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Explore",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
            SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: SizedBox(
                child: Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: List.generate(populer.length, (index) => InkWell(onTap: () => context.goNamed(Routes.detail, extra: populer[index]) , child: Popular(populer[index].gambarwisata, populer[index].namawisata, populer[index].hargaWisata.toString(), populer[index].ratingWisata, populer[index].deskripsi.substring(0, 123), lebar, tinggi)),),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

}
  Widget categoryContainer(String title, String img) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.grey[200],  
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Image.network(
            img,
          ),
          SizedBox(width: 5),
          Text(title),
        ],
     ),
);
}