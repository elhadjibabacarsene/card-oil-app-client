import '../../models/home_service_item_model/home_service_item_model.dart';

List<HomeServiceItemModel> homePageServiceMocks = [
  HomeServiceItemModel(
    title: 'Payer \nle plein',
    description: 'QR code ou NFC',
    image: 'assets/icons/send.png',
    link: '/payment_services_screen',
  ),
  HomeServiceItemModel(
    title: 'Recharger \nson compte',
    description: 'Alimenter compte',
    image: 'assets/icons/received.png',
    link: '',
  ),
  HomeServiceItemModel(
    title: 'Mes points \nde fidélité',
    description: 'Consulter points',
    image: 'assets/icons/received.png',
    link: '',
  ),
  HomeServiceItemModel(
    title: 'Mes transactions',
    description: 'Historique',
    image: 'assets/icons/history.png',
    link: '',
  ),
];
