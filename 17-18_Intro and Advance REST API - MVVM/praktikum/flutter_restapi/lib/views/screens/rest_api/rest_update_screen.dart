import 'package:flutter/material.dart';
import 'package:flutter_restapi/models/data_model.dart';
import 'package:flutter_restapi/providers/user_provider.dart';
import 'package:flutter_restapi/utils/constants/urls.dart';
import 'package:flutter_restapi/utils/states/fetch_state.dart';
import 'package:flutter_restapi/views/widgets/appbar.dart';
import 'package:flutter_restapi/views/widgets/drawer.dart';
import 'package:provider/provider.dart';

class RestUpdateScreen extends StatefulWidget {
  const RestUpdateScreen({super.key});

  @override
  State<RestUpdateScreen> createState() => _RestUpdateScreenState();
}

class _RestUpdateScreenState extends State<RestUpdateScreen> {
  late final Urls url;
  late final UserProvider userProvider;

  @override
  void initState() {
    url = Urls();
    final String path = url.restPutUrl;

    Future.delayed(Duration.zero, () {
      userProvider = Provider.of<UserProvider>(
        context,
        listen: false,
      );
      userProvider.getData(path);
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
    Urls url = Urls();
    final UserProvider userProvider = Provider.of<UserProvider>(
      context,
      listen: false,
    );

    return Scaffold(
      appBar: BaseAppBar(title: "REST API Update", appBar: AppBar()),
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
                    width: MediaQuery.of(context).size.width * 9 / 10,
                    decoration: BoxDecoration(
                      color: Colors.deepPurple.shade100,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Column(
                      children: <Widget>[
                        const Text(
                          "DATA TO BE UPDATED",
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
                              "ID",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "${state.dataModel != null ? state.dataModel!.id : ''}",
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            const Flexible(
                              flex: 1,
                              child: Text(
                                "Title",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Flexible(
                              flex: 3,
                              child: Text(
                                "${state.dataModel != null ? state.dataModel!.title : ''}",
                                textAlign: TextAlign.end,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            const Flexible(
                              flex: 1,
                              child: Text(
                                "Body",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Flexible(
                              flex: 3,
                              child: Text(
                                "${state.dataModel != null ? state.dataModel!.body : ''}",
                                textAlign: TextAlign.end,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            const Text(
                              "UserID",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "${state.dataModel != null ? state.dataModel!.userId : ''}",
                              overflow: TextOverflow.ellipsis,
                            ),
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
                    width: MediaQuery.of(context).size.width * 9 / 10,
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
                              "ID",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(state.dataModel?.id.toString() ?? ""),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            const Text(
                              "Title",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(state.dataModel?.title.toString() ?? ""),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            const Text(
                              "Body",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(state.dataModel?.body.toString() ?? ""),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            const Text(
                              "UserID",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(state.dataModel?.userId.toString() ?? ""),
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
                final String path = url.restPutUrl;

                const int sentId = 1;
                const String sentTitle = 'foo';
                const String sentBody = 'bar';
                const int sentUserId = 1;

                final DataModel user = DataModel(
                  id: sentId,
                  title: sentTitle,
                  body: sentBody,
                  userId: sentUserId,
                );

                userProvider.updateData(
                  path,
                  user,
                );
              },
              child: const Text("UPDATE"),
            ),
          ],
        ),
      ),
    );
  }
}
