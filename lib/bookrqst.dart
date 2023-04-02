import 'package:flutter/material.dart';

class BookRequestPage extends StatelessWidget {
  const BookRequestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: const Color(0xff0C1B3E),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const Text('Book Request'),
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
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    child: Ink.image(
                      image: const AssetImage('assets/images/klogo.png'),
                      height: 110,
                      width: 140,
                      fit: BoxFit.cover,
                    ),
                  ),
                  InkWell(
                    child: Ink.image(
                      image: const AssetImage('assets/images/book.png'),
                      height: 90,
                      width: 140,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 50,
              ),

              // Ink.image(
              //   image: const AssetImage('assets/images/logo.png'),
              //   height: 180,
              //   width: 285,
              //   fit: BoxFit.cover,
              // ),
              // Ink.image(
              //   image: const AssetImage('assets/images/book.png'),
              //   height: 180,
              //   width: 285,
              //   fit: BoxFit.cover,
              // ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'আপনার নাম লিখুন',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                      width: 2.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Colors.blue,
                      width: 2.0,
                    ),
                  ),
                  prefixIcon: const Icon(Icons.person),
                  hintText: 'আপনার নাম',
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'বই এর নাম লিখুন',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                      width: 2.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Colors.blue,
                      width: 2.0,
                    ),
                  ),
                  prefixIcon: const Icon(Icons.book),
                  hintText: 'বই এর নাম',
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'বই এর লেখকের নাম লিখুন',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                      width: 2.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Colors.blue,
                      width: 2.0,
                    ),
                  ),
                  prefixIcon: const Icon(Icons.book_outlined),
                  hintText: 'লেখকের নাম',
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'বই এর ভাষার নাম লিখুন',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Colors.white,
                      width: 2.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Colors.blue,
                      width: 2.0,
                    ),
                  ),
                  prefixIcon: const Icon(Icons.language),
                  hintText: 'ভাষার নাম',
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'বই এর ধরণ / প্রকাশনী (যদি থাকে)',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Colors.white,
                      width: 2.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Colors.blue,
                      width: 2.0,
                    ),
                  ),
                  prefixIcon: const Icon(Icons.published_with_changes_rounded),
                  hintText: 'বই এর ধরণ / প্রকাশনী',
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              SizedBox(
                height: 60,
                width: 350,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      width: 3,
                    ),
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromARGB(255, 92, 0, 220),
                        Color.fromARGB(255, 0, 111, 201),
                      ],
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                    ),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(255, 72, 214, 136),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(2, 2),
                      ),
                      BoxShadow(
                        color: Color.fromARGB(255, 92, 0, 220),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(-2, -2),
                      ),
                    ],
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'অনুরোধ পাঠান',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
