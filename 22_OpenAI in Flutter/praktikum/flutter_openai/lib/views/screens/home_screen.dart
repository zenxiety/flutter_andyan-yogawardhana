import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_openai/providers/recommendation_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Phone Recommendation"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Consumer<RecommendationProvider>(builder: (context, state, _) {
          return Form(
            key: state.formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: ListView(
              children: <Widget>[
                TextFormField(
                  controller: state.budgetController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade300,
                    labelText: "Budget",
                    hintText: "Enter your amount of budget",
                    suffixText: "IDR",
                    suffixStyle: const TextStyle(
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  validator: (String? value) => state.validateInput(value),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: state.cameraController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade300,
                    labelText: "Camera",
                    hintText: "Enter your requirement for the camera",
                    suffixText: "MP",
                    suffixStyle: const TextStyle(
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  validator: (String? value) => state.validateInput(value),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: state.storageController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade300,
                    labelText: "Internal Storage",
                    hintText: "Enter your desired internal storage",
                    suffixText: "GB",
                    suffixStyle: const TextStyle(
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  validator: (String? value) => state.validateInput(value),
                ),
                const SizedBox(height: 20),
                state.isLoading &&
                        state.formKey.currentState!.validate() != false
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : ElevatedButton(
                        onPressed: () => state.getRecommendations(context),
                        child: const Text(
                          "GET RECOMMENDATIONS",
                          style: TextStyle(letterSpacing: 2),
                        ),
                      ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
