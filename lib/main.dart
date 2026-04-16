import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const RecipeApp());
}

/// ================= APP ROOT =================
class RecipeApp extends StatefulWidget {
  const RecipeApp({super.key});

  @override
  State<RecipeApp> createState() => _RecipeAppState();
}

class _RecipeAppState extends State<RecipeApp> {
  bool isDarkMode = false;

  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Recipe Finder',
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.orange,
        scaffoldBackgroundColor: Colors.grey[50],
        cardColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.orange,
          foregroundColor: Colors.white,
          centerTitle: true,
          elevation: 0,
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.orange,
        scaffoldBackgroundColor: const Color(0xFF121212),
        cardColor: const Color(0xFF1E1E1E),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.orange,
          foregroundColor: Colors.white,
          centerTitle: true,
          elevation: 0,
        ),
      ),
      home: StudentInfoScreen(
        toggleTheme: toggleTheme,
        isDarkMode: isDarkMode,
      ),
    );
  }
}

/// ================= STUDENT INFO SCREEN =================
class StudentInfoScreen extends StatelessWidget {
  final VoidCallback toggleTheme;
  final bool isDarkMode;

  const StudentInfoScreen({
    super.key,
    required this.toggleTheme,
    required this.isDarkMode,
  });

  Widget buildInfoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Text(
            "$title: ",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Expanded(
            child: Text(value, style: const TextStyle(fontSize: 16)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text("Student Information"),
        actions: [
          IconButton(
            icon: Icon(
              isDarkMode ? Icons.light_mode : Icons.dark_mode,
            ),
            onPressed: toggleTheme,
          )
        ],
      ),
      body: Center(
        child: Card(
          elevation: 10,
          margin: const EdgeInsets.all(20),
          color: theme.cardColor,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.school, size: 80, color: Colors.orange),
                const SizedBox(height: 20),
                const Text(
                  "ALA - 2",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange),
                ),
                const Divider(),
                buildInfoRow("Name", "Sachapara Urshit"),
                buildInfoRow("En No.", "20230905080002"),
                buildInfoRow("Branch", "B-Tech (ICT)"),
                buildInfoRow("Sem", "6th"),
                buildInfoRow("Subject", "ADF"),
                buildInfoRow("Subject Code", "BETIT163330"),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 12),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => HomeScreen(
                          toggleTheme: toggleTheme,
                          isDarkMode: isDarkMode,
                        ),
                      ),
                    );
                  },
                  child: const Text(
                    "Open Recipe Finder",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// ================= HOME SCREEN =================
class HomeScreen extends StatefulWidget {
  final VoidCallback toggleTheme;
  final bool isDarkMode;

  const HomeScreen({
    super.key,
    required this.toggleTheme,
    required this.isDarkMode,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List categories = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchCategories();
  }

  Future<void> fetchCategories() async {
    final url = Uri.parse(
        "https://www.themealdb.com/api/json/v1/1/categories.php");
    final response = await http.get(url);
    final data = json.decode(response.body);

    setState(() {
      categories = data['categories'] ?? [];
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text("Recipe Finder"),
        actions: [
          IconButton(
            icon: Icon(
              widget.isDarkMode ? Icons.light_mode : Icons.dark_mode,
            ),
            onPressed: widget.toggleTheme,
          ),
        ],
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "What would you like\nto cook today?",
              style: theme.textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Categories",
              style: theme.textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: categories.length,
              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.85,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemBuilder: (context, index) {
                final category = categories[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => CategoryScreen(
                          category: category['strCategory'],
                        ),
                      ),
                    );
                  },
                  child: Card(
                    color: theme.cardColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 5,
                    child: Column(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Image.network(
                              category['strCategoryThumb'],
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.vertical(
                                bottom: Radius.circular(20)),
                          ),
                          child: Text(
                            category['strCategory'],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

/// ================= CATEGORY SCREEN =================
class CategoryScreen extends StatefulWidget {
  final String category;

  const CategoryScreen({super.key, required this.category});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List meals = [];
  bool isLoading = true;
  String? selectedArea;

  final List<String> areas = [
    "American",
    "British",
    "Canadian",
    "Chinese",
    "French",
    "Greek",
    "Indian",
    "Italian",
    "Japanese",
    "Mexican",
    "Moroccan",
    "Spanish",
    "Thai",
    "Turkish",
    "Vietnamese",
  ];

  @override
  void initState() {
    super.initState();
    fetchByCategory(widget.category);
  }

  Future<void> fetchByCategory(String category) async {
    final url = Uri.parse(
        "https://www.themealdb.com/api/json/v1/1/filter.php?c=$category");
    final response = await http.get(url);
    final data = json.decode(response.body);

    setState(() {
      meals = data['meals'] ?? [];
      isLoading = false;
    });
  }

  Future<Map<String, dynamic>> fetchMealDetails(String id) async {
    final url = Uri.parse(
        "https://www.themealdb.com/api/json/v1/1/lookup.php?i=$id");
    final response = await http.get(url);
    final data = json.decode(response.body);
    return data['meals'][0];
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(widget.category)),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: DropdownButtonFormField<String>(
              hint: const Text("Filter by Country"),
              value: selectedArea,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
              items: areas.map((area) {
                return DropdownMenuItem(
                  value: area,
                  child: Text(area),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedArea = value;
                });
              },
            ),
          ),
          Expanded(
            child: isLoading
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
              itemCount: meals.length,
              itemBuilder: (context, index) {
                final meal = meals[index];
                return Card(
                  color: theme.cardColor,
                  margin: const EdgeInsets.all(8),
                  child: ListTile(
                    leading: Image.network(
                      meal['strMealThumb'],
                      width: 60,
                      fit: BoxFit.cover,
                    ),
                    title: Text(meal['strMeal']),
                    onTap: () async {
                      final details =
                      await fetchMealDetails(meal['idMeal']);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              DetailScreen(meal: details),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

/// ================= FULL SCREEN IMAGE =================
class FullScreenImage extends StatelessWidget {
  final String imageUrl;
  final String tag;

  const FullScreenImage({
    super.key,
    required this.imageUrl,
    required this.tag,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: InteractiveViewer(
          child: Hero(
            tag: tag,
            child: Image.network(imageUrl),
          ),
        ),
      ),
    );
  }
}

/// ================= DETAIL SCREEN =================
class DetailScreen extends StatelessWidget {
  final Map<String, dynamic> meal;

  const DetailScreen({super.key, required this.meal});

  List<String> getIngredients() {
    List<String> ingredients = [];
    for (int i = 1; i <= 20; i++) {
      final ingredient = meal['strIngredient$i'];
      final measure = meal['strMeasure$i'];
      if (ingredient != null &&
          ingredient.toString().trim().isNotEmpty) {
        ingredients.add("$ingredient - ${measure ?? ''}");
      }
    }
    return ingredients;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final ingredients = getIngredients();

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => FullScreenImage(
                        imageUrl: meal['strMealThumb'],
                        tag: meal['idMeal'],
                      ),
                    ),
                  );
                },
                child: Hero(
                  tag: meal['idMeal'],
                  child: Image.network(
                    meal['strMealThumb'],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Card(
                color: theme.cardColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        meal['strMeal'],
                        style: theme.textTheme.headlineSmall!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "${meal['strCategory']} • ${meal['strArea']}",
                        style: const TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Ingredients",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      ...ingredients.map(
                            (e) => ListTile(
                          leading: const Icon(Icons.check_circle,
                              color: Colors.orange),
                          title: Text(e),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Instructions",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        meal['strInstructions'] ?? '',
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}