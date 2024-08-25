import 'dart:async';

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:u_credit_card/u_credit_card.dart';

class ContainerCarousel extends StatefulWidget {
  const ContainerCarousel({super.key});

  @override
  ContainerCarouselState createState() => ContainerCarouselState();
}

class ContainerCarouselState extends State<ContainerCarousel> {
  final PageController _pageController = PageController(viewportFraction: 0.85);
  late Timer _timer;
  final int _autoScrollInterval = 8; // Intervalo en segundos

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(Duration(seconds: _autoScrollInterval), (timer) {
      if (_pageController.hasClients) {
        final currentPage = _pageController.page?.toInt() ?? 0;
        final nextPage =
            (currentPage + 1) % 3; // Cambia 3 por el número de páginas
        _pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
          child: PageView(
            controller: _pageController,
            children: const [
              CreditCardUi(
                width: 300,
                cardHolderFullName: 'Jeremy Fernández',
                cardNumber: '1234567812345678',
                validFrom: '01/23',
                validThru: '01/28',
                topLeftColor: Color.fromARGB(255, 22, 122, 204),
                doesSupportNfc: true,
                placeNfcIconAtTheEnd: true,
                cardType: CardType.debit,
                cardProviderLogo: FlutterLogo(),
                cardProviderLogoPosition: CardProviderLogoPosition.right,
                balance: 128.32434343,
                autoHideBalance: true,
                enableFlipping: true,
                cvvNumber: '123',
              ),
              CreditCardUi(
                width: 300,
                cardHolderFullName: 'Jeremy Fernández',
                cardNumber: '1234567812345678',
                validFrom: '01/23',
                validThru: '01/28',
                topLeftColor: Colors.black,
                doesSupportNfc: true,
                placeNfcIconAtTheEnd: true,
                cardType: CardType.credit,
                cardProviderLogo: FlutterLogo(),
                cardProviderLogoPosition: CardProviderLogoPosition.right,
                balance: 128.32434343,
                autoHideBalance: true,
                enableFlipping: true,
                cvvNumber: '123',
              ),
              CreditCardUi(
                width: 300,
                cardHolderFullName: 'Jeremy Fernández',
                cardNumber: '1234567812345678',
                validFrom: '01/23',
                validThru: '01/28',
                topLeftColor: Colors.grey,
                doesSupportNfc: true,
                placeNfcIconAtTheEnd: true,
                cardType: CardType.giftCard,
                cardProviderLogo: FlutterLogo(),
                cardProviderLogoPosition: CardProviderLogoPosition.right,
                balance: 128.32434343,
                autoHideBalance: true,
                enableFlipping: true,
                cvvNumber: '123',
              ),
            ],
          ),
        ),
        SmoothPageIndicator(
          controller: _pageController,
          count: 3, // Número de páginas
          effect: const ExpandingDotsEffect(
            activeDotColor: Color.fromARGB(255, 6, 25, 80),
            dotColor: Colors.grey,
            dotHeight: 6,
            dotWidth: 6,
            spacing: 4,
            expansionFactor: 6,
          ),
        ),
      ],
    );
  }
}
