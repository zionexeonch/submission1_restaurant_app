class Menu {
  final String name;
  final String
      pictureUrl; // Tambahkan properti ini untuk menyimpan URL gambar menu

  Menu({
    required this.name,
    required this.pictureUrl,
  });

  factory Menu.fromJson(Map<String, dynamic> json) {
    return Menu(
      name: json['name'],
      pictureUrl:
          json['pictureUrl'], // Sesuaikan dengan kunci yang ada pada data JSON
    );
  }
}

class Menus {
  final List<Menu> foods;
  final List<Menu> drinks;

  Menus({
    required this.foods,
    required this.drinks,
  });

  factory Menus.fromJson(Map<String, dynamic> json) {
    return Menus(
      foods:
          (json['foods'] as List).map((food) => Menu.fromJson(food)).toList(),
      drinks: (json['drinks'] as List)
          .map((drink) => Menu.fromJson(drink))
          .toList(),
    );
  }
}

class Restaurant {
  final String id;
  final String name;
  final String description;
  final String pictureId;
  final String city;
  final double rating;
  final Menus menus; // Ganti properti menu dengan menggunakan objek Menus

  Restaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
    required this.menus,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      pictureId: json['pictureId'],
      city: json['city'],
      rating: json['rating'].toDouble(),
      menus: Menus.fromJson(json['menus']),
    );
  }
}
