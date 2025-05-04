import 'dart:io';
import 'dart:ui' as ui;
import 'dart:math';

import 'package:flutter/material.dart';
//import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:video_player/video_player.dart';

import 'package:carousel_slider/carousel_slider.dart';



void testUrl() async {
  final res = await http.get(
    Uri.parse('https://adimg.cgv.co.kr/images/202505/SevenVeils/SevenVeils_1080x608_PC.mp4'),
  );
  print('statusCode = ${res.statusCode}');
}



void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});


  @override
  _MainAppState createState() => _MainAppState();
}


class _MainAppState extends State<MainApp> {
  List<dynamic> imgList = [
    //'data:image/jpeg;base64,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',
    //'data:image/jpeg;base64,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',
    'https://adimg.cgv.co.kr/images/202505/SevenVeils/980x80.jpg',
  ];


  int routeNo = 0;
  late Timer _timer;

  final _formKey = GlobalKey<FormState>();

  final FocusNode _node = FocusNode();

  String url = 'https://adimg.cgv.co.kr/images/202505/SevenVeils/SevenVeils_1080x608_PC.mp4';

  late final VideoPlayerController _controller;
  late final Future<void> _ready;

  bool isMovie = true;
  bool isPlan = false;
  late List<bool> isSelected;



  List<MovieInfo> movie_chart = [
    MovieInfo(posterUrl: 'https://img.cgv.co.kr/Movie/Thumbnail/Poster/000089/89578/89578_320.jpg', title: '썬더볼츠', goldenEgg: 91, reserveRate: 0.165),
    MovieInfo(posterUrl: 'https://img.cgv.co.kr/Movie/Thumbnail/Poster/000089/89528/89528_320.jpg', title: 'A MINECRAFT MOVIE', goldenEgg: 88, reserveRate: 0.161),
    MovieInfo(posterUrl: 'https://img.cgv.co.kr/Movie/Thumbnail/Poster/000089/89568/89568_320.jpg', title: '파과', goldenEgg: 93, reserveRate: 0.123),
    MovieInfo(posterUrl: 'https://img.cgv.co.kr/Movie/Thumbnail/Poster/000089/89454/89454_320.jpg', title: '야당', goldenEgg: 93, reserveRate: 0.107),
    MovieInfo(posterUrl: 'https://img.cgv.co.kr/Movie/Thumbnail/Poster/000089/89548/89548_320.jpg', title: '거룩한 밤: 데몬 헌터스', goldenEgg: 71, reserveRate: 0.09),
    MovieInfo(posterUrl: 'https://img.cgv.co.kr/Movie/Thumbnail/Poster/000089/89583/89583_320.jpg', title: '바이러스', goldenEgg: 99, reserveRate: 0.076),
    MovieInfo(posterUrl: 'https://img.cgv.co.kr/Movie/Thumbnail/Poster/000089/89633/89633_320.jpg', title: '이세계 페스티벌 2025 - 이세계아이동 Part', goldenEgg: 97, reserveRate: 0.037),
    MovieInfo(posterUrl: 'https://img.cgv.co.kr/Movie/Thumbnail/Poster/000089/89563/89563_320.jpg', title: '스노우 폭스2: 몬스터타운 구하기', goldenEgg: 88, reserveRate: 0.028),
    MovieInfo(posterUrl: 'https://img.cgv.co.kr/Movie/Thumbnail/Poster/000080/80500/80500_320.jpg', title: '플로리다 프로젝트트', goldenEgg: 92, reserveRate: 0.027),
    MovieInfo(posterUrl: 'https://img.cgv.co.kr/Movie/Thumbnail/Poster/000089/89630/89630_320.jpg', title: '세븐 베링즈', goldenEgg: 99, reserveRate: 0.027),
    MovieInfo(posterUrl: 'https://img.cgv.co.kr/Movie/Thumbnail/Poster/000089/89632/89632_320.jpg', title: '에이티즈 월드 투어 [투워즈 더 라이트 : 윌 투 파워] 인 시네마 ', goldenEgg: 99, reserveRate: 0.024),
    MovieInfo(posterUrl: 'https://img.cgv.co.kr/Movie/Thumbnail/Poster/000089/89520/89520_320.jpg', title: '헤피엔드', goldenEgg: 96, reserveRate: 0.018),
    MovieInfo(posterUrl: 'https://img.cgv.co.kr/Movie/Thumbnail/Poster/000084/84279/84279_320.jpg', title: '극장판 귀멸의 칼날-무한열차편', goldenEgg: 94, reserveRate: 0.016),
    MovieInfo(posterUrl: 'https://img.cgv.co.kr/Movie/Thumbnail/Poster/000089/89582/89582_320.jpg', title: '시크릿쥬쥬 마법의 하모니 ', goldenEgg: 89, reserveRate: 0.015),
    MovieInfo(posterUrl: 'https://img.cgv.co.kr/Movie/Thumbnail/Poster/000089/89570/89570_320.jpg', title: '2025 스타레일 감상회 in CGV 앵콜 상영', goldenEgg: 93, reserveRate: 0.010),
    MovieInfo(posterUrl: 'https://img.cgv.co.kr/Movie/Thumbnail/Poster/000089/89601/89601_320.jpg', title: '폴킴, 친애하는 당신꼐꼐', goldenEgg: 97, reserveRate: 0.009),
    MovieInfo(posterUrl: 'https://img.cgv.co.kr/Movie/Thumbnail/Poster/000089/89571/89571_320.jpg', title: '괴수 8호: 미션 리컨컨', goldenEgg: 99, reserveRate: 0.007),
    MovieInfo(posterUrl: 'https://img.cgv.co.kr/Movie/Thumbnail/Poster/000089/89425/89425_320.jpg', title: '콘클라베', goldenEgg: 97, reserveRate: 0.006),
    MovieInfo(posterUrl: 'https://img.cgv.co.kr/Movie/Thumbnail/Poster/000089/89657/89657_320.jpg', title: '슈가 글라스 보틀', goldenEgg: 0, reserveRate: 0.006),
    MovieInfo(posterUrl: 'https://img.cgv.co.kr/Movie/Thumbnail/Poster/000089/89598/89598_320.jpg', title: '우리가 빛이라 상상하는 모든 것', goldenEgg: 92, reserveRate: 0.004),
  ];


  final CarouselSliderController _ctrl = CarouselSliderController();
  int _current = 0;






  @override
   void initState() {
    _timer = Timer.periodic(Duration(seconds: 5), (timer) {
      setState(() {
        routeNo = (routeNo + 1) % imgList.length;
      });
    });

    _node.addListener(() => setState(() {}));

    _controller = VideoPlayerController.networkUrl(Uri.parse(url));
                  /*
                  ..initialize()
                  ..setLooping(true)
                  ..play();
                  */

    _ready = _controller.initialize().then((_){
      _controller
      ..setLooping(true)
      ..play();
    });


    isSelected = [isMovie, isPlan];
    

    /*_ready = _controller.initialize().then((_) {
      _controller
        ..setLooping(true)
        ..play();
    });*/

    super.initState();
  }


   @override
  void dispose() {
    _timer.cancel();        
    _node.dispose();            
    _controller.dispose();   
    super.dispose();
  }


 
  @override
  Widget build(BuildContext context) {
    //testUrl();
    
    
    return MaterialApp(
      theme: ThemeData(
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black54,
        elevation: 0,
        textStyle: const TextStyle(fontSize: 16),
      ),
    ),
  ),
      home: Scaffold(
        body: SingleChildScrollView(
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.start,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //Advertisement Banner
              adBanner(),
              headerMneu(),
              adVideo(),
              movieChart(),
              
            ],
          ),
        ),
        
       /*
         floatingActionButton: FloatingActionButton(
                onPressed: showdialog,
                child: const Text("button"),
                )
                */
        ),
    );
  }

  //Advertisement Banner
  Widget adBanner() {
      return Container(
        width: MediaQuery.of(context).size.width,
        height: 80,
        decoration: BoxDecoration(
          color: Colors.black,
        ),
        child: Image.network(
          imgList[routeNo%imgList.length],
          width: 1040,
          errorBuilder: (context, error, stackTrace) {
            return Center(
              child: Text("Advertisement Banner", style: TextStyle(color: Colors.white),),
            );
            //Image.asset('assets/images/b1.jpg'),
          }
        ),
      );
  }



  //Header Menu
  Widget headerMneu(){
    var _textVal;
    final bool focused = _node.hasFocus;

    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        //row1
        SizedBox(
          height: 113,
          child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                height: 53,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Image.network('https://img.cgv.co.kr/R2014/images/common/logo/logoRed.png'),
                    Text("DEEP DIVE SPACE", style: TextStyle(fontSize: 18),)
                  ],
                ),
              ),

            
            
            Container(width: 250),



            Row(
              children: [
                Image.network("https://img.cgv.co.kr/WingBanner/2025/0409/17441769177250.jpg", 
                        width: 136,
                        height: 39,
                        fit: BoxFit.contain
                        ),

                Container(
                  margin: EdgeInsets.fromLTRB(40, 0, 0, 0),
                  child: InkWell(
                    onTap:() {},
                    child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network("https://img.cgv.co.kr/R2014/images/common/ico/loginPassword.png", 
                        width: 36,
                        height: 36,
                        fit: BoxFit.contain
                        ),
                      Text("로그인", style: TextStyle(fontSize: 13),)
                    ],
                  ),
                  )
                ),

                Container(
                  margin: EdgeInsets.fromLTRB(40, 0, 0, 0),
                  child: InkWell(
                    onTap:() {},
                    child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network("https://img.cgv.co.kr/R2014/images/common/ico/loginJoin.png", 
                        width: 36,
                        height: 36,
                        fit: BoxFit.contain
                        ),
                      Text("회원가입", style: TextStyle(fontSize: 13),)
                    ],
                  ),
                  )
                ),

                Container(
                  margin: EdgeInsets.fromLTRB(40, 0, 0, 0),
                  child: InkWell(
                    onTap:() {},
                    child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network("https://img.cgv.co.kr/R2014/images/common/ico/loginMember.png", 
                        width: 36,
                        height: 36,
                        fit: BoxFit.contain
                        ),
                      Text("MY CGV", style: TextStyle(fontSize: 13),)
                    ],
                  ),
                  )
                ),


                Container(
                  margin: EdgeInsets.fromLTRB(40, 0, 0, 0),
                  child: InkWell(
                    onTap:() {},
                    child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network("https://img.cgv.co.kr/R2014/images/common/ico/loginCustomer.png", 
                        width: 36,
                        height: 36,
                        fit: BoxFit.contain
                        ),
                      Text("고객센터", style: TextStyle(fontSize: 13),)
                    ],
                  ),
                  )
                ),
              ],
            ),
          ],
        ),
        ),

        //row2
        Container(
          decoration: BoxDecoration(
            border: Border(top: BorderSide(color: Colors.black38,  width: 1)),
            color: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
              child: Row(
              children: [ 
                ElevatedButton (
                  onPressed: (){},
                  style: ElevatedButton.styleFrom(
                     backgroundColor: Colors.white,
                     elevation: 0,
                     shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                     ),
                     
                  ),
                  onHover:(value) {
                    
                  },
                  child: Text("영화", style: TextStyle(fontSize: 16, color: Colors.black,)),
                  ),
                  ElevatedButton (
                  onPressed: (){},
                  style: ElevatedButton.styleFrom(
                     backgroundColor: Colors.white,
                     elevation: 0,
                     shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                     ),
                     
                  ),
                  onHover:(value) {
                    
                  },
                  child: Text("극장", style: TextStyle(fontSize: 16, color: Colors.black,)),
                  ),
                  ElevatedButton (
                  onPressed: (){},
                  style: ElevatedButton.styleFrom(
                     backgroundColor: Colors.white,
                     elevation: 0,
                     shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                     ),
                     
                  ),
                  onHover:(value) {
                    
                  },
                  child: Text("예매", style: TextStyle(fontSize: 16, color: Colors.red,)),
                  ),
                  ElevatedButton (
                  onPressed: (){},
                  style: ElevatedButton.styleFrom(
                     backgroundColor: Colors.white,
                     elevation: 0,
                     shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                     ),
                     
                  ),
                  onHover:(value) {
                    
                  },
                  child: Text("스토어", style: TextStyle(fontSize: 16, color: Colors.black,)),
                  ),
                  ElevatedButton (
                  onPressed: (){},
                  style: ElevatedButton.styleFrom(
                     backgroundColor: Colors.white,
                     elevation: 0,
                     shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                     ),
                     
                  ),
                  onHover:(value) {
                    
                  },
                  child: Text("이벤트", style: TextStyle(fontSize: 16, color: Colors.black,)),
                  ),
                  ElevatedButton (
                  onPressed: (){},
                  style: ElevatedButton.styleFrom(
                     backgroundColor: Colors.white,
                     elevation: 0,
                     shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                     ),
                     
                  ),
                  onHover:(value) {
                    
                  },
                  child: Text("혜택", style: TextStyle(fontSize: 16, color: Colors.black,)),
                  ),
              ],
            ),
            ),


            Container(width: 250,),


            Container(
              height: 20,
              decoration: BoxDecoration(
                border: Border(left: BorderSide(width: 0.5, color: Colors.black45),)
              ),
              padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
            ),
            
               Row(
                
              children: [
                Form(
                  key: _formKey,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                    SizedBox(
              height: 24,
              width: 187,
              child: TextFormField(
                focusNode: _node,
                     textAlignVertical: TextAlignVertical.top,
                    decoration: InputDecoration(
                      contentPadding: focused
                                      ? const EdgeInsets.symmetric(vertical: 0,  horizontal: 4)
                                      : const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                      border: InputBorder.none,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                        )
                      ),
                      isDense: true,

                       
                      hintText: focused ? '' : 'ad title',
                      hintStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      ),
                      
                    ),
                    cursorColor: Colors.black,
                    cursorHeight: 18,
                  )
                  
            ),

            IconButton(

              onPressed: (){}, 
              icon: Icon(Icons.search),
              )
                  ],
                  )
                  )
              ],
            ),

            Container(
              height: 20,
              decoration: BoxDecoration(
                border: Border(right: BorderSide(width: 0.5, color: Colors.black45),)
              ),
              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
            ),

            Container(width: 40,),
            
          ],
        ),
        )
      ],
    ),
    );
  }


Widget adVideo() {
  final Size sz = _controller.value.size;
  
  return Container(
    height: _controller.value.isInitialized ? sz.height : 550,
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
      color: Colors.black,
    ),
    child: Stack(
      children: [

        FutureBuilder(
    future: _ready,                     // 초기화 완료 대기
    builder: (context, snap) {
      if (snap.connectionState != ConnectionState.done) {
        return Center(child: CircularProgressIndicator(
          color: Colors.red,
        ));
      }

      return Center(
          child:AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: VideoPlayer(_controller),
        ),
        );
    },
  ),
        


        Positioned.fill(
          child: Container(
            width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: const [
              Colors.black, 
              Colors.transparent,
              Colors.black, 
            ],
            stops: const [0.1, 0.5, 0.9],
          )
          ),
        ),
        ),
       
         Center(
          child: SizedBox(
          //color: Colors.blue,
          width: sz.width*0.9,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("세븐 베일즈", style: TextStyle(fontSize: 35, color: Colors.white),),
            Container(height: 15),
            Text("찰스는 죽었어!\n무대의 주인은 나야", style: TextStyle(fontSize: 18, color: Colors.white),),
            Container(height: 20),
            SizedBox(
              width:105,
              child: ElevatedButton(
              onPressed: (){},
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("상세보기", style: TextStyle(fontSize: 15, color: Colors.black54),), Icon(Icons.chevron_right_rounded)
                ],
              )
              ),
            )
          ],
        ),
        ),
         )
        
      ],
    ),
  );
}




Widget movieChart(){
  // 한 화면에 보여줄 카드 수
  const int perPage = 5;

  /// 현재 그룹(0, 1, 2 …) 반환
  int _group = (_current / perPage).floor();

  /// 리스트 끝(마지막 카드 인덱스) 반환
  int _maxIndex = movie_chart.length - 1;

  void _goNext() {
    final next = min(_current + perPage, _maxIndex);
    _ctrl.animateToPage(next,
        duration: const Duration(milliseconds: 500), curve: Curves.ease);
  }

  void _goPrev() {
    final prev = max(_current - perPage, 0);
    _ctrl.animateToPage(prev,
        duration: const Duration(milliseconds: 500), curve: Curves.ease);
  }


  return Container(
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
      color: Colors.white,
    ),
    child: Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          
            Row(
              children: [
                InkWell(
                  child: Padding(
                    padding: EdgeInsets.all(15), 
                    child: Text("무비차트", style: isSelected[0] 
                                                  ? TextStyle(fontSize: 27, color: Colors.black) 
                                                  : TextStyle(fontSize: 27, color: Colors.grey)),
                  ),
                  onTap: (){
                    isMovie = true;
                    isPlan = false;

                    setState(() {
                       isSelected = [isMovie, isPlan];
                    });
                  },
                ), 
                Container(width: 0.5, height: 10, color: Colors.grey),
                InkWell(
                  child: Padding(
                    padding: EdgeInsets.all(15), 
                    child: Text("상영예정작", style: isSelected[1] 
                                                      ? TextStyle(fontSize: 27, color: Colors.black) 
                                                      : TextStyle(fontSize: 27, color: Colors.grey)),
                  ),
                  onTap: (){
                    isMovie = false;
                    isPlan = true;

                    setState(() {
                       isSelected = [isMovie, isPlan];
                    });
                  },
                ), 
              ],
            ),

            Container(width: 600),


            SizedBox(
              width:105,
              child: ElevatedButton(
              onPressed: (){},
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(0),
                side:BorderSide(
                  color: Colors.grey,
                  width: 0.5,
                )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("전체보기", style: TextStyle(fontSize: 15, color: Colors.black54),), Icon(Icons.chevron_right_rounded)
                ],
              )
              ),
            )
          
        ],
      ),

      Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width : 1040,
            child: CarouselSlider.builder(
          carouselController: _ctrl,
          itemCount: movie_chart.length,
          itemBuilder: (_, idx, __) => MovieCard(movie_chart[idx]),
          options: CarouselOptions(
            height: 330,              // 카드 높이
            viewportFraction: 0.2,    // 1/5 화면 폭
            enableInfiniteScroll: true,
            enlargeCenterPage: false, // 가운데 확대 끔
            onPageChanged: (i, _) => setState(() => _current = i),
          ),
        ),
          ),

        Positioned(
          child: IconButton(
            alignment: Alignment.centerRight,
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: _current == 0 ? null : _goPrev,
            ),),

        Positioned(
          child: IconButton(
            alignment: Alignment.centerRight,
              icon: const Icon(Icons.arrow_forward_ios),
              onPressed: _current >= _maxIndex ? null : _goNext,
            ),
            )
        ],
      )



    ],
  ),
  );
}



}






class MovieInfo {
  final String posterUrl;
  final String title;
  final int goldenEgg;      // 0 ~ 100
  final double reserveRate; // 예매율 %

  const MovieInfo({
    required this.posterUrl,
    required this.title,
    required this.goldenEgg,
    required this.reserveRate,
  });
}



class MovieCard extends StatelessWidget {
  const MovieCard(this.data, {super.key});
  final MovieInfo data;


  String _trimWithEllipsis(String text, int max) =>
    text.length <= max ? text : '${text.substring(0, max)}…';



  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white,
      //shape: Border.all(),
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 6),
      child: Column(
        children: [
          Expanded(
            child:ClipRRect(
                borderRadius: BorderRadius.circular(10), 
                child:Image.network(data.posterUrl, fit: BoxFit.cover),
                )
            
          ),
          const SizedBox(height: 4),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Column(
              children: [
                Text(_trimWithEllipsis(data.title, 12),
              style:
                  const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,  
              textAlign: TextAlign.center),
          const SizedBox(height: 2),
          Text('GoldenEgg ${data.goldenEgg}%',
              style: const TextStyle(fontSize: 11)),
          Text('예매율 ${data.reserveRate.toStringAsFixed(1)}%',
              style: const TextStyle(fontSize: 11)),
          const SizedBox(height: 6),
              ],
            ),)
        ],
      ),
    );
  }
}