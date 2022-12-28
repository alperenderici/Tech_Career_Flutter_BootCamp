import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/homeworks/hw6/model/feature_model.dart';
import 'package:flutter_bootcamp/homeworks/hw6/model/music_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

Future<List<Feature>> fetchFeature() async {
  var gridElements = <Feature>[];
  var f1 = Feature(id: 1, name: "Jakuzi", imageName: "feature1.jpeg");
  var f2 = Feature(id: 2, name: "Haftalık Keşif", imageName: "feature2.jpeg");
  var f3 = Feature(id: 3, name: "Mac De Marco", imageName: "feature3.jpeg");
  var f4 = Feature(id: 4, name: "Berlin Techno", imageName: "feature4.jpeg");
  var f5 = Feature(id: 5, name: "Void", imageName: "feature5.jpeg");
  var f6 = Feature(id: 6, name: "Spotift Özeti", imageName: "feature6.jpeg");
  gridElements.add(f1);
  gridElements.add(f2);
  gridElements.add(f3);
  gridElements.add(f4);
  gridElements.add(f5);
  gridElements.add(f6);
  return gridElements;
}

Future<List<Music>> fetchMusic() async {
  var musics = <Music>[];
  var m1 = Music(
    id: 1,
    name: "Scorpions Radyo",
    description: "Scorpions, Bon Jovi,",
    imageName: "music1.jpeg",
  );
  var m2 = Music(
    id: 2,
    name: "Kod Adı: techcareer.net",
    description: "techcareer.net",
    imageName: "music2.jpeg",
  );
  var m3 = Music(
    id: 3,
    name: "Surf Rock Sunshine",
    description: "Spotify",
    imageName: "music3.jpeg",
  );
  musics.add(m1);
  musics.add(m2);
  musics.add(m3);
  return musics;
}

Future<List<Music>> fetchArtist() async {
  var musics = <Music>[];
  var m1 = Music(
    id: 1,
    name: "King Gizzard & The Lizard Wizard",
    description: "",
    imageName: "music1.jpeg",
  );
  var m2 = Music(
    id: 2,
    name: "Radiohead",
    description: "",
    imageName: "music6.jpeg",
  );
  var m3 = Music(
    id: 3,
    name: "Ferdi Özbeğen",
    description: "",
    imageName: "music5.jpeg",
  );
  musics.add(m1);
  musics.add(m2);
  musics.add(m3);
  return musics;
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("İyi günler"),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.add_alert_outlined,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.access_time_rounded,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.settings,
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 3,
              child: FutureBuilder<List<Feature>>(
                future: fetchFeature(),
                builder: (context, snapshot) {
                  var featureList = snapshot.data;
                  if (snapshot.hasData) {
                    return GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 6 / 2,
                        ),
                        itemCount: featureList!.length,
                        itemBuilder: (context, index) {
                          var feature = featureList[index];
                          return Card(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset(
                                    "lib/homeworks/hw6/images/${feature.imageName}"),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Text(feature.name),
                                ),
                              ],
                            ),
                          );
                        });
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Kaldığın yerden devam et"),
              ],
            ),
            FutureBuilder<List<Music>>(
              future: fetchMusic(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var musicList = snapshot.data;
                  return SizedBox(
                    height: MediaQuery.of(context).size.height / 3,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: musicList!.length,
                      itemBuilder: (context, index) {
                        var music = musicList[index];
                        return Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Column(
                            children: [
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 3,
                                width: MediaQuery.of(context).size.width / 3,
                                child: Image.asset(
                                    "lib/homeworks/hw6/images/${music.imageName}"),
                              ),
                              Text(
                                music.name,
                                style: TextStyle(fontSize: 2),
                              ),
                              Text(
                                music.description,
                                style: TextStyle(fontSize: 1),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.folder_copy_outlined), //TODO change icon
            label: "Your Library",
          ),
        ]),
      ),
    );
  }
}
