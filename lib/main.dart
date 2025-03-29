import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class FoodItem extends StatelessWidget {
  final String name, dv;
  final int protein, fat, carbs, kcal;

  const FoodItem({
    super.key,
    required this.name,
    required this.protein,
    required this.fat,
    required this.carbs,
    required this.kcal,
    required this.dv,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 5),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("$kcal ", style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87)),
                  Text("kcal",style: TextStyle(color: Colors.grey),)
                ],
              ),
              Text(dv,style: TextStyle(color: Colors.grey),)
            ],
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildNutritionLabel("Protein", protein, Colors.purpleAccent),
              _buildNutritionLabel("Fat", fat, Colors.orangeAccent),
              _buildNutritionLabel("Carbs", carbs, Colors.greenAccent),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNutritionLabel(String label, int value, Color color) {
    return Column(
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 5),
        Row(
          children: [
            Container(
              height: 15,
              width: 15,
              decoration: BoxDecoration(color: color,),
            ),
            const SizedBox(width: 5),
            Text("$value g"),
          ],
        ),
      ],
    );
  }
}


  Widget _buildNutritionLabel(String label, double value, Color color) {
    return Column(
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 5),
        Row(
          children: [
            Container(
              height: 15,
              width: 15,
              decoration: BoxDecoration(color: color,),
            ),
            const SizedBox(width: 5),
            Text("$value g"),
          ],
        ),
      ],
    );
  }

class Nutrition extends StatelessWidget {
  final String text;
  final int intake, goal;
  final Color color;

  const Nutrition({super.key, required this.text, required this.intake, required this.goal, required this.color});

  @override
  Widget build(BuildContext context) {
    double progress = ((intake / goal).clamp(0.0, 1.0));
    double barWidth = (MediaQuery.of(context).size.width * 0.2);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 5),
        Stack(
          children: [
            Container(
              width: barWidth,
              height: 5,
              decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(5)),
            ),
            Container(
              width: progress * barWidth,
              height: 5,
              decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(5)),
            ),
          ],
        ),
        const SizedBox(height: 5),
        Text("$intake / $goal g"),
      ],
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Map<String, dynamic>> events = [
    {"name": "Pate", "protein": 12, "fat": 12, "carbs": 12, "kcal": 400, "dv": "50g"},
    {"name": "Hạt", "protein": 30, "fat": 15, "carbs": 40, "kcal": 350, "dv": "100g"},
    {"name": "Thịt Gà Luộc", "protein": 22, "fat": 6, "carbs": 50, "kcal": 165, "dv": "50g"},
    {"name": "Súp thưởng", "protein": 15, "fat": 10, "carbs": 2, "kcal": 180, "dv": "25g"},
    {"name": "Sữa Dành Cho Mèo", "protein": 3, "fat": 4, "carbs": 5, "kcal": 60, "dv": "425ml"},
  ];

  int get totalProtein => events.fold(0, (sum, e) => sum + (e["protein"] as num).toInt());
  int get totalFat => events.fold(0, (sum, e) => sum + (e["fat"] as num).toInt());
  int get totalCarbs => events.fold(0, (sum, e) => sum + (e["carbs"] as num).toInt());
  int get totalKcal => events.fold(0, (sum, e) => sum + (e["kcal"] as num).toInt());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            flexibleSpace: Center(
              child: Text("Breakfast", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ),
            leading: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey, width: 2),
                ),
                child: Icon(
                  Icons.arrow_back_ios_new
                ),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey, width: 2),
                  ),
                  child: Icon(
                    Icons.share,
                  ),
                ),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Breakfast", style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("$totalKcal kcal", style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                      decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(15)),
                      child: const Text("Normal", style: TextStyle(color: Colors.white, fontSize: 15)),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Nutrition(text: "Protein", intake: totalProtein, goal: 100, color: Colors.purpleAccent),
                    Nutrition(text: "Fat", intake: totalFat, goal: 60, color: Colors.orangeAccent),
                    Nutrition(text: "Carbs", intake: totalCarbs, goal: 200, color: Colors.blueAccent),
                  ],
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                    itemCount: events.length,
                    itemBuilder: (context, index) {
                      return FoodItem(
                        name: events[index]["name"],
                        protein: (events[index]["protein"] as num).toInt(),
                        fat: (events[index]["fat"] as num).toInt(),
                        carbs: (events[index]["carbs"] as num).toInt(),
                        kcal: (events[index]["kcal"] as num).toInt(),
                        dv: events[index]["dv"],

                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
