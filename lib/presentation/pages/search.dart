// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:travel_app/core/models/model.dart';
import 'package:travel_app/core/routing/app_route.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/core/useCase/home.dart';
import 'package:travel_app/presentation/widget/judul.dart';
import 'package:travel_app/presentation/widget/popular.dart';

class SearchScreen extends StatefulWidget {
  final int categoryID;
  final String? searchQuery;

  const SearchScreen({
    super.key,
    required this.categoryID,
    this.searchQuery,
  });

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  List<DetailWisata> filtered = [];
  List<Categories> dataCategory = [];
  int selectedCategoryID = 0; // Menyimpan kategori yang dipilih
  int selectedRating = 0;
  RangeValues selectedPriceRange = RangeValues(100, 1000000);

  @override
  void initState() {
    super.initState();
    selectedCategoryID = widget.categoryID;
    getCategories();
    filteredData();
  }

  // Mendapatkan data kategori dari backend
  void getCategories() async {
    final controller = HomeController();
    var categories = await controller.getCategories();
    setState(() {
      dataCategory = categories;
    });
  }

  // Filter data berdasarkan kategori, query pencarian, rating, dan harga
  void filteredData({String? searchQuery}) async {
    final controller = HomeController();
    var rawData = await controller.getWisata();

    List<DetailWisata> data;
    if (rawData is List<Map<String, List<DetailWisata>>>) {
      data = rawData.expand((map) => map.values.expand((list) => list)).toList();
    } else if (rawData is List<DetailWisata>) {
      data = rawData;
    } else {
      print("Error: Unexpected data format");
      return;
    }

    List<DetailWisata> isi;

    String query = searchQuery ?? widget.searchQuery ?? "";

    // Filter berdasarkan query pencarian
    if (query.isNotEmpty) {
      isi = data
          .where((item) =>
              item.namawisata.toLowerCase().contains(query.toLowerCase()))
          .toList();
    } else if (selectedCategoryID != 0) {
      // Filter berdasarkan kategori
      isi = data.where((item) => item.idCategory == selectedCategoryID).toList();
    } else {
      isi = data;
    }

    // Filter berdasarkan rating
    if (selectedRating > 0 && selectedRating <= 5) {
      isi = isi
          .where((item) => item.ratingWisata.toInt() == selectedRating)
          .toList();
    }

    // Filter berdasarkan harga
    if (selectedPriceRange.start > 100 || selectedPriceRange.end < 1000000) {
      isi = isi
          .where((item) =>
              item.hargaWisata >= selectedPriceRange.start &&
              item.hargaWisata <= selectedPriceRange.end)
          .toList();
    }

    setState(() {
      filtered = isi;
    });

    if (filtered.isEmpty) {
      print("Hasil tidak ditemukan.");
    }
  }

  // Menampilkan modal filter
  void showFilterSheet() {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      isScrollControlled: true,
      builder: (context) {
        int tempRating = selectedRating;
        RangeValues tempPriceRange = selectedPriceRange;

        return StatefulBuilder(
          builder: (context, setModalState) {
            return Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Range Price"),
                  RangeSlider(
                    values: tempPriceRange,
                    min: 100,
                    max: 1000000,
                    divisions: 50,
                    labels: RangeLabels(
                      tempPriceRange.start.toStringAsFixed(0),
                      tempPriceRange.end.toStringAsFixed(0),
                    ),
                    onChanged: (values) {
                      setModalState(() => tempPriceRange = values);
                    },
                  ),
                  SizedBox(height: 16),
                  Text("Star Review"),
                  Row(
                    children: List.generate(5, (index) {
                      return IconButton(
                        icon: Icon(
                          Icons.star,
                          color:
                              index < tempRating ? Colors.amber : Colors.grey,
                        ),
                        onPressed: () {
                          setModalState(() => tempRating = index + 1);
                        },
                      );
                    }),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          setState(() {
                            selectedRating = 0;
                            selectedPriceRange = RangeValues(100, 1000000);
                            filteredData(); // Reset filter
                          });
                          Navigator.pop(context);
                        },
                        child: Text("Clear All"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            selectedRating = tempRating;
                            selectedPriceRange = tempPriceRange;
                          });
                          filteredData();
                          Navigator.pop(context);
                        },
                        child: Text("Apply"),
                      ),
                    ],
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var tinggi = MediaQuery.of(context).size.height;
    var lebar = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            context.goNamed(Routes.home);
          },
        ),
        title: Text('Search'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list_alt),
            onPressed: () {
              showFilterSheet();
            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search bar
              Container(
                margin: EdgeInsets.only(bottom: tinggi * 0.03),
                child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    hintText: "Search destination",
                    suffixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    hintStyle: GoogleFonts.poppins(fontSize: 20),
                  ),
                  onChanged: (value) => filteredData(searchQuery: value),
                ),
              ),

              // Categories
              Text(
                "Choose Category",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Row(
                children: List.generate(
                  dataCategory.length,
                  (index) => InkWell(
                    onTap: () {
                      setState(() {
                        selectedCategoryID = dataCategory[index].id;
                        filteredData(); // Filter ulang data berdasarkan kategori
                      });
                    },
                    child: categoryContainer(
                      dataCategory[index].name,
                      dataCategory[index].image,
                      selectedCategoryID == dataCategory[index].id,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20),
              Judul("Data dari kategori yang dipilih", "", tinggi),

              // Results
              Container(
                margin: EdgeInsets.only(bottom: tinggi * 0.03),
                child: filtered.isEmpty
                    ? Center(
                        child: Text(
                          "Data not found",
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    : Wrap(
                        runSpacing: 30,
                        children: List.generate(
                          filtered.length,
                          (index) => Popular(
                            filtered[index].gambarwisata,
                            filtered[index].namawisata,
                            filtered[index].hargaWisata.toString(),
                            filtered[index].ratingWisata,
                            filtered[index].deskripsi,
                            lebar,
                            tinggi,
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

  Widget categoryContainer(String title, String img, bool isSelected) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.grey[200], // Warna tetap tanpa perubahan
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Image.network(
            img,
            width: 30,
            height: 30,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 5),
          Text(
            title,
            style: TextStyle(
              color: Colors.black, // Warna teks tetap hitam
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
