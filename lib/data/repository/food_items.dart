// // repositories/menu_repository.dart

// enum FoodCategory { veg, nonVeg }

// class MenuRepository {
//   final List<MenuItem> _allItems = [
    
//     // HYDERABADI BIRYANI & RICE - The Crown Jewels
//     MenuItem(id: '1', name: 'Hyderabadi Mutton Dum Biryani', price: 380.0, category: FoodCategory.nonVeg),
//     MenuItem(id: '2', name: 'Hyderabadi Chicken Dum Biryani', price: 320.0, category: FoodCategory.nonVeg),
//     MenuItem(id: '3', name: 'Kachchi Gosht Biryani', price: 420.0, category: FoodCategory.nonVeg),
//     MenuItem(id: '4', name: 'Hyderabadi Veg Dum Biryani', price: 220.0, category: FoodCategory.veg),
//     MenuItem(id: '5', name: 'Zafrani Pulao', price: 180.0, category: FoodCategory.veg),
//     MenuItem(id: '6', name: 'Keema Biryani', price: 350.0, category: FoodCategory.nonVeg),
    
//     // FAMOUS HYDERABADI NON-VEG SPECIALTIES
//     MenuItem(id: '7', name: 'Hyderabadi Haleem', price: 150.0, category: FoodCategory.nonVeg),
//     MenuItem(id: '8', name: 'Patthar Ka Gosht', price: 280.0, category: FoodCategory.nonVeg),
//     MenuItem(id: '9', name: 'Nihari', price: 240.0, category: FoodCategory.nonVeg),
//     MenuItem(id: '10', name: 'Boti Kebab', price: 220.0, category: FoodCategory.nonVeg),
//     MenuItem(id: '11', name: 'Seekh Kebab', price: 200.0, category: FoodCategory.nonVeg),
//     MenuItem(id: '12', name: 'Lukhmi', price: 35.0, category: FoodCategory.nonVeg),
//     MenuItem(id: '13', name: 'Chicken 65 (Hyderabadi Style)', price: 180.0, category: FoodCategory.nonVeg),
//     MenuItem(id: '14', name: 'Hyderabadi Marag', price: 200.0, category: FoodCategory.nonVeg),
//     MenuItem(id: '15', name: 'Paya Curry', price: 220.0, category: FoodCategory.nonVeg),
//     MenuItem(id: '16', name: 'Bagara Gosht', price: 320.0, category: FoodCategory.nonVeg),
//     MenuItem(id: '17', name: 'Kheema Do Pyaza', price: 250.0, category: FoodCategory.nonVeg),
    
//     // HYDERABADI VEG SPECIALTIES
//     MenuItem(id: '18', name: 'Bagara Baingan', price: 140.0, category: FoodCategory.veg),
//     MenuItem(id: '19', name: 'Mirchi Ka Salan', price: 120.0, category: FoodCategory.veg),
//     MenuItem(id: '20', name: 'Dalcha', price: 110.0, category: FoodCategory.veg),
//     MenuItem(id: '21', name: 'Tamatar Ka Kut', price: 100.0, category: FoodCategory.veg),
//     MenuItem(id: '22', name: 'Khatti Dal', price: 90.0, category: FoodCategory.veg),
//     MenuItem(id: '23', name: 'Bagara Khana (Veg)', price: 160.0, category: FoodCategory.veg),
    
//     // HYDERABADI BREADS & ACCOMPANIMENTS
//     MenuItem(id: '24', name: 'Sheermal', price: 25.0, category: FoodCategory.veg),
//     MenuItem(id: '25', name: 'Roomali Roti', price: 20.0, category: FoodCategory.veg),
//     MenuItem(id: '26', name: 'Hyderabadi Naan', price: 35.0, category: FoodCategory.veg),
//     MenuItem(id: '27', name: 'Taftan', price: 30.0, category: FoodCategory.veg),
//     MenuItem(id: '28', name: 'Raita (Hyderabadi Style)', price: 60.0, category: FoodCategory.veg),
//     MenuItem(id: '29', name: 'Dahi Chutney', price: 40.0, category: FoodCategory.veg),
//     MenuItem(id: '30', name: 'Shorba (Soup)', price: 80.0, category: FoodCategory.veg),
    
//     // HYDERABADI STREET FOOD
//     MenuItem(id: '31', name: 'Punugulu', price: 60.0, category: FoodCategory.veg),
//     MenuItem(id: '32', name: 'Karachi Biscuit', price: 15.0, category: FoodCategory.veg),
//     MenuItem(id: '33', name: 'Osmania Biscuit', price: 20.0, category: FoodCategory.veg),
//     MenuItem(id: '34', name: 'Samosa (Hyderabadi)', price: 25.0, category: FoodCategory.veg),
//     MenuItem(id: '35', name: 'Kachori', price: 30.0, category: FoodCategory.veg),
//     MenuItem(id: '36', name: 'Dil Pasand', price: 40.0, category: FoodCategory.veg),
    
//     // AUTHENTIC HYDERABADI DESSERTS & SWEETS
//     MenuItem(id: '37', name: 'Qubani Ka Meetha', price: 90.0, category: FoodCategory.veg),
//     MenuItem(id: '38', name: 'Double Ka Meetha (Shahi Tukda)', price: 80.0, category: FoodCategory.veg),
//     MenuItem(id: '39', name: 'Sheer Khurma', price: 85.0, category: FoodCategory.veg),
//     MenuItem(id: '40', name: 'Hyderabadi Kheer', price: 75.0, category: FoodCategory.veg),
//     MenuItem(id: '41', name: 'Mauz Ka Meetha', price: 70.0, category: FoodCategory.veg),
//     MenuItem(id: '42', name: 'Shahjahani Meetha', price: 95.0, category: FoodCategory.veg),
//     MenuItem(id: '43', name: 'Badam Ki Jali', price: 120.0, category: FoodCategory.veg),
//     MenuItem(id: '44', name: 'Ariselu (Bellam Ariselu)', price: 60.0, category: FoodCategory.veg),
//     MenuItem(id: '45', name: 'Putharekulu', price: 150.0, category: FoodCategory.veg),
//     MenuItem(id: '46', name: 'Gavvalu', price: 80.0, category: FoodCategory.veg),
//     MenuItem(id: '47', name: 'Tapeshwaram Kaja', price: 100.0, category: FoodCategory.veg),
//     MenuItem(id: '48', name: 'Badusha', price: 45.0, category: FoodCategory.veg),
//     MenuItem(id: '49', name: 'Annamayya Laddu', price: 35.0, category: FoodCategory.veg),
//     MenuItem(id: '50', name: 'Phirni', price: 65.0, category: FoodCategory.veg),
//     MenuItem(id: '51', name: 'Seviyan Ka Meetha', price: 70.0, category: FoodCategory.veg),
//     MenuItem(id: '52', name: 'Kaddu Ki Kheer', price: 60.0, category: FoodCategory.veg),
//     MenuItem(id: '53', name: 'Dry Fruit Kheer', price: 110.0, category: FoodCategory.veg),
//     MenuItem(id: '54', name: 'Dudhi Ki Kheer', price: 55.0, category: FoodCategory.veg),
    
//     // CHAI & BEVERAGES - HYDERABADI SPECIALTIES
//     MenuItem(id: '55', name: 'Irani Chai', price: 30.0, category: FoodCategory.veg),
//     MenuItem(id: '56', name: 'Hyderabadi Cutting Chai', price: 15.0, category: FoodCategory.veg),
//     MenuItem(id: '57', name: 'Sulaimani Chai', price: 25.0, category: FoodCategory.veg),
//     MenuItem(id: '58', name: 'Kesar Chai', price: 40.0, category: FoodCategory.veg),
//     MenuItem(id: '59', name: 'Masala Chai (Hyderabadi)', price: 20.0, category: FoodCategory.veg),
//     MenuItem(id: '60', name: 'Adrak Chai', price: 25.0, category: FoodCategory.veg),
//     MenuItem(id: '61', name: 'Doodh Patti', price: 35.0, category: FoodCategory.veg),
//     MenuItem(id: '62', name: 'Green Tea (Hyderabadi Style)', price: 30.0, category: FoodCategory.veg),
//     MenuItem(id: '63', name: 'Kahwa', price: 45.0, category: FoodCategory.veg),
//     MenuItem(id: '64', name: 'Sharbat-e-Sandal', price: 50.0, category: FoodCategory.veg),
//     MenuItem(id: '65', name: 'Rose Milk', price: 40.0, category: FoodCategory.veg),
//     MenuItem(id: '66', name: 'Thandai', price: 60.0, category: FoodCategory.veg),
//     MenuItem(id: '67', name: 'Lassi (Hyderabadi)', price: 50.0, category: FoodCategory.veg),
    
//     // HYDERABADI FUSION & MODERN
//     MenuItem(id: '68', name: 'Hyderabadi Chicken Tikka', price: 240.0, category: FoodCategory.nonVeg),
//     MenuItem(id: '69', name: 'Mutton Pepper Fry', price: 320.0, category: FoodCategory.nonVeg),
//     MenuItem(id: '70', name: 'Hyderabadi Fish Curry', price: 220.0, category: FoodCategory.nonVeg),
//     MenuItem(id: '71', name: 'Egg Biryani (Hyderabadi)', price: 180.0, category: FoodCategory.nonVeg),
//     MenuItem(id: '72', name: 'Chicken Korma (Hyderabadi)', price: 260.0, category: FoodCategory.nonVeg),
    
//     // TRADITIONAL HYDERABADI BREAKFAST
//     MenuItem(id: '73', name: 'Keema Pav', price: 80.0, category: FoodCategory.nonVeg),
//     MenuItem(id: '74', name: 'Bun Maska', price: 35.0, category: FoodCategory.veg),
//     MenuItem(id: '75', name: 'Dum Ka Roat', price: 45.0, category: FoodCategory.veg),
//     MenuItem(id: '76', name: 'Hyderabadi Omelette', price: 50.0, category: FoodCategory.nonVeg),
//     MenuItem(id: '77', name: 'Khichdi (Hyderabadi)', price: 90.0, category: FoodCategory.veg),
    
//     // SEASONAL HYDERABADI SPECIALS
//     MenuItem(id: '78', name: 'Mango Kulfi', price: 60.0, category: FoodCategory.veg),
//     MenuItem(id: '79', name: 'Faluda', price: 80.0, category: FoodCategory.veg),
//     MenuItem(id: '80', name: 'Rabri', price: 70.0, category: FoodCategory.veg),
//   ];

//   // Get all items
//   List<MenuItem> getAllItems() => _allItems;

//   // Get only vegetarian items
//   List<MenuItem> getVegItems() => _allItems
//       .where((item) => item.category == FoodCategory.veg)
//       .toList();

//   // Get only non-vegetarian items  
//   List<MenuItem> getNonVegItems() => _allItems
//       .where((item) => item.category == FoodCategory.nonVeg)
//       .toList();

//   // Get Hyderabadi Biryani varieties
//   List<MenuItem> getBiryaniItems() => _allItems
//       .where((item) => item.name.toLowerCase().contains('biryani'))
//       .toList();

//   // Get Traditional Hyderabadi Desserts
//   List<MenuItem> getHyderabadiDesserts() => _allItems
//       .where((item) => [
//         'Qubani Ka Meetha', 'Double Ka Meetha (Shahi Tukda)', 'Sheer Khurma',
//         'Hyderabadi Kheer', 'Mauz Ka Meetha', 'Shahjahani Meetha', 'Badam Ki Jali',
//         'Ariselu (Bellam Ariselu)', 'Putharekulu', 'Gavvalu', 'Tapeshwaram Kaja',
//         'Badusha', 'Annamayya Laddu', 'Phirni', 'Seviyan Ka Meetha', 'Kaddu Ki Kheer',
//         'Dry Fruit Kheer', 'Dudhi Ki Kheer'
//       ].contains(item.name))
//       .toList();

//   // Get All Chai varieties
//   List<MenuItem> getChaiVarieties() => _allItems
//       .where((item) => item.name.toLowerCase().contains('chai') || 
//                       item.name.toLowerCase().contains('tea') ||
//                       ['Kahwa', 'Sulaimani Chai', 'Doodh Patti'].contains(item.name))
//       .toList();

//   // Get Famous Hyderabadi Specialties
//   List<MenuItem> getHyderabadiSpecialties() => _allItems
//       .where((item) => [
//         'Hyderabadi Mutton Dum Biryani', 'Hyderabadi Chicken Dum Biryani',
//         'Hyderabadi Haleem', 'Patthar Ka Gosht', 'Nihari', 'Bagara Baingan',
//         'Mirchi Ka Salan', 'Qubani Ka Meetha', 'Double Ka Meetha (Shahi Tukda)',
//         'Irani Chai', 'Osmania Biscuit', 'Lukhmi'
//       ].contains(item.name))
//       .toList();

//   // Search items by name
//   List<MenuItem> searchItems(String query) {
//     if (query.isEmpty) return _allItems;
    
//     return _allItems.where((item) => 
//       item.name.toLowerCase().contains(query.toLowerCase())
//     ).toList();
//   }

//   // Search items by category (veg/non-veg)
//   List<MenuItem> searchItemsByCategory(String query, FoodCategory? category) {
//     List<MenuItem> itemsToSearch = category != null 
//         ? _allItems.where((item) => item.category == category).toList()
//         : _allItems;
    
//     if (query.isEmpty) return itemsToSearch;
    
//     return itemsToSearch.where((item) => 
//       item.name.toLowerCase().contains(query.toLowerCase())
//     ).toList();
//   }

//   // Get items by price range
//   List<MenuItem> getItemsByPriceRange(double minPrice, double maxPrice) =>
//       _allItems.where((item) => 
//         item.price >= minPrice && item.price <= maxPrice
//       ).toList();
// }
