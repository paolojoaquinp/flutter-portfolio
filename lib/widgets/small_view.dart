import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio_personal/utils.dart' as utils;

import '../colors.dart';


class SmallView extends StatelessWidget {
  SmallView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _mainSectionPresentationSmall(context),
        _aboutMeSectionSmall(context),
        _portfolioProjectsSmall(context),
        _publicSpeakingSmall(context),
        _footerSmall(context),
      ],
    );
  }

    Widget _portfolioProjectsSmall(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      child: Column(
        children: [
          const SizedBox(height: 30,),
          Text('My Latest Projects',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 34,color: kPortfolioWhite100,fontWeight: FontWeight.w800)
          ),
          const SizedBox(height: 80,),
          _projectItem(
            context,
            title: 'Daily Music',
            desc: 'Recomendations daily, not for your own size. No idk about your size.',
            imgSrc: 'https://media4.giphy.com/media/PvaQ55K7l9nRUou8Ju/giphy.gif',
            urlRepo: 'https://github.com/paolojoaquinp/flutter_food_delivery'
          ),
          _projectItem(
            context,
            title: 'Food Delivery',
            desc: 'An app for purchase your favorite food.',
            imgSrc: 'https://media0.giphy.com/media/v1.Y2lkPTc5MGI3NjExeDduYW5oNTYzc2h0Y3VvdHFnY2kyemU0Nmd0MGRoYTJvbWpwYXloaCZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/OLl7wJN0BtqJBUFECF/giphy.gif',
            urlRepo: 'https://github.com/paolojoaquinp/flutter_food_delivery'
          ),
          _projectItem(
            context,
            title: 'Hot Dog Detector',
            desc: 'An app for detect food, like Sillicon Valley\'s. tv show. Build on TensowFlow + Flutter',
            imgSrc: 'https://media4.giphy.com/media/v1.Y2lkPTc5MGI3NjExbHpjemU1OTh6MWxvMmQ2N3Ywb3J0ZGY1NzBzdXVmaWoyajdzcHRieSZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/NHCLirDYuOjZrIC1FV/giphy.gif',
            urlRepo: ''
          ),
        ]
      ),
    );
  }

  Widget _projectItem(BuildContext context,{required String title,required String desc,required String imgSrc,required String urlRepo}) {
    final size = MediaQuery.of(context).size;
    final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
      onPrimary: Colors.black87,
      primary: Colors.grey[300],
      minimumSize: Size(size.width * 0.15, 46),
      padding: EdgeInsets.symmetric(horizontal: 16),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
    final textTheme = Theme.of(context).textTheme.bodyLarge!;
    return Container(
      height: 700,
      width: size.width * 0.6,
      padding: const EdgeInsets.all(24),
      margin: const EdgeInsets.only(bottom: 40),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue, width: 1.0),
        borderRadius: const BorderRadius.all(Radius.circular(20))
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: size.width * 0.65,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: textTheme.copyWith(fontSize: 34,color: kPortfolioWhite100,fontWeight: FontWeight.w800)),
                const Divider(color: kPortfolioWhite100,),
                Text(desc, style: textTheme),
                const SizedBox(height: 20,),
                ElevatedButton(
                  style: raisedButtonStyle,
                  onPressed: () {
                    utils.openInWindow(urlRepo.toString(), 'new tab');
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const Text('Repositorio Github'),
                      SvgPicture.asset('assets/github-icon.svg')
                    ],
                  ),
                )
              ],
            ),
          ),
          Image.network(imgSrc, fit: BoxFit.contain,width:  150,height: 350,),
        ]
      ),
    );
  }

  final speakingResources = [
    {
      'title': 'GDSC UMSA: Codelabs Resposive Mobile First Design',
      'date': 'August 2022',
      'link': 'https://youtu.be/JMeVTFFwxow'
    },
    {
      'title': 'GDSC UMSA: Web Course',
      'date': 'August 2022',
      'link': 'https://youtu.be/n5KSYwqK9uw'
    },
    {
      'title': 'Firebase: Ignite Core Web Vitals (Google IO Extended La Paz 2023)',
      'date': 'June 2023',
      'link': ''
    },
    {
      'title': 'My First AI App with Flutter (Devfest GDG Sucre 2023)',
      'date': 'December 2023',
      'link': ''
    },
  ];

  Widget _publicSpeakingSmall(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textStyle = Theme.of(context).textTheme.bodyLarge!;
    return Container(
      width: size.width,
      child: Column(
        children: [
          const SizedBox(height: 70,),
          SizedBox(
            width: size.width * 0.7,
            child: Container(
              decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.white,width: 1.0))
              ),
              child:
                Text('Public Speaking',
                  textAlign: TextAlign.center,
                  style: textStyle.copyWith(fontSize: 30,color: kPortfolioWhite100,fontWeight: FontWeight.w800)
                ),
            ),
          ),
          const SizedBox(height: 30,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(speakingResources.length, (index) => 
              InkWell(
                onTap: speakingResources[index]['link'].toString().length > 0 
                  ? () => utils.openInWindow(speakingResources[index]['link'].toString(), 'new tab')
                  : (){},
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(text: '• ',
                          style: textStyle.copyWith(fontSize: 20,color: Colors.white)
                        ),
                        TextSpan(
                            text: speakingResources[index]['title'],
                            style: textStyle
                            .copyWith(fontSize: 20,color: speakingResources[index]['link'].toString().isEmpty ? Colors.white : Colors.blue)
                        ),
                        TextSpan(text: ' - ${speakingResources[index]['date']}',
                          style: textStyle.copyWith(fontSize: 20,color: Colors.white)
                        )
                      ])),
              ),
            ),
          ),
          const SizedBox(height: 70,),
        ]
      ),
    );
  }

  Widget _footerSmall(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _itemLinkFooter(imagePath: 'assets/medium-icon.svg', tooltip: 'medium', url: 'https://medium.com/@paolojoaquinp'),
          SizedBox(width: size.width * 0.02,),
          _itemLinkFooter(imagePath: 'assets/github-icon.svg', tooltip: 'Github', url: 'https://github.com/paolojoaquinp'),
          SizedBox(width: size.width * 0.02,),
          _itemLinkFooter(imagePath: 'assets/instagram-icon.svg', tooltip: 'Instagram', url: 'https://www.instagram.com/paolojoaquinp/'),
          SizedBox(width: size.width * 0.02,),
          _itemLinkFooter(imagePath: 'assets/inbox-mail-icon.svg', tooltip: 'Contact me mail',url: 'https://mail.google.com/mail/?view=cm&fs=1&to=paolojoaquinpintoperez@gmail.com&su=Requerimiento de Servicio como Flutter Developer'),
          SizedBox(width: size.width * 0.02,),
          _itemLinkFooter(imagePath: 'assets/linkedin-icon.svg', tooltip: 'Linkedin', url: 'https://www.linkedin.com/in/paolojoaquinp'),
          SizedBox(width: size.width * 0.02,),
          _itemLinkFooter(imagePath: 'assets/youtube-icon.svg', tooltip: 'Youtube',url: 'https://youtube.com/@paolojoaquinp'),
        ],
      ),
    );
  }

  Widget _aboutMeSectionSmall(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const String desc = "My name is Paolo Pinto, and I'm a Mobile Developer from La Paz, Bolivia. I've create in collaboration the projects like BurnoutCheck, ClosetSnaps and PushUpCounter, which are Android/IOS applications used by companies and students, respectively. Additionally, I've been fortunate to give talks, and workshops around the flutter community. \n I'm also proud to be part of GDG (Groups) La Paz in my country to inspire individuals and businesses to explore this exceptional framework.";
    return SizedBox(
      width: size.width,
      height: size.height * 0.9,
      child: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          width:400.0,
          height: size.height * 0.6,
          decoration: const BoxDecoration(
            color: kPortfolioBlack900,
            borderRadius: BorderRadius.all(Radius.circular(20))
          ),
          child: Column(
            children: [
              Text('About Me',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 34,color: kPortfolioWhite100,fontWeight: FontWeight.w800)
              ),
              const SizedBox(height: 25,),
              Text(desc,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: kPortfolioWhite100)
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _mainSectionPresentationSmall(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      color: Colors.amber,
      width: size.width,
      height: size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
              width:  size.width * 0.2,
              height: size.width * 0.2,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(size.width)),
                child: Image.asset('assets/profile-photo.jpeg',
                    fit: BoxFit.cover),
              )),
          Container(
            width: size.width * 0.8,
            height: size.height * 0.1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _itemLink(imagePath: 'assets/medium-icon.svg', tooltip: 'medium',url: 'https://medium.com/@paolojoaquinp'),
                _itemLink(imagePath: 'assets/github-icon.svg', tooltip: 'Github', url: 'https://github.com/paolojoaquinp'),
                _itemLink(imagePath: 'assets/instagram-icon.svg', tooltip: 'Instagram', url: 'https://www.instagram.com/paolojoaquinp/'),
                _itemLink(imagePath: 'assets/inbox-mail-icon.svg', tooltip: 'Contact me mail', url: 'https://mail.google.com/mail/?view=cm&fs=1&to=paolojoaquinpintoperez@gmail.com&su=Requerimiento de Servicio como Flutter Developer'),
                _itemLink(imagePath: 'assets/linkedin-icon.svg', tooltip: 'Linkedin', url: 'https://www.linkedin.com/in/paolojoaquinp'),
                _itemLink(imagePath: 'assets/youtube-icon.svg', tooltip: 'Youtube', url: 'https://youtube.com/@paolojoaquinp'),
              ],
            ),
          ),
          SizedBox(
            width: size.width * 0.9,
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    constraints.maxWidth < 650
                        ? RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(fontSize: 28, fontWeight: FontWeight.w900),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Hello, I\'m Paolo, ',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                          fontSize: 28,
                                          color: Colors.blue,
                                          fontWeight: FontWeight.w900),
                                ),
                                TextSpan(text: 'creative Mobile \nDeveloper.')
                              ],
                            ),
                          )
                        : RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(fontSize: 38, fontWeight: FontWeight.w900),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Hello, I\'m Paolo, ',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                          fontSize: 38,
                                          color: Colors.blue,
                                          fontWeight: FontWeight.w900),
                                ),
                                TextSpan(text: 'creative Mobile \nDeveloper.')
                              ],
                            ),
                          )
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _itemLink({required String imagePath,required String tooltip,required String url}) => InkWell(
      onTap: () => utils.openInWindow(url, 'new tab'),
      child: Tooltip(
        message: tooltip,
        child: SvgPicture.asset(
          imagePath,
          width: 40,
          height: 40,
          fit: BoxFit.cover,
          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),   
        ),
      ),
    );

  Widget _itemLinkFooter({required String imagePath,required String tooltip, required String url}) => InkWell(
      onTap: () => utils.openInWindow(url, 'new tab'),
      child: Tooltip(
        message: tooltip,
        child: SvgPicture.asset(
          imagePath,
          width: 25,
          height: 25,
          fit: BoxFit.cover,
          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),   
        ),
      ),
    );
}