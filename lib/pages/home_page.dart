import 'package:flutter/material.dart';
import '../widgets/picture_slider.dart';
import '../routers/go_router_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final List<String> imageList = [
    'assets/football.jpg',
    'assets/movie.jpg',
    'assets/rodeo.jpg',
  ];
  // bottomNavigationBar: BottomNavigationBar(
  //   items: [
  //     BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
  //     BottomNavigationBarItem(icon: Icon(Icons.person), label: '')
  //   ],
  // ),
  @override
  Widget build(BuildContext context) {
    // final router = ref.watch(goRouterProvider);
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAE5),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 25.0, vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Hi, Aster!",
                    style: TextStyle(
                        color: Color(0xFF43766C),
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        // color: Colors.green[500],
                        image: const DecorationImage(
                          image: AssetImage('assets/retro.jpg'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(12)),
                    padding: EdgeInsets.all(12),
                    child: Icon(
                      Icons.add_reaction_rounded,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 25),
            Expanded(child: PictureSlider(imageList: imageList)),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(16.0),
                margin: const EdgeInsets.fromLTRB(0.0, 100.0, 0.0, 0.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  // borderRadius: BorderRadius.circular(20),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      spreadRadius: 5,
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // const SizedBox(height: 20),
                    const Text(
                      'Good Morning',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    // SizedBox(height: 18),
                    Text(
                      "Lorem ipsum.",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.purple,
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          onPressed: () {
                            ref.read(goRouterProvider).go('/post');
                          },
                          icon: Icon(
                            Icons.arrow_circle_right,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
