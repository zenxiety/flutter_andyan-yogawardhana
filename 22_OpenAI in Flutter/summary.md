# Summary of OpenAI in Flutter

## OpenAI

- platform implement AI untuk public
- library pemanfaatan AI dari OpenAI untuk integrasi dengan aplikasi
- keuntungan : gratis, pemasangan mudah, multiplatform, 175 miliar parameter (model davinci 03)

## Project Implementation Example

- rekomendasi mobil : rekomendasi berdasarkan asal merk dan budget
  - pakai **completion**

1. [API Keys](https://platform.openai.com/account/api-keys) -> create new secret key
2. package `http`/`dio`, `intl`, `envied`, --dev `envied_generator` & `build_runner`
   - `intl` untuk formatting mata uang -> `currency_text_input_formatter`
   - `envied` untuk merahasiakan token
3. file config **`.env`** : `OPENAPI_API_KEY="YOUR_OPENAI_API_KEY"`

4. gitignore : `.env` & `env.g.dart` || `.env/` & `/lib/env/*.g.dart`
5. file config `lib/env/env.dart`
6. generate code untuk membaca .env : `flutter pub run build_runner build`
7. menyimpan api key : `lib/constants/openai.dart` : `String apiKey = Env.apikey`
8. data model : `lib/models/openai_model.dart`
9. service : `lib/services/recommendation_service.dart`
10. provider
11. halaman

## Additional Notes

- header : authorization : **api key** : `"Bearer $token"`
- Uri : postUri
