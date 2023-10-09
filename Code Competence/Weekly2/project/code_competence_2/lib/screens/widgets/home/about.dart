import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageTitle extends StatelessWidget {
  const HomePageTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> features = [
      {
        'title': 'Learning & Practice',
        'icon': Icons.rocket_launch_rounded,
        'desc':
            'Ideal for beginners to experiment and enhance coding skills in a risk-free environment.'
      },
      {
        'title': 'Prototype Development',
        'icon': Icons.lightbulb_rounded,
        'desc':
            'Enables quick visualization of concepts, aiding designers and developers in creating functional prototypes.'
      },
      {
        'title': 'Quick Demonstrations',
        'icon': Icons.nature_people_rounded,
        'desc':
            'Perfect for showcasing ideas or features swiftly to stakeholders and team members.'
      },
      {
        'title': 'Debugging & Testing',
        'icon': Icons.pets_rounded,
        'desc':
            'Provides a controlled space for pinpointing and resolving bugs, ensuring smoother final app development.'
      },
    ];

    return Container(
      height: MediaQuery.of(context).size.height,
      color: const Color.fromARGB(255, 41, 65, 100),
      child: Stack(
        children: <Widget>[
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

          // about content
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    flex: 1,
                    child: Text(
                      "About Us",
                      style: GoogleFonts.bebasNeue(
                        fontSize: 48,
                        color: Colors.white,
                        height: 1,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: Icon(
                      Icons.swipe_down_rounded,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Text(
                "Our main features, exclusively for you.",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: <Widget>[
                            Text(
                              features[index]['title'],
                              style: GoogleFonts.bebasNeue(fontSize: 16),
                            ),
                            const SizedBox(height: 8),
                            Icon(
                              features[index]['icon'],
                              size: 40,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              features[index]['desc'],
                              style: const TextStyle(fontSize: 10),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
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
        ],
      ),
    );
  }
}
