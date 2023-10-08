import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MaterialApp(
    home: MusicPlayerPlayList(),
  ));
}

class MusicPlayerPlayList extends StatefulWidget {
  const MusicPlayerPlayList({super.key});

  @override
  State<MusicPlayerPlayList> createState() => _MusicPlayerPlayListState();
}

class _MusicPlayerPlayListState extends State<MusicPlayerPlayList> {
  int selectedIndex = 0;
  var imageList = [
    'assets/images/pop.jpg',
    'assets/images/car.jpg',
    'assets/images/eminem.jpg',
    'assets/images/headphone.jpg',
    'assets/images/ariana.jpg',
    'assets/images/tiktok.jpg',
    'assets/images/starboy.jpg',
    'assets/images/cover1.jpg',
  ];
  var songList = [
    {
      'image': 'assets/images/ed_sheeran_dp.jpg',
      'artist': 'Ed Sheeran',
      'song': 'Shape of you'
    },
    {
      'image': 'assets/images/eminem_dp.jpg',
      'artist': 'Eminem',
      'song': 'Mocking Bird'
    },
    {
      'image': 'assets/images/harry_dp.jpg',
      'artist': 'Harry Styles',
      'song': 'Watermelon Sugar'
    },
    {
      'image': 'assets/images/hone_singh_dp.jpg',
      'artist': 'Yo Yo Honey Singh',
      'song': 'Desi Kalakaar'
    },
    {
      'image': 'assets/images/rihanna_dp.jpg',
      'artist': 'Rihanna',
      'song': 'Diamonds'
    },
    {
      'image': 'assets/images/shakira_dp.jpg',
      'artist': 'Shakira',
      'song': 'Waka Waka'
    },
    {
      'image': 'assets/images/starboy_dp.jpg',
      'artist': 'Starboy',
      'song': 'Weekend'
    },
    {
      'image': 'assets/images/taylor_dp.jpg',
      'artist': 'Taylor Swift',
      'song': 'Love Story'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Musify.",
          style: GoogleFonts.ubuntu(
              color: const Color(0xFFff80aa),
              fontWeight: FontWeight.bold,
              fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        color: Colors.black,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 20),
              child: Row(
                children: [
                  Text(
                    "Suggested playlists",
                    style: GoogleFonts.ubuntu(
                        color: const Color(0xFFff80aa),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  const SizedBox(),
                ],
              ),
            ),
            Container(
              height: 200,
              child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                    8,
                    (index) => Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        width: 180,
                        height: 180,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: AssetImage(imageList[index]),
                                fit: BoxFit.cover)),
                      ),
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 20),
              child: Row(
                children: [
                  Text(
                    "Recommended for you",
                    style: GoogleFonts.ubuntu(
                        color: const Color(0xFFff80aa),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  const SizedBox(),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                  children: List.generate(
                      8,
                      (index) => Padding(
                            padding: const EdgeInsets.only(left: 20, top: 10),
                            child: Stack(
                              children: [
                                Container(
                                  height: 60,
                                  width: double.infinity,
                                ),
                                Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              songList[index]['image']!),
                                          fit: BoxFit.cover)),
                                ),
                                Positioned(
                                  left: 70,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 5, bottom: 5),
                                        child: Text(
                                          songList[index]['song']!,
                                          style: const TextStyle(
                                              color: Color(0xFFff80aa),
                                              fontSize: 18),
                                        ),
                                      ),
                                      Text(
                                        songList[index]['artist']!,
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                    ],
                                  ),
                                ),
                                const Positioned(
                                  top: 10,
                                  right: 20,
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(right: 20),
                                        child: Icon(
                                          Icons.star_border_outlined,
                                          color: Color(0xFFff80aa),
                                        ),
                                      ),
                                      Icon(
                                        Icons.download_outlined,
                                        color: Color(0xFFff80aa),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ))),
            )
          ],
        ),
      ),
      bottomNavigationBar: SlidingClippedNavBar.colorful(
        backgroundColor: Colors.black,
        onButtonPressed: (index) {
          setState(() {
            selectedIndex = index;
          });
          // controller.animateToPage(selectedIndex,
          //     duration: const Duration(milliseconds: 400),
          //     curve: Curves.easeOutQuad);
        },
        iconSize: 30,
        selectedIndex: selectedIndex,
        barItems: [
          BarItem(
            icon: Icons.home,
            title: 'Home',
            activeColor: const Color(0xFFff80aa),
            inactiveColor: Colors.white,
          ),
          BarItem(
            icon: Icons.search_rounded,
            title: 'Search',
            activeColor: const Color(0xFFff80aa),
            inactiveColor: Colors.white,
          ),
          BarItem(
            icon: Icons.playlist_play,
            title: 'Playlists',
            activeColor: const Color(0xFFff80aa),
            inactiveColor: Colors.white,
          ),
          BarItem(
            icon: FontAwesomeIcons.ellipsis,
            title: 'More',
            activeColor: const Color(0xFFff80aa),
            inactiveColor: Colors.white,
          ),

          /// Add more BarItem if you want
        ],
      ),
    );
  }
}
