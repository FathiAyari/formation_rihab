import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          centerTitle: true,
          title: Text(" first page"),
          leading: Icon(Icons.arrow_back),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                    return Details();
                  }));

                  /*   Navigator.pop(context);
                  Navigator.of(context).pop();*/
                },
                icon: Icon(Icons.more_vert_sharp))
          ],
        ),
        body: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              /*      Expanded(
                child: Container(
                  width: 60,
                  color: Colors.red,
                ),
              ),
              Expanded(
                child: Container(
                  width: 60,
                  color: Colors.cyan,
                ),
              ),
              Flexible(
                child: Container(
                  width: 60,
                  color: Colors.orange,
                ),
              ),*/
              StepperScreen()
            ],
          ),
        ));
  }
}

class Details extends StatefulWidget {
  const Details({Key? key}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  String test = "test";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("initstate here");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [],
      ),
    );
  }
}

class StepperScreen extends StatefulWidget {
  const StepperScreen({Key? key}) : super(key: key);

  @override
  State<StepperScreen> createState() => _StepperScreenState();
}

class _StepperScreenState extends State<StepperScreen> {
  int currentStep = 0;

  List<Step> steps() => [
        Step(
            state: currentStep > 0 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 0,
            title: Text("title1"),
            content: Container(
              child: Text("hne thot el from wela el content eli hachtek bih"),
            )),
        Step(
            state: currentStep > 1 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 1,
            title: Text("title2"),
            content: Container(
              child: Text("hne thot el from wela el content eli hachtek bih"),
            )),
        Step(
            state: currentStep > 2 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 2,
            title: Text("title2"),
            content: Container(
              child: Text("hne thot el from wela el content eli hachtek bih"),
            )),
      ];

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        child: Stepper(
            currentStep: currentStep,
            onStepTapped: (stepIndex) {
              setState(() {
                currentStep = stepIndex;
              });
            },
            controlsBuilder: (BuildContext context, ControlsDetails details) {
              return Row(
                children: <Widget>[
                  TextButton(
                    onPressed: details.onStepCancel,
                    child: const Text('Retour'),
                  ),
                  TextButton(
                    onPressed: details.onStepContinue,
                    child: const Text('Suivant'),
                  ),
                ],
              );
            },
            onStepContinue: () {
              //here you have to make sure that at the last element you should give the continue button the fina treatement you need

              final atLastStep = currentStep == steps().length - 1;
              if (atLastStep) {
                // hne bch thot el fonction wela el traitement el hachtek biha baa3ed ma tkaml tousel lel step le5ra

                print("task finished");
              } else {
                setState(() {
                  currentStep++;
                });
              }
            },
            onStepCancel: currentStep == 0
                ? null
                : () => setState(() {
                      currentStep--;
                    }),
            type: StepperType.vertical,
            steps: steps()));
  }
}
