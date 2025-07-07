class MealMenuModel {

  factory MealMenuModel.fromJson(Map<String, dynamic> json) {
    return MealMenuModel(
      id: json['id'],
      name: json['name'],
      nameAr: json['nameAr'],
      description: json['description'],
      descriptionAr: json['descriptionAr'],
      weight: (json['weight'] as num?)?.toInt(),
      calories: (json['calories'] as num?)?.toInt(),
      fats: (json['fats'] as num?)?.toInt(),
      carbs: (json['carbs'] as num?)?.toInt(),
      proteins: (json['proteins'] as num?)?.toInt(),
      fibers: (json['fibers'] as num?)?.toInt(),
      type: json['type'] as int?,
      imageUrls: (json['imageUrls'] as List?)?.cast<String>(),
      recipeIngredients: (json['recipeIngredients'] as List?)
          ?.map((e) => RecipeIngredient.fromJson(e))
          .toList(),
      weightToPriceRatio: (json['weightToPriceRatio'] as num?)?.toInt(),
    );
  }
  MealMenuModel({
    this.id,
    this.name,
    this.nameAr,
    this.description,
    this.descriptionAr,
    this.weight,
    this.calories,
    this.fats,
    this.carbs,
    this.proteins,
    this.fibers,
    this.type,
    this.imageUrls,
    this.recipeIngredients,
    this.weightToPriceRatio,
  });

  final String? id;
  final String? name;
  final String? nameAr;
  final String? description;
  final String? descriptionAr;
  final int? weight;
  final int? calories;
  final int? fats;
  final int? carbs;
  final int? proteins;
  final int? fibers;
  final int? type;
  final List<String>? imageUrls;
  final List<RecipeIngredient>? recipeIngredients;
  final int? weightToPriceRatio;

  static List<MealMenuModel> fromJsonList(Map<String, dynamic> json) {
    final items = json['items'] as List<dynamic>?;

    if (items == null) return [];

    return items.map((item) => MealMenuModel.fromJson(item)).toList();
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'nameAr': nameAr,
      'description': description,
      'descriptionAr': descriptionAr,
      'weight': weight,
      'calories': calories,
      'fats': fats,
      'carbs': carbs,
      'proteins': proteins,
      'fibers': fibers,
      'type': type,
      'imageUrls': imageUrls,
      'recipeIngredients':
          recipeIngredients?.map((e) => e.toJson()).toList(),
      'weightToPriceRatio': weightToPriceRatio,
    };
  }
}

class RecipeIngredient {

  factory RecipeIngredient.fromJson(Map<String, dynamic> json) {
    return RecipeIngredient(
      ingredientId: json['ingredientId'],
      name: json['name'],
      nameAr: json['nameAr'],
      quantity: (json['quantity'] as num?)?.toInt(),
      isOptional: json['isOptional'] ?? false,
    );
  }
  RecipeIngredient({
    this.ingredientId,
    this.name,
    this.nameAr,
    this.quantity,
    this.isOptional = false,
  });

  final int? ingredientId;
  final String? name;
  final String? nameAr;
  final int? quantity;
  final bool isOptional;

  Map<String, dynamic> toJson() {
    return {
      'ingredientId': ingredientId,
      'name': name,
      'nameAr': nameAr,
      'quantity': quantity,
      'isOptional': isOptional,
    };
  }
}
