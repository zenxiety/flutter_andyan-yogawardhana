import 'package:flutter/material.dart';
import 'package:flutter_restapi/models/user_model.dart';
import 'package:flutter_restapi/providers/user_provider.dart';
import 'package:flutter_restapi/utils/constants/urls.dart';
import 'package:flutter_restapi/utils/states/fetch_state.dart';
import 'package:flutter_restapi/views/widgets/appbar.dart';
import 'package:flutter_restapi/views/widgets/drawer.dart';
import 'package:provider/provider.dart';

class RestCreateScreen extends StatefulWidget {
  const RestCreateScreen({super.key});

  @override
  State<RestCreateScreen> createState() => _RestCreateScreenState();
}

class _RestCreateScreenState extends State<RestCreateScreen> {
  @override
  Widget build(BuildContext context) {
    final Urls url = Urls();
    final UserProvider userProvider = Provider.of<UserProvider>(
      context,
      listen: false,
    );

    const String sentName = 'Barry';
    const String sentJob = 'Speedster';

    return Scaffold(
      appBar: BaseAppBar(
        title: "REST API Create",
        appBar: AppBar(),
      ),
      drawer: const BaseDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Consumer<UserProvider>(
              builder: (context, state, _) {
                if (state.fetchState == FetchState.initial) {
                  return Container(
                    margin: const EdgeInsets.all(20),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple.shade100,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: const Column(
                      children: <Widget>[
                        Text(
                          "DATA TO BE SENT",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Name",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(sentName),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Job",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(sentJob),
                          ],
                        ),
                      ],
                    ),
                  );
                } else if (state.fetchState == FetchState.loading) {
                  return Container(
                    margin: const EdgeInsets.all(40),
                    child: const CircularProgressIndicator(),
                  );
                } else if (state.fetchState == FetchState.failed) {
                  return const Text("FETCH FAILED");
                } else {
                  return Container(
                    margin: const EdgeInsets.all(20),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple.shade100,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Column(
                      children: <Widget>[
                        const Text(
                          "RESPONSE",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            const Text(
                              "Name",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(state.userModel?.name.toString() ?? ""),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            const Text(
                              "Job",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(state.userModel?.job.toString() ?? ""),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            const Text(
                              "ID",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(state.userModel?.id.toString() ?? ""),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            const Text(
                              "Created At",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(state.userModel?.created.toString() ?? ""),
                          ],
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
            ElevatedButton(
              onPressed: () {
                final String path = url.reqresUrl;
                final UserModel user = UserModel(name: sentName, job: sentJob);
                userProvider.postUserData(
                  path,
                  user,
                );
              },
              child: const Text("SEND"),
            ),
          ],
        ),
      ),
    );
  }
}
