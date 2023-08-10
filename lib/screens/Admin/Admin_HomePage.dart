import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/Scrolling_Notif.dart';
import '../../widgets/AppBareP.dart';
import '../Admin/Admin_Accueil.dart';
import '../Admin/Admin_Messanger.dart';
import '../profile/Profile.dart';
import '../../services/Authentification_FirestoreServicr.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController(initialPage: 0);
  int selectedPageIndex = 0;
  double maxHeight = 256;
  double currentHeight = 256;
  bool isVisible = true;
  Authentification_FirestoreService authFirestore =
      Authentification_FirestoreService();
  String cin = "null1";

  @override
  void initState() {
    super.initState();
    getUserId();
    print("cin: $cin");
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> getUserId() async {
    cin = await authFirestore.getUserId("userId");
    setState(() {}); // Trigger UI rebuild to show the updated value
  }

  Future<void> updateAppBarHeight() async {
    setState(() {
      if (selectedPageIndex == 0) {
        currentHeight = maxHeight;
      } else {
        currentHeight = maxHeight * 0.5;
      }
    });
  }

  void toggleVisibility() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MyModel>(
      builder: (context, test, child) {
        return SafeArea(
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size(MediaQuery.of(context).size.width, maxHeight),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  maxHeight = constraints.maxHeight;
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    height: !test.MyVariables ? currentHeight : maxHeight * 0.5,
                    decoration: BoxDecoration(
                      gradient: _buildGardienGreenGradient(),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      ),
                    ),
                    child: Column(
                      children: [
                        const AppBareP(),
                        FutureBuilder(
                          future:
                              Future.delayed(const Duration(milliseconds: 150)),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Container(); // Return an empty container while waiting for the delay
                            } else {
                              return isVisible && !test.MyVariables
                                  ? AnimatedOpacity(
                                      opacity: 1.0,
                                      duration:
                                          const Duration(milliseconds: 2000),
                                      child: _buildHelloUser(),
                                    )
                                  : Container();
                            }
                          },
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            drawer: Drawer(
              width: MediaQuery.of(context).size.width / 1.5,
              child: const Profile(),
            ),
            body: PageView(
              controller: _pageController,
              onPageChanged: (int index) async {
                setState(() {
                  selectedPageIndex = index;
                  updateAppBarHeight();
                });
                if (!isVisible) {
                  await Future.delayed(
                    const Duration(milliseconds: 200),
                  );
                }
                toggleVisibility();
              },
              children: const [
                Accueil(),
                Messanger(),
              ],
            ),
            bottomNavigationBar: _buildNavigationBar(),
          ),
        );
      },
    );
  }

  Widget _buildNavigationBar() {
    return NavigationBar(
      labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
      height: 64,
      backgroundColor: const Color.fromARGB(0, 255, 255, 255),
      selectedIndex: selectedPageIndex,
      onDestinationSelected: (int index) async {
        setState(() async {
          selectedPageIndex = index;
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
          updateAppBarHeight();
        });
        if (!isVisible) {
          await Future.delayed(
            const Duration(milliseconds: 200),
          );
        }
        toggleVisibility();
      },
      destinations: const <NavigationDestination>[
        NavigationDestination(
          selectedIcon: Icon(
            Icons.home,
          ),
          icon: Icon(
            Icons.home_outlined,
          ),
          label: 'Home',
        ),
        NavigationDestination(
          selectedIcon: Icon(Icons.message),
          icon: Icon(Icons.message_outlined),
          label: 'Message',
        ),
      ],
    );
  }

  Widget _buildHelloUser() {
    return Container(
      padding: const EdgeInsets.only(
        top: 16,
      ),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Bonjour",
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              "Admin name ",
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
            Text("cin: $cin ${cin.length}")
          ],
        ),
      ),
    );
  }

  Gradient _buildGardienGreenGradient() {
    return const LinearGradient(
      colors: [
        Colors.green,
        Color.fromARGB(255, 33, 160, 99),
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: [0.0, 1],
      tileMode: TileMode.mirror,
    );
  }
}
