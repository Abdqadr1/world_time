import 'package:flutter/material.dart';
import 'package:world_time/actions/Slider.dart';

class CarouselScreen extends StatefulWidget {


  @override
  State<CarouselScreen> createState() => _CarouselScreenState();
}

class _CarouselScreenState extends State<CarouselScreen> {

  int currentPage = 0;
  final _pageController = PageController();

  List<MySlider> mySliders = [
    MySlider(title: 'Nigeria', description: "Giant of Africa", image: "nigeria.png"),
    MySlider(title: 'Egypt', description: "Next to Palestine", image: "egypt.png"),
    MySlider(title: 'Kenya', description: "Somewhere in Africa", image: "kenya.png"),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: null,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(14.0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: TextButton(
                      onPressed: (){
                        Navigator.pushNamed(context, '/drawer');
                      },
                      child: Text(
                        'Skip',
                        style: TextStyle( color: Colors.red[200], fontSize: 18 ),
                      )
                    ),
                  ),
                  Expanded(
                    child: PageView.builder(
                      controller: _pageController,
                      onPageChanged: (index){
                        setState(() {
                          currentPage = index;
                        });
                      },
                      itemCount: mySliders.length,
                      itemBuilder: (context, index){
                        MySlider item = mySliders[index];
                        return Column(
                          children: [
                            Image.asset('assets/${item.image}', height: 450,),
                            SizedBox(height: 20,),
                            Text(
                              item.title,
                              style: Theme.of(context).
                              textTheme.headlineMedium!.
                              copyWith(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 28),
                            ),
                            SizedBox(height: 20,),
                            Text(
                              item.description,
                              style: TextStyle(color: Color.fromARGB(255, 94, 92, 92), fontSize: 18),
                            )
                          ],
                        );
                      }
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(mySliders.length, (index) {
                      return Padding(
                        padding: EdgeInsets.all(10.0),
                        child: AnimatedContainer(
                          duration: Duration(microseconds: 300),
                          height: 10,
                          width: index == currentPage ? 25 : 15,
                          decoration: BoxDecoration(
                            color: index == currentPage ? Colors.grey : Colors.red[500],
                            borderRadius: BorderRadius.circular(5)
                          ),
                        ),
                      );
                    }),
                  )
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.redAccent,
            onPressed: (){
              if(currentPage < mySliders.length - 1){

                _pageController.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeOut
                );

              }else{

                _pageController.previousPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeOut
                );
              }

            },
            child: currentPage == mySliders.length - 1 ? Icon(Icons.arrow_back): Icon(Icons.arrow_forward),
          ),
        ),
      ),
    );
  }
}
