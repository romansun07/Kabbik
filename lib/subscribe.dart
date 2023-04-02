import 'package:flutter/material.dart';

class SubscribePage extends StatefulWidget {
  const SubscribePage({super.key});

  @override
  State<SubscribePage> createState() => _SubscribePageState();
}

class _SubscribePageState extends State<SubscribePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Alignment> _topAlignmentAnimation;
  late Animation<Alignment> _bottomAlignmentAnimation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 4));
    _topAlignmentAnimation = TweenSequence<Alignment>(
      [
        TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
              begin: Alignment.topLeft, end: Alignment.topRight),
          weight: 2,
        ),
        TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
              begin: Alignment.topRight, end: Alignment.bottomRight),
          weight: 2,
        ),
        TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
              begin: Alignment.bottomRight, end: Alignment.bottomLeft),
          weight: 2,
        ),
        TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
              begin: Alignment.bottomLeft, end: Alignment.topLeft),
          weight: 2,
        ),
      ],
    ).animate(_controller);

    _bottomAlignmentAnimation = TweenSequence<Alignment>(
      [
        TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
              begin: Alignment.topRight, end: Alignment.bottomLeft),
          weight: 2,
        ),
        TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
              begin: Alignment.bottomLeft, end: Alignment.topLeft),
          weight: 2,
        ),
        TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
              begin: Alignment.topLeft, end: Alignment.topRight),
          weight: 2,
        ),
        TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
              begin: Alignment.topRight, end: Alignment.bottomRight),
          weight: 2,
        ),
      ],
    ).animate(_controller);

    _controller.repeat();
  }

// TweenSequence

  // Color _backgroundColor = Colors.blue;
  // Timer? _timer;

  // @override
  // void initState() {
  //   super.initState();
  //   _startTimer();
  // }

  // @override
  // void dispose() {
  //   _stopTimer();
  //   super.dispose();
  // }

  // void _startTimer() {
  //   _timer = Timer.periodic(const Duration(seconds: 2), (_) {
  //     final random = Random();
  //     setState(() {
  //       _backgroundColor = Color.fromARGB(
  //         random.nextInt(256),
  //         random.nextInt(256),
  //         random.nextInt(256),
  //         1,
  //       );
  //     });
  //   });
  // }

  // void _stopTimer() {
  //   _timer?.cancel();
  //   _timer = null;
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xff0C1B3E),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const Text('Subscribe'),
          leading: IconButton(
            onPressed: (() {
              Navigator.pop(context);
            }),
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: SingleChildScrollView(
          reverse: true,
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Column(
                children: const [
                  Text('সাবস্ক্রিপশন প্যাকেজ'),
                  Text('সাবস্ক্রিপশন করে উপভোগ করুন কাব্যিক এর'),
                  Text('প্রিমিয়াম ফীচার'),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // AnimatedContainer(
                  //   duration: const Duration(milliseconds: 700),
                  //   height: 150,
                  //   width: 350,
                  //   decoration: BoxDecoration(
                  //     // color: _backgroundColor,
                  //     borderRadius: BorderRadius.circular(15),
                  //     border: Border.all(width: 3, color: Colors.blue),
                  //     // boxShadow: const [
                  //     //   BoxShadow(
                  //     //     color: Color.fromARGB(255, 72, 214, 136),
                  //     //     spreadRadius: 1,
                  //     //     blurRadius: 5,
                  //     //     offset: Offset(2, 2),
                  //     //   ),
                  //     //   BoxShadow(
                  //     //     color: Color.fromARGB(255, 255, 255, 255),
                  //     //     spreadRadius: 2,
                  //     //     blurRadius: 5,
                  //     //     offset: Offset(-2, -2),
                  //     //   ),
                  //     // ],
                  //   ),
                  //   child: TextButton(
                  //     onPressed: (() {
                  //       showModalBottomSheet(
                  //           context: context,
                  //           backgroundColor: Colors.blue,
                  //           shape: const RoundedRectangleBorder(
                  //             borderRadius: BorderRadius.only(
                  //               topLeft: Radius.circular(10.0),
                  //               topRight: Radius.circular(10.0),
                  //             ),
                  //           ),
                  //           builder: (BuildContext context) {
                  //             return SingleChildScrollView(
                  //               child: Column(
                  //                 children: [
                  //                   Align(
                  //                     alignment: Alignment.topRight,
                  //                     child: IconButton(
                  //                       onPressed: (() {
                  //                         Navigator.pop(context);
                  //                       }),
                  //                       icon: const Icon(Icons.arrow_drop_down,
                  //                           size: 30, color: Colors.white),
                  //                     ),
                  //                   ),
                  //                   const Align(
                  //                     alignment: Alignment.topCenter,
                  //                     child: Text(
                  //                       '''  মাসিক প্যাকেজ                                               ৳ ৫০''',
                  //                       style: TextStyle(
                  //                         fontSize: 24.0,
                  //                         fontWeight: FontWeight.bold,
                  //                         color: Color.fromARGB(
                  //                             255, 255, 255, 255),
                  //                       ),
                  //                     ),
                  //                   ),
                  //                   const SizedBox(
                  //                     height: 30,
                  //                   ),
                  //                   const Text(
                  //                       'প্রমো কোড (শুধুমাত্র বিকাশ পেমেন্ট এর জন্য প্রযোজ্য)'),
                  //                   const SizedBox(
                  //                     height: 20,
                  //                   ),
                  //                   Container(
                  //                     decoration: BoxDecoration(
                  //                       color: const Color.fromARGB(
                  //                           255, 209, 183, 192),
                  //                       borderRadius: BorderRadius.circular(15),
                  //                     ),
                  //                     child: const TextField(
                  //                       decoration: InputDecoration(
                  //                         hintText: 'প্রমো কোডটি দিন...',
                  //                         prefixIcon: Icon(Icons.arrow_forward),
                  //                       ),
                  //                     ),
                  //                   ),
                  //                   const SizedBox(
                  //                     height: 30,
                  //                   ),
                  //                   const Text('পেমেন্ট মাধ্যম বাছাই করুন'),
                  //                   const SizedBox(
                  //                     height: 30,
                  //                   ),
                  //                   Row(
                  //                     mainAxisAlignment:
                  //                         MainAxisAlignment.spaceAround,
                  //                     children: [
                  //                       OutlinedButton(
                  //                         onPressed: () {},
                  //                         style: OutlinedButton.styleFrom(
                  //                           shape: RoundedRectangleBorder(
                  //                             borderRadius:
                  //                                 BorderRadius.circular(8.0),
                  //                           ),
                  //                           side: const BorderSide(
                  //                               color: Colors.red),
                  //                         ),
                  //                         child: Ink.image(
                  //                           fit: BoxFit.cover,
                  //                           image: const NetworkImage(
                  //                               'https://www.bssnews.net/assets/news_photos/2021/11/07/image-26832-1636289660.jpg'),
                  //                         ),
                  //                       ),
                  //                       OutlinedButton(
                  //                         onPressed: () {},
                  //                         style: OutlinedButton.styleFrom(
                  //                           shape: RoundedRectangleBorder(
                  //                             borderRadius:
                  //                                 BorderRadius.circular(8.0),
                  //                           ),
                  //                           side: const BorderSide(
                  //                               color: Colors.red),
                  //                         ),
                  //                         child: Ink.image(
                  //                           fit: BoxFit.cover,
                  //                           image: const NetworkImage(
                  //                               'https://www.bssnews.net/assets/news_photos/2021/11/07/image-26832-1636289660.jpg'),
                  //                         ),
                  //                       ),
                  //                       OutlinedButton(
                  //                         onPressed: () {},
                  //                         style: OutlinedButton.styleFrom(
                  //                           shape: RoundedRectangleBorder(
                  //                             borderRadius:
                  //                                 BorderRadius.circular(8.0),
                  //                           ),
                  //                           side: const BorderSide(
                  //                               color: Colors.red),
                  //                         ),
                  //                         child: Ink.image(
                  //                           fit: BoxFit.cover,
                  //                           image: const NetworkImage(
                  //                               'https://www.bssnews.net/assets/news_photos/2021/11/07/image-26832-1636289660.jpg'),
                  //                         ),
                  //                       ),
                  //                       const SizedBox(
                  //                         height: 100,
                  //                       ),
                  //                     ],
                  //                   ),
                  //                 ],
                  //               ),
                  //             );
                  //           });
                  //     }),
                  //     child: const Center(
                  //       child: Text(
                  //         'মাসিক প্যাকেজ টাকা ৫০ / ১ মাস (নবায়নযোগ্য)',
                  //         style: TextStyle(color: Colors.white, fontSize: 18),
                  //       ),
                  //     ),
                  //   ),
                  // ),

                  Center(
                    child: AnimatedBuilder(
                      animation: _controller,
                      builder: (context, _) {
                        return Container(
                          width: 350,
                          height: 150,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: const [
                                Color(0xFF5E35B1),
                                Color(0xFFD81B60),
                              ],
                              begin: _topAlignmentAnimation.value,
                              end: _bottomAlignmentAnimation.value,
                            ),
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                                width: 5, color: const Color(0xFF5E35B1)),
                          ),
                          child: TextButton(
                            onPressed: (() {
                              showModalBottomSheet(
                                  context: context,
                                  backgroundColor: const Color(0xff1c164f),
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10.0),
                                      topRight: Radius.circular(10.0),
                                    ),
                                  ),
                                  builder: (BuildContext context) {
                                    return SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          Align(
                                            alignment: Alignment.topRight,
                                            child: IconButton(
                                              onPressed: (() {
                                                Navigator.pop(context);
                                              }),
                                              icon: const Icon(
                                                Icons.arrow_drop_down,
                                                size: 30,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          const Align(
                                            alignment: Alignment.topCenter,
                                            child: Text(
                                              '''  মাসিক প্যাকেজ              ৳ ৫০''',
                                              style: TextStyle(
                                                fontSize: 24.0,
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromARGB(
                                                    255, 255, 255, 255),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 30,
                                          ),
                                          const Text(
                                              'প্রমো কোড (শুধুমাত্র বিকাশ পেমেন্ট এর জন্য প্রযোজ্য)'),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: const Color.fromARGB(
                                                  255, 209, 183, 192),
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            child: const TextField(
                                              decoration: InputDecoration(
                                                hintText: 'প্রমো কোডটি দিন...',
                                                suffixIcon: IconButton(
                                                    onPressed: null,
                                                    icon: Icon(Icons
                                                        .arrow_forward_ios)),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 30,
                                          ),
                                          const Text(
                                              'পেমেন্ট মাধ্যম বাছাই করুন'),
                                          const SizedBox(
                                            height: 30,
                                          ),
                                          SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Material(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  clipBehavior: Clip
                                                      .antiAliasWithSaveLayer,
                                                  child: InkWell(
                                                    onTap: () {},
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                        border: Border.all(
                                                          color: Colors.red,
                                                          width: 3,
                                                        ),
                                                      ),
                                                      child: Ink.image(
                                                        image: const AssetImage(
                                                            'assets/images/bkash.jpg'),
                                                        height: 150,
                                                        width: 150,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Material(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  clipBehavior: Clip
                                                      .antiAliasWithSaveLayer,
                                                  child: InkWell(
                                                    onTap: () {},
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                        border: Border.all(
                                                          color: Colors.red,
                                                          width: 3,
                                                        ),
                                                      ),
                                                      child: Ink.image(
                                                        image: const AssetImage(
                                                            'assets/images/shurjopay.jpg'),
                                                        height: 150,
                                                        width: 150,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Material(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  clipBehavior: Clip
                                                      .antiAliasWithSaveLayer,
                                                  child: InkWell(
                                                    onTap: () {},
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                        border: Border.all(
                                                          color: Colors.red,
                                                          width: 3,
                                                        ),
                                                      ),
                                                      child: Ink.image(
                                                        image: const AssetImage(
                                                            'assets/images/googlepay.jpg'),
                                                        height: 150,
                                                        width: 150,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 30,
                                          ),
                                        ],
                                      ),
                                    );
                                  });
                            }),
                            child: const Center(
                              child: Text(
                                'মাসিক প্যাকেজ টাকা ৫০ / ১ মাস (নবায়নযোগ্য)',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 150,
                        width: 150,
                        child: Container(
                          decoration: BoxDecoration(
                            // border: Border.all(
                            //   color: Colors.blueAccent,
                            //   width: 3,
                            // ),
                            gradient: const LinearGradient(
                              colors: [
                                Color.fromARGB(255, 0, 111, 201),
                                Color.fromARGB(255, 2, 19, 3)
                              ],
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight,
                            ),
                            borderRadius: BorderRadius.circular(15),
                            // boxShadow: const [
                            //   BoxShadow(
                            //     color: Color.fromARGB(255, 72, 214, 136),
                            //     spreadRadius: 1,
                            //     blurRadius: 5,
                            //     offset: Offset(2, 2),
                            //   ),
                            //   BoxShadow(
                            //     color: Color.fromARGB(255, 255, 255, 255),
                            //     spreadRadius: 2,
                            //     blurRadius: 5,
                            //     offset: Offset(-2, -2),
                            //   ),
                            // ],
                          ),
                          child: TextButton(
                            onPressed: () {
                              showModalBottomSheet(
                                  context: context,
                                  backgroundColor: const Color(0xff1c164f),
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10.0),
                                      topRight: Radius.circular(10.0),
                                    ),
                                  ),
                                  builder: (BuildContext context) {
                                    return SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          Align(
                                            alignment: Alignment.topRight,
                                            child: IconButton(
                                              onPressed: (() {
                                                Navigator.pop(context);
                                              }),
                                              icon: const Icon(
                                                  Icons.arrow_drop_down,
                                                  size: 30,
                                                  color: Colors.white),
                                            ),
                                          ),
                                          const Align(
                                            alignment: Alignment.topCenter,
                                            child: Text(
                                              '''  সাপ্তাহিক                        ৳ ৩৪৯''',
                                              style: TextStyle(
                                                fontSize: 24.0,
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromARGB(
                                                    255, 255, 255, 255),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 30,
                                          ),
                                          const Text(
                                              'প্রমো কোড (শুধুমাত্র বিকাশ পেমেন্ট এর জন্য প্রযোজ্য)'),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: const Color.fromARGB(
                                                  255, 209, 183, 192),
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            child: const TextField(
                                              decoration: InputDecoration(
                                                hintText: 'প্রমো কোডটি দিন...',
                                                suffixIcon: IconButton(
                                                    onPressed: null,
                                                    icon: Icon(Icons
                                                        .arrow_forward_ios)),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 30,
                                          ),
                                          const Text(
                                              'পেমেন্ট মাধ্যম বাছাই করুন'),
                                          const SizedBox(
                                            height: 30,
                                          ),
                                          SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Material(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  clipBehavior: Clip
                                                      .antiAliasWithSaveLayer,
                                                  child: InkWell(
                                                    onTap: () {},
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                        border: Border.all(
                                                          color: Colors.red,
                                                          width: 3,
                                                        ),
                                                      ),
                                                      child: Ink.image(
                                                        image: const AssetImage(
                                                            'assets/images/bkash.jpg'),
                                                        height: 150,
                                                        width: 150,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Material(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  clipBehavior: Clip
                                                      .antiAliasWithSaveLayer,
                                                  child: InkWell(
                                                    onTap: () {},
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                        border: Border.all(
                                                          color: Colors.red,
                                                          width: 3,
                                                        ),
                                                      ),
                                                      child: Ink.image(
                                                        image: const AssetImage(
                                                            'assets/images/shurjopay.jpg'),
                                                        height: 150,
                                                        width: 150,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Material(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  clipBehavior: Clip
                                                      .antiAliasWithSaveLayer,
                                                  child: InkWell(
                                                    onTap: () {},
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                        border: Border.all(
                                                          color: Colors.red,
                                                          width: 3,
                                                        ),
                                                      ),
                                                      child: Ink.image(
                                                        image: const AssetImage(
                                                            'assets/images/googlepay.jpg'),
                                                        height: 150,
                                                        width: 150,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 30,
                                          ),
                                        ],
                                      ),
                                    );
                                  });
                            },
                            child: const Text(
                              'সাপ্তাহিক ৳ ২০/৭ দিন (নবায়নযোগ্য )',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      SizedBox(
                        height: 150,
                        width: 150,
                        child: Container(
                          decoration: BoxDecoration(
                            // border: Border.all(
                            //   color: Colors.blueAccent,
                            //   width: 3,
                            // ),
                            gradient: const LinearGradient(
                              colors: [
                                Color.fromARGB(255, 0, 111, 201),
                                Color.fromARGB(255, 2, 19, 3)
                              ],
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight,
                            ),
                            borderRadius: BorderRadius.circular(15),
                            // boxShadow: const [
                            //   BoxShadow(
                            //     color: Color.fromARGB(255, 72, 214, 136),
                            //     spreadRadius: 1,
                            //     blurRadius: 5,
                            //     offset: Offset(2, 2),
                            //   ),
                            //   BoxShadow(
                            //     color: Color.fromARGB(255, 255, 255, 255),
                            //     spreadRadius: 2,
                            //     blurRadius: 5,
                            //     offset: Offset(-2, -2),
                            //   ),
                            // ],
                          ),
                          child: TextButton(
                            onPressed: () {
                              showModalBottomSheet(
                                  context: context,
                                  backgroundColor: const Color(0xff1c164f),
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10.0),
                                      topRight: Radius.circular(10.0),
                                    ),
                                  ),
                                  builder: (BuildContext context) {
                                    return SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          Align(
                                            alignment: Alignment.topRight,
                                            child: IconButton(
                                              onPressed: (() {
                                                Navigator.pop(context);
                                              }),
                                              icon: const Icon(
                                                  Icons.arrow_drop_down,
                                                  size: 30,
                                                  color: Colors.white),
                                            ),
                                          ),
                                          const Align(
                                            alignment: Alignment.topCenter,
                                            child: Text(
                                              '''  অর্ধবার্ষিকী                  ৳ ৫৯৯''',
                                              style: TextStyle(
                                                fontSize: 24.0,
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromARGB(
                                                    255, 255, 255, 255),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 30,
                                          ),
                                          const Text(
                                              'প্রমো কোড (শুধুমাত্র বিকাশ পেমেন্ট এর জন্য প্রযোজ্য)'),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: const Color.fromARGB(
                                                  255, 209, 183, 192),
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            child: const TextField(
                                              decoration: InputDecoration(
                                                hintText: 'প্রমো কোডটি দিন...',
                                                suffixIcon: IconButton(
                                                  onPressed: null,
                                                  icon: Icon(
                                                      Icons.arrow_forward_ios),
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 30,
                                          ),
                                          const Text(
                                              'পেমেন্ট মাধ্যম বাছাই করুন'),
                                          const SizedBox(
                                            height: 30,
                                          ),
                                          SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Material(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  clipBehavior: Clip
                                                      .antiAliasWithSaveLayer,
                                                  child: InkWell(
                                                    onTap: () {},
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                        border: Border.all(
                                                          color: Colors.red,
                                                          width: 3,
                                                        ),
                                                      ),
                                                      child: Ink.image(
                                                        image: const AssetImage(
                                                            'assets/images/bkash.jpg'),
                                                        height: 150,
                                                        width: 150,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Material(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  clipBehavior: Clip
                                                      .antiAliasWithSaveLayer,
                                                  child: InkWell(
                                                    onTap: () {},
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                        border: Border.all(
                                                          color: Colors.red,
                                                          width: 3,
                                                        ),
                                                      ),
                                                      child: Ink.image(
                                                        image: const AssetImage(
                                                            'assets/images/shurjopay.jpg'),
                                                        height: 150,
                                                        width: 150,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Material(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  clipBehavior: Clip
                                                      .antiAliasWithSaveLayer,
                                                  child: InkWell(
                                                    onTap: () {},
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                        border: Border.all(
                                                          color: Colors.red,
                                                          width: 3,
                                                        ),
                                                      ),
                                                      child: Ink.image(
                                                        image: const AssetImage(
                                                            'assets/images/googlepay.jpg'),
                                                        height: 150,
                                                        width: 150,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 30,
                                          ),
                                        ],
                                      ),
                                    );
                                  });
                            },
                            child: const Text(
                              'অর্ধবার্ষিকী ৳ ২৪৯/৬ মাস (নবায়নযোগ্য)',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                    child: const Text(
                      '''
                           সাবস্ক্রিপশন এর সুবিধা
                           ✔ প্রিমিয়াম অডিওবুক
                           ✔ বিজ্ঞাপন বিহীন সেবা
                           ✔ ২০+ অনলাইন ডাউনলোড সুবিধা
                           ✔ সকল ক্যাটাগরিতে প্রবেশের সুযোগ''',
                      maxLines: 20,
                      style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text('এইরকম আরো প্রিমিয়াম ফিচার পেতে সাবস্ক্রাইব করুন')
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
