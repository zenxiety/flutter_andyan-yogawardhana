import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageTitle extends StatelessWidget {
  const HomePageTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: const Color.fromARGB(255, 41, 65, 100),
      child: Stack(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    flex: 1,
                    child: Text(
                      "Keep On Scrolling?",
                      style: GoogleFonts.bebasNeue(
                        fontSize: 48,
                        color: Colors.white,
                        height: 1,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Flexible(
                    flex: 1,
                    child: Icon(
                      Icons.swipe_down_rounded,
                      size: 100,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  "Greetings from the Keep On Scrolling! You might be wondering what kind of app this is, right? In this experimental app, the only things you can perform are those the developer has previously designed. Well, all apps operate in a similar way, don't they? Enjoy!",
                  textAlign: TextAlign.justify,
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        backgroundColor: Colors.black,
                        title: Text(
                          "Coming Soon",
                          style: GoogleFonts.bebasNeue(
                            fontSize: 40,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        actionsAlignment: MainAxisAlignment.center,
                        actions: <Widget>[
                          IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: const Text("Learn More"),
              ),
            ],
          ),
          // decoration (top left darker)
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              width: 240,
              height: 100,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 15, 29, 50),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                ),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 4,
                  ),
                ],
              ),
            ),
          ),
          // decoration (top left lighter)
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              width: 120,
              height: 160,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 22, 39, 65),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                ),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 4,
                  ),
                ],
              ),
            ),
          ),
          // decoration (top left square)
          Positioned(
            top: 180,
            left: 20,
            child: Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 22, 39, 65),
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 4,
                  ),
                ],
              ),
            ),
          ),
          // decoration (bottom right darker)
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              width: 240,
              height: 100,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 15, 29, 50),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                ),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 4,
                  ),
                ],
              ),
            ),
          ),
          // decoration (bottom right lighter)
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              width: 120,
              height: 160,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 22, 39, 65),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                ),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 4,
                  ),
                ],
              ),
            ),
          ),
          // decoration (bottom right square)
          Positioned(
            bottom: 180,
            right: 20,
            child: Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 22, 39, 65),
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 4,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
