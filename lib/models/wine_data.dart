// lib/models/api_models.dart
class WineData {
  double fixed_acidity;
  double volatile_acidity;
  double citric_acid;
  double residual_sugar;
  double chlorides;
  double free_sulfur_dioxide;
  double total_sulfur_dioxide;
  double density;
  double pH;
  double sulphates;
  double alcohol;

  WineData({
    required this.fixed_acidity,
    required this.volatile_acidity,
    required this.citric_acid,
    required this.residual_sugar,
    required this.chlorides,
    required this.free_sulfur_dioxide,
    required this.total_sulfur_dioxide,
    required this.density,
    required this.pH,
    required this.sulphates,
    required this.alcohol,
  });

  Map<String, dynamic> toJson() {
    return {
      "fixed_acidity": fixed_acidity,
      "volatile_acidity": volatile_acidity,
      "citric_acid": citric_acid,
      "residual_sugar": residual_sugar,
      "chlorides": chlorides,
      "free_sulfur_dioxide": free_sulfur_dioxide,
      "total_sulfur_dioxide": total_sulfur_dioxide,
      "density": density,
      "pH": pH,
      "sulphates": sulphates,
      "alcohol": alcohol
    };
  }
}

class WineQuality {
  final double quality;

  WineQuality({required this.quality});

  factory WineQuality.fromJson(Map<String, dynamic> json) {
    return WineQuality(quality: json['quality']);
  }
}
