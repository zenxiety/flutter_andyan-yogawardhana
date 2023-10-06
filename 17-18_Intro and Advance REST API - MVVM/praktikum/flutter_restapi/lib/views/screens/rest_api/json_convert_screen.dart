import 'package:flutter/material.dart';
import 'package:flutter_restapi/providers/user_provider.dart';
import 'package:flutter_restapi/utils/constants/urls.dart';
import 'package:flutter_restapi/utils/states/fetch_state.dart';
import 'package:flutter_restapi/views/widgets/appbar.dart';
import 'package:flutter_restapi/views/widgets/drawer.dart';
import 'package:provider/provider.dart';

class JsonConvertScreen extends StatefulWidget {
  const JsonConvertScreen({super.key});

  @override
  State<JsonConvertScreen> createState() => _JsonConvertScreenState();
}

class _JsonConvertScreenState extends State<JsonConvertScreen> {
  late final Urls url;
  late final UserProvider userProvider;

  @override
  void initState() {
    url = Urls();
    final String path = url.jsonUrl;

    Future.delayed(Duration.zero, () {
      userProvider = Provider.of<UserProvider>(context, listen: false);
      userProvider.userFromJson(path);
    });

    super.initState();
  }

  @override
  void dispose() {
    userProvider.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: "JSON Convert", appBar: AppBar()),
      drawer: const BaseDrawer(),
      body: Center(
        child: Consumer<UserProvider>(
          builder: (context, state, _) {
            if (state.fetchState == FetchState.loading) {
              return const CircularProgressIndicator();
            } else if (state.fetchState == FetchState.loaded) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.deepPurple.shade100,
                    foregroundColor: Colors.black,
                    child: Text(
                      state.jsonUserModel?.id?.toString() ?? "",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple.shade100,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(16),
                      ),
                    ),
                    child: Column(
                      children: <Widget>[
                        Text(
                          state.jsonUserModel?.name ?? "",
                          style: const TextStyle(fontSize: 20),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          state.jsonUserModel?.phone ?? "",
                        ),
                      ],
                    ),
                  )
                ],
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
