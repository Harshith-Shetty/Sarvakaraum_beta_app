import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_viewer/video_viewer.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarIconBrightness: Brightness.dark));
    return MaterialApp(
      title: 'Video Viewer Example',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[100],
        body: Center(child: WebVTTSubtitleVideoExample()),
      ),
    );
  }
}

class getting_ready extends StatefulWidget {
  getting_ready({Key key}) : super(key: key);

  @override
  _SerieExampleState createState() => _SerieExampleState();
}

class _SerieExampleState extends State<getting_ready> {
  final VideoViewerController controller = VideoViewerController();
  final Map<String, Map<String, String>> database = {
    "Module 1": {
      "Ultra-clear":
      "https://sarvakaraum.s3.amazonaws.com/Course/Introduction+to+C+programming/Getting+Started.mp4",
    },
  };

  final Map<String, String> thumbnails = {
    "Module 1":
    "https://sarvakaraum.s3.amazonaws.com/Course/Introduction+to+C+programming/module1_orange.png",

  };

  String episode = "";
  MapEntry<String, Map<String, String>> initial;

  @override
  void initState() {
    initial = database.entries.first;
    episode = initial.key;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Center(
        child: VideoViewer(
          source: VideoSource.fromNetworkVideoSources(initial.value),
          controller: controller,
          language: VideoViewerLanguage.en,
          style: VideoViewerStyle(
            header: Builder(
              builder: (innerContext) {
                return Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Introduction to C programming: $episode",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            /*settingsStyle: SettingsMenuStyle(
              paddingBetween: 10,
              items: [
                SettingsMenuItem(
                  themed: SettingsMenuItemThemed(
                    title: "Module",
                    //subtitle: episode,
                    icon: Icon(
                      Icons.view_module_outlined,
                      color: Colors.white,
                    ),
                  ),
                  secondaryMenuWidth: 250,
                  secondaryMenu: Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: Center(
                      child: Container(
                        child: Wrap(
                          spacing: 20,
                          runSpacing: 10,
                          children: [
                            for (var entry in database.entries)
                              episodeImage(entry)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),*/
          ),
        ),
      ),
    );
  }

  Widget episodeImage(MapEntry<String, Map<String, String>> entry) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(5)),
      child: Material(
        child: InkWell(
          onTap: () async {
            final episodeName = entry.key;
            final qualities = entry.value;

            Map<String, VideoSource> sources;
            String url = qualities.entries.first.value;

            if (url.contains("m3u8")) {
              sources = await VideoSource.fromM3u8PlaylistUrl(
                url,
                formatter: (quality) =>
                quality == "Auto" ? "Auto" : "${quality.split("x").last}p",
              );
            } else {
              sources = VideoSource.fromNetworkVideoSources(qualities);
            }

            final video = sources.entries.first;

            await controller.changeSource(
              inheritValues: false, //RESET SPEED TO NORMAL AND POSITION TO ZERO
              source: video.value,
              name: video.key,
            );

            controller.closeAllSecondarySettingsMenus();
            controller.source = sources;
            episode = episodeName;
            setState(() {});
          },
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Container(
                width: 80,
                height: 80,
                color: Colors.white,
                child: Image.network(thumbnails[entry.key], fit: BoxFit.cover),
              ),
              Text(
                entry.key,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// class PortraitVideoExample extends StatelessWidget {
//   const PortraitVideoExample({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final Map<String, String> src = {
//       "1":
//           "https://assets.mixkit.co/videos/preview/mixkit-mysterious-pale-looking-fashion-woman-at-winter-39878-large.mp4",
//       "2":
//           "https://assets.mixkit.co/videos/preview/mixkit-winter-fashion-cold-looking-woman-concept-video-39874-large.mp4",
//     };

//     return VideoViewer(
//       language: VideoViewerLanguage.es,
//       source: VideoSource.fromNetworkVideoSources(src),
//       style: VideoViewerStyle(
//         settingsStyle: SettingsMenuStyle(paddingBetween: 10),
//       ),
//     );
//   }
// }

class HLSVideoExample extends StatelessWidget {
  const HLSVideoExample({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, VideoSource>>(
      future: VideoSource.fromM3u8PlaylistUrl(
        "https://sfux-ext.sfux.info/hls/chapter/105/1588724110/1588724110.m3u8",
        formatter: (quality) =>
        quality == "Auto" ? "Auto" : "${quality.split("x").last}p",
      ),
      builder: (_, data) {
        return data.hasData
            ? VideoViewer(
          language: VideoViewerLanguage.ar,
          source: data.data,
          onFullscreenFixLandscape: true,
          style: VideoViewerStyle(
            thumbnail: Image.network(
              "https://play-lh.googleusercontent.com/aA2iky4PH0REWCcPs9Qym2X7e9koaa1RtY-nKkXQsDVU6Ph25_9GkvVuyhS72bwKhN1P",
            ),
          ),
        )
            : CircularProgressIndicator();
      },
    );
  }
}

class WebVTTSubtitleVideoExample extends StatelessWidget {
  const WebVTTSubtitleVideoExample({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VideoViewer(
      source: {
        "WebVTT Caption": VideoSource(
          intialSubtitle: "Spanish",
          video: VideoPlayerController.network(
            "https://www.speechpad.com/proxy/get/marketing/samples/standard-captions-example.mp4",
          ),
          subtitle: {
            "English": VideoViewerSubtitle.network(
              "https://felipemurguia.com/assets/txt/WEBVTT_English.txt",
            ),
            "Spanish": VideoViewerSubtitle.network(
              "https://felipemurguia.com/assets/txt/WEBVTT_Spanish.txt",
            ),
          },
        )
      },
    );
  }
}

class SubRipSubtitleVideoExample extends StatelessWidget {
  const SubRipSubtitleVideoExample({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String content = '''
      1
      00:00:03,400 --> Sarvakaraum
      2
      00:00:06,177 --> 00:00:10,009
      Sarvakaraum.
      3
      00:00:10,009 --> 00:00:13,655
      Sarvakaraum
      4
      00:00:13,655 --> 00:00:17,720
      Sarvakaraum
      5
      00:00:17,900 --> 00:00:21,480
      Sarvakaraum
      6
      00:00:21,660 --> 00:00:26,440
      Sarvakaraum
      7
      00:00:26,620 --> 00:00:31,220
      Sarvakaraum
      8
      00:00:31,300 --> 00:00:35,800
      Sarvakaraum
      9
      00:00:35,800 --> 00:00:40,822
      Sarvakaraum
      10
      00:00:40,822 --> 00:00:44,400
      Sarvakaraum
      11
      00:00:44,400 --> 00:00:48,700
      Sarvakaraum
      12
      00:00:48,700 --> 00:00:53,330
      Sarvakaraum
      13
      00:00:53,510 --> 00:01:00,720
      Sarvakaraum
      14
      00:01:00,800 --> 00:01:06,640
      Sarvakaraum
      15
      00:01:06,820 --> 00:01:11,300
      Sarvakaraum
      16
      00:01:11,480 --> 00:01:17,898
      Sarvakaraum
      17
      00:01:17,898 --> 00:01:22,730
      Sarvakaraum
      18
      00:01:22,800 --> 00:01:28,040
      Sarvakaraum
      19
      00:01:28,220 --> 00:01:32,420
      Sarvakaraum
      20
      00:01:32,600 --> 00:01:37,279
      Sarvakaraum
      21
      00:01:37,279 --> 00:01:41,480
      Sarvakaraum
      22
      00:01:41,480 --> 00:01:46,860
      Sarvakaraum
      23
      00:01:46,860 --> 00:01:49,970
      Sarvakaraum
      ''';

    return VideoViewer(
      source: {
        "SubRip Caption": VideoSource(
          video: VideoPlayerController.network(
              "https://sarvakaraum.s3.amazonaws.com/Course/Introduction+to+C+programming/Programming+Intro.mp4"),
          subtitle: {
            "English": VideoViewerSubtitle.content(
              content,
              type: SubtitleType.srt,
            ),
          },
        )
      },
    );
  }
}