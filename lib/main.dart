import 'package:flutter/material.dart';
void main()
{
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
      theme: ThemeData.dark(
        useMaterial3: FutureBuilder.debugRethrowError,
      ),

      debugShowCheckedModeBanner: true,
      title: 'BMI Calculator',
    );
  }
}
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String result="";
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      appBar:
      new AppBar(

        backgroundColor:Colors.transparent,
        excludeHeaderSemantics: false,
        elevation:100,
        bottomOpacity: 100,
        shadowColor: Colors.purpleAccent,
        foregroundColor: Colors.grey,
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: new Text('Body Mass Index Calculator',
          style: new TextStyle(
            color: Colors.yellow,
            fontWeight: FontWeight.bold,
            wordSpacing: 10,
            fontFamily: 'OoohBaby-Regular',
            fontSize: 20,
          ),
        ),
        actions: [
          Icon(Icons.add_card_sharp, color: Colors.blue, fill: 0,

          )
        ],
      ),
      body:
      new Column(

        children: [
          SizedBox(
            height: 80,
          ),

          new Text('Enter Height in Cm', style: TextStyle(color: Colors.yellowAccent,
              fontWeight: FontWeight.bold,
              fontSize: 22,
              letterSpacing: 2,
              decorationColor: Colors.green),
          ),
          Padding(padding: EdgeInsets.all(10)),
          TextField(
            keyboardType: TextInputType.number,
            controller: heightController,
            decoration: InputDecoration(
                hintText: "   Enter The Height In Cm",
                fillColor: Colors.grey,
                filled: true,
                hoverColor: Colors.green,
                contentPadding: EdgeInsets.all(0.5),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50))
            ),
          ),

          SizedBox(
            height: 20,
          ),
          Padding(padding: EdgeInsets.all(10)),
          new Text("Enter The Weight in Kg: ",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.green,
              fontSize: 22,
              letterSpacing: 2,

            ),),
          Padding(padding: EdgeInsets.all(10)),
          TextField(
            keyboardType: TextInputType.number,
            controller: weightController,
            decoration: InputDecoration(
              hintText: "   Enter Weight in Kgs",
              filled: true,
              fillColor: Colors.grey,
              contentPadding: EdgeInsets.all(0.5),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide(color: Colors.white)
              ),
            ),
          ),
          Padding(padding: EdgeInsets.all(20)),
          new Text('Result Area',
            style: TextStyle(
              color: Colors.amber,
              fontSize: 20,
            ),),
          Container(
            padding: EdgeInsets.all(5),
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.elliptical(10, 20)),
                gradient: LinearGradient(colors:[Colors.red,Colors.blue])
            ),
            child: FloatingActionButton(onPressed: () {
              double height = double.parse(heightController.value.text);
              double weight = double.parse(weightController.value.text);
              CalculateBmi(height, weight);
            },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.elliptical(15, 20),bottom: Radius.zero)
              ),
              child: Text('Press To Calculate', style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontFamily:'IndieFlower',

                wordSpacing: 10,

              ),
              ),
            ),
          ),
          Padding(padding: EdgeInsets.all(17)),
          SizedBox(
            height: 20,
          ),
          new Text('Your Body Mass Index is: ',
            style: TextStyle(
              color: Colors.yellowAccent,
              fontSize: 32.5,
              debugLabel: "Hii",
              inherit: true,
              height: 0.5,
              fontWeight: FontWeight.bold,
              fontFamily: 'OoohBaby-Regular',

            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: Text(
              "$result",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.red,
                letterSpacing: 2,


              ),
            ),
          )
        ],
      ),
    );
  }

  void CalculateBmi(double height, double weight) {
    double finalresult = (weight / (height * height/10000));
    String bmi = finalresult.toStringAsFixed(3);
    setState(() {
      result = bmi;
    });
  }


}
