import 'package:flutter/material.dart';
import 'package:flutter_openai/services/recommendation_service.dart';
import 'package:flutter_openai/views/screens/result_screen.dart';
import 'package:intl/intl.dart';

class RecommendationProvider with ChangeNotifier {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController budgetController = TextEditingController();
  final TextEditingController cameraController = TextEditingController();
  final TextEditingController storageController = TextEditingController();
  bool isLoading = false;

  String? validateInput(String? value) {
    bool isInvalid =
        value == null || value.isEmpty || int.tryParse(value) == null;
    return isInvalid ? "Please enter valid numbers" : null;
  }

  void getRecommendations(BuildContext context) async {
    isLoading = true;
    notifyListeners();

    final formatCurrency = NumberFormat.currency(
        locale: "id_ID", symbol: "IDR ", decimalDigits: 0);

    String phoneBudget =
        formatCurrency.format(int.parse(budgetController.value.text));
    String phoneCamera =
        formatCurrency.format(int.parse(cameraController.value.text));
    String phoneStorage =
        formatCurrency.format(int.parse(storageController.value.text));

    try {
      final result = await RecommendationService.getRecommendations(
        budget: phoneBudget,
        camera: phoneCamera,
        storage: phoneStorage,
      );

      if (context.mounted) {
        isLoading = false;
        notifyListeners();

        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return ResultScreen(gptResponseData: result);
          },
        ));
      }
    } catch (e) {
      debugPrint(e.toString());

      const snackBar = SnackBar(
          content: Text("Failed to send a request. Please try again."));

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }

      isLoading = false;
      notifyListeners();
    }
  }
}
