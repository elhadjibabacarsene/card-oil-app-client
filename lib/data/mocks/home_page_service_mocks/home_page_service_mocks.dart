import '../../models/home_service_item_model/home_service_item_model.dart';

List<HomeServiceItemModel> homePageServiceMocks = [
  HomeServiceItemModel(
    title: 'Faire\nun achat',
    description: 'QR code ou NFC',
    image: 'assets/icons/send.png',
    link: '/qr_code_screen',
  ),
  HomeServiceItemModel(
    title: 'Recharger \nmon compte',
    description: 'Alimenter compte',
    image: 'assets/icons/received.png',
    link: '/qr_code_screen',
  ),/*
  HomeServiceItemModel(
    title: 'Voir\nma carte',
    description: 'Consulter points',
    image: 'assets/icons/history.png',
    link: '/loyalty_point_screen',
  ),*/
  HomeServiceItemModel(
    title: 'Mes transactions',
    description: 'Historique',
    image: 'assets/icons/fidelity.png',
    link: '/transaction_history_screen',
  ),
];
