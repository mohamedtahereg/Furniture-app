import 'package:flutter/material.dart';
import 'package:practice1/models/cart.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'ourProducts/popularList.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffd3e2f4),
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 50, right: 50, top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      Icons.qr_code_scanner,
                      size: 35,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.shopping_cart_outlined,
                          size: 35,
                        ),
                        Consumer<Cart>(
                          builder: (context, cart, child) => Text(
                            "${cart.count}",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 50,
                  vertical: 15,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Offers",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "Whats New",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "Hot sale",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: SizedBox(
                  // width: MediaQuery.of(context).size.width * .9,
                  height: 170,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: ListView(
                      controller: _controller,
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset("assets/4267013.jpg"),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset("assets/4267013.jpg"),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset("assets/4267013.jpg"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: 50,
                child: SmoothPageIndicator(
                  effect: const SwapEffect(
                    activeDotColor: Colors.black87,
                    dotWidth: 14,
                    dotHeight: 10,
                    spacing: 4,
                  ),
                  controller: _controller,
                  count: 3,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                child: Text(
                  "Popular Product",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                  height: 340,
                  padding: const EdgeInsets.only(left: 20),
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      itemCount: lsit1.length,
                      itemBuilder: (context, index) {
                        // print(bIndex);
                        return lsit1[index];
                      }))
            ],
          ),
        ),
      ),
    );
  }
}
