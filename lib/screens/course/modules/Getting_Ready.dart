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
    "Module 2": {
      "Ultra-clear":
      ""
    },
    "Module 3": {
      "Ultra-clear":
      ""
    },
    "Module 4": {
      "Ultra-clear":
      "https://sarvakaraum.s3.amazonaws.com/Course/Introduction+to+C+programming/Getting+Started.mp4"
    },
  };

  final Map<String, String> thumbnails = {
    "Module 1":
    "https://sarvakaraum.s3.amazonaws.com/Course/Introduction+to+C+programming/module1_orange.png",
    "Module 2":
    "https://sarvakaraum.s3.amazonaws.com/Course/Introduction+to+C+programming/module2_orange.png",
    "Module 3":
    "https://sarvakaraum.s3.amazonaws.com/Course/Introduction+to+C+programming/module3_orange.png",
    "Module 4":
    "https://sarvakaraum.s3.amazonaws.com/Course/Introduction+to+C+programming/module4_orange.png",
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
            settingsStyle: SettingsMenuStyle(
              paddingBetween: 10,
              items: [
                SettingsMenuItem(
                  themed: SettingsMenuItemThemed(
                    title: "Module",
                    subtitle: episode,
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
            ),
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
      00:00:03,400 --> 00:00:06,177
      In this lesson, we're going to
      be talking about finance. And
      2
      00:00:06,177 --> 00:00:10,009
      one of the most important aspects
      of finance is interest.
      3
      00:00:10,009 --> 00:00:13,655
      When I go to a bank or some
      other lending institution
      4
      00:00:13,655 --> 00:00:17,720
      to borrow money, the bank is happy
      to give me that money. But then I'm
      5
      00:00:17,900 --> 00:00:21,480
      going to be paying the bank for the
      privilege of using their money. And that
      6
      00:00:21,660 --> 00:00:26,440
      amount of money that I pay the bank is
      called interest. Likewise, if I put money
      7
      00:00:26,620 --> 00:00:31,220
      in a savings account or I purchase a
      certificate of deposit, the bank just
      8
      00:00:31,300 --> 00:00:35,800
      doesn't put my money in a little box
      and leave it there until later. They take
      9
      00:00:35,800 --> 00:00:40,822
      my money and lend it to someone
      else. So they are using my money.
      10
      00:00:40,822 --> 00:00:44,400
      The bank has to pay me for the privilege
      of using my money.
      11
      00:00:44,400 --> 00:00:48,700
      Now what makes banks
      profitable is the rate
      12
      00:00:48,700 --> 00:00:53,330
      that they charge people to use the bank's
      money is higher than the rate that they
      13
      00:00:53,510 --> 00:01:00,720
      pay people like me to use my money. The
      amount of interest that a person pays or
      14
      00:01:00,800 --> 00:01:06,640
      earns is dependent on three things. It's
      dependent on how much money is involved.
      15
      00:01:06,820 --> 00:01:11,300
      It's dependent upon the rate of interest
      being paid or the rate of interest being
      16
      00:01:11,480 --> 00:01:17,898
      charged. And it's also dependent upon
      how much time is involved. If I have
      17
      00:01:17,898 --> 00:01:22,730
      a loan and I want to decrease the amount
      of interest that I'm going to pay, then
      18
      00:01:22,800 --> 00:01:28,040
      I'm either going to have to decrease how
      much money I borrow, I'm going to have
      19
      00:01:28,220 --> 00:01:32,420
      to borrow the money over a shorter period
      of time, or I'm going to have to find a
      20
      00:01:32,600 --> 00:01:37,279
      lending institution that charges a lower
      interest rate. On the other hand, if I
      21
      00:01:37,279 --> 00:01:41,480
      want to earn more interest on my
      investment, I'm going to have to invest
      22
      00:01:41,480 --> 00:01:46,860
      more money, leave the money in the
      account for a longer period of time, or
      23
      00:01:46,860 --> 00:01:49,970
      find an institution that will pay
      me a higher interest rate.
      ''';

    return VideoViewer(
      source: {
        "SubRip Caption": VideoSource(
          video: VideoPlayerController.network(
              "https://www.speechpad.com/proxy/get/marketing/samples/standard-captions-example.mp4"),
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