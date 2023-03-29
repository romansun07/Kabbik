import 'package:flutter/material.dart';
class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
        return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: (() {
              Navigator.pop(context);
            }),
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
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
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 700),
                    height: 150,
                    width: 350,
                    decoration: BoxDecoration(
                      //color: _backgroundColor,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(width: 3, color: Colors.blue),
                    ),
                    child: TextButton(
                      onPressed: (() {
                        showModalBottomSheet(
                            context: context,
                            backgroundColor: Colors.blue,
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
                                        icon: const Icon(Icons.arrow_drop_down,
                                            size: 30, color: Colors.white),
                                      ),
                                    ),
                                    const Align(
                                      alignment: Alignment.topCenter,
                                      child: Text(
                                        '''  মাসিক প্যাকেজ                                               ৳ ৫০''',
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
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: const TextField(
                                        decoration: InputDecoration(
                                          hintText: 'প্রমো কোডটি দিন...',
                                          prefixIcon: Icon(Icons.arrow_forward),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    const Text('পেমেন্ট মাধ্যম বাছাই করুন'),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        OutlinedButton(
                                          onPressed: () {},
                                          style: OutlinedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            side: const BorderSide(
                                                color: Colors.red),
                                          ),
                                          child: Ink.image(
                                            fit: BoxFit.cover,
                                            image: const NetworkImage(
                                                'https://www.bssnews.net/assets/news_photos/2021/11/07/image-26832-1636289660.jpg'),
                                          ),
                                        ),
                                        OutlinedButton(
                                          onPressed: () {},
                                          style: OutlinedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            side: const BorderSide(
                                                color: Colors.red),
                                          ),
                                          child: Ink.image(
                                            fit: BoxFit.cover,
                                            image: const NetworkImage(
                                                'https://www.bssnews.net/assets/news_photos/2021/11/07/image-26832-1636289660.jpg'),
                                          ),
                                        ),
                                        OutlinedButton(
                                          onPressed: () {},
                                          style: OutlinedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            side: const BorderSide(
                                                color: Colors.red),
                                          ),
                                          child: Ink.image(
                                            fit: BoxFit.cover,
                                            image: const NetworkImage(
                                                'https://www.bssnews.net/assets/news_photos/2021/11/07/image-26832-1636289660.jpg'),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 100,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            });
                      }),
                      child: const Center(
                        child: Text(
                          'মাসিক প্যাকেজ টাকা ৫০ / ১ মাস (নবায়নযোগ্য)',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 150,
                        width: 150,
                        child: ElevatedButton(
                          onPressed: () {
                            showModalBottomSheet(
                                context: context,
                                backgroundColor: Colors.blue,
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
                                            '''  সাপ্তাহিক                                                         ৳ ৫০''',
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
                                              prefixIcon:
                                                  Icon(Icons.arrow_forward),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 30,
                                        ),
                                        const Text('পেমেন্ট মাধ্যম বাছাই করুন'),
                                        const SizedBox(
                                          height: 30,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            OutlinedButton(
                                              onPressed: () {},
                                              style: OutlinedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                side: const BorderSide(
                                                    color: Colors.red),
                                              ),
                                              child: Ink.image(
                                                fit: BoxFit.cover,
                                                image: const NetworkImage(
                                                    'https://www.bssnews.net/assets/news_photos/2021/11/07/image-26832-1636289660.jpg'),
                                              ),
                                            ),
                                            OutlinedButton(
                                              onPressed: () {},
                                              style: OutlinedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                side: const BorderSide(
                                                    color: Colors.red),
                                              ),
                                              child: Ink.image(
                                                fit: BoxFit.cover,
                                                image: const NetworkImage(
                                                    'https://www.bssnews.net/assets/news_photos/2021/11/07/image-26832-1636289660.jpg'),
                                              ),
                                            ),
                                            OutlinedButton(
                                              onPressed: () {},
                                              style: OutlinedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                side: const BorderSide(
                                                    color: Colors.red),
                                              ),
                                              child: Ink.image(
                                                fit: BoxFit.cover,
                                                image: const NetworkImage(
                                                    'https://www.bssnews.net/assets/news_photos/2021/11/07/image-26832-1636289660.jpg'),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 100,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                });
                          },
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                side: const BorderSide(
                                    width: 3, color: Colors.green),
                              ),
                            ),
                          ),
                          child: const Text('''
                              সাপ্তাহিক
                              টাকা ২০/৭ দিন
                              (নবায়নযোগ্য )
                              '''),
                        ),
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      SizedBox(
                        height: 150,
                        width: 150,
                        child: ElevatedButton(
                          onPressed: () {
                            showModalBottomSheet(
                                context: context,
                                backgroundColor: Colors.blue,
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
                                            '''  অর্ধবার্ষিকী                                                     ৳ ৫০''',
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
                                              prefixIcon:
                                                  Icon(Icons.arrow_forward),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 30,
                                        ),
                                        const Text('পেমেন্ট মাধ্যম বাছাই করুন'),
                                        const SizedBox(
                                          height: 30,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            OutlinedButton(
                                              onPressed: () {},
                                              style: OutlinedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                side: const BorderSide(
                                                    color: Colors.red),
                                              ),
                                              child: Ink.image(
                                                fit: BoxFit.cover,
                                                image: const NetworkImage(
                                                    'https://www.bssnews.net/assets/news_photos/2021/11/07/image-26832-1636289660.jpg'),
                                              ),
                                            ),
                                            OutlinedButton(
                                              onPressed: () {},
                                              style: OutlinedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                side: const BorderSide(
                                                    color: Colors.red),
                                              ),
                                              child: Ink.image(
                                                fit: BoxFit.cover,
                                                image: const NetworkImage(
                                                    'https://www.bssnews.net/assets/news_photos/2021/11/07/image-26832-1636289660.jpg'),
                                              ),
                                            ),
                                            OutlinedButton(
                                              onPressed: () {},
                                              style: OutlinedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                side: const BorderSide(
                                                    color: Colors.red),
                                              ),
                                              child: Ink.image(
                                                fit: BoxFit.cover,
                                                image: const NetworkImage(
                                                    'https://www.bssnews.net/assets/news_photos/2021/11/07/image-26832-1636289660.jpg'),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 100,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                });
                          },
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                side: const BorderSide(
                                    width: 3, color: Colors.green),
                              ),
                            ),
                          ),
                          child: const Text(
                            '''
                           অর্ধবার্ষিকী
                           টাকা২৪৯/৬ মাস
                           (নবায়নযোগ্য)''',
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
