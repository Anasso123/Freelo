import 'package:flutter/material.dart';
import 'package:freelo_ecommerce/home/presentation/widgets/drawer/list_tile_menu.dart';
import 'package:hive/hive.dart';

class AllListTiles extends StatefulWidget {
  final double height;
  final double width;

  const AllListTiles({
    super.key,
    required this.height,
    required this.width,
  });

  @override
  State<AllListTiles> createState() => _AllListTilesState();
}

class _AllListTilesState extends State<AllListTiles> {
  bool acceuil = false;
  bool agendaPersonnel = false;
  bool agenda = false;
  bool agendaVision = false;
  bool operateur = false;
  bool participants = false;
  bool filactualite = false;
  bool documents = false;
  bool galerie = false;
  bool informationPratique = false;
  bool partenaires = false;
  bool aPropo = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTileMenu(
          onTap: () async {
            agendaPersonnel = false;
            acceuil = true;
            agenda = false;
            agendaVision = false;
            partenaires = false;
            participants = false;
            filactualite = false;
            documents = false;
            galerie = false;
            informationPratique = false;
            operateur = false;
            aPropo = false;
            var userBox = Hive.box('user');
            await userBox.put('selected', 'Acceuil');
            setState(() {});
          },
          width: widget.width,
          height: widget.height,
          icon: Icons.view_agenda,
          title: 'Acceuil',
          iconColor: Hive.box('user').get('selected') == 'Acceuil'
              ? Colors.deepOrange
              : acceuil == true
                  ? Colors.deepOrange
                  : Colors.white,
          textColor: Hive.box('user').get('selected') == 'Acceuil'
              ? Colors.deepOrange
              : acceuil == true
                  ? Colors.deepOrange
                  : Colors.white,
          arrowIconColor: Hive.box('user').get('selected') == 'Acceuil'
              ? Colors.deepOrange
              : acceuil == true
                  ? Colors.deepOrange
                  : Colors.white,
          indicatorColor: Hive.box('user').get('selected') == 'Acceuil'
              ? Colors.deepOrange
              : acceuil == true
                  ? Colors.deepOrange
                  : Colors.blue.shade200,
        ),
        SizedBox(
          height: widget.height * 0.001,
        ),
        ListTileMenu(
          onTap: () async {
            agendaPersonnel = true;
            acceuil = false;
            agenda = false;
            agendaVision = false;
            partenaires = false;
            participants = false;
            filactualite = false;
            documents = false;
            galerie = false;
            informationPratique = false;
            operateur = false;
            aPropo = false;
            var userBox = Hive.box('user');
            await userBox.put('selected', 'AgendaPersonnel');
            setState(() {});
          },
          width: widget.width,
          height: widget.height,
          icon: Icons.calendar_month,
          title: 'Agenda Personnel',
          iconColor: Hive.box('user').get('selected') == 'AgendaPersonnel'
              ? Colors.deepOrange
              : agendaPersonnel == true
                  ? Colors.deepOrange
                  : Colors.white,
          textColor: Hive.box('user').get('selected') == 'AgendaPersonnel'
              ? Colors.deepOrange
              : agendaPersonnel == true
                  ? Colors.deepOrange
                  : Colors.white,
          arrowIconColor: Hive.box('user').get('selected') == 'AgendaPersonnel'
              ? Colors.deepOrange
              : agendaPersonnel == true
                  ? Colors.deepOrange
                  : Colors.white,
          indicatorColor: Hive.box('user').get('selected') == 'AgendaPersonnel'
              ? Colors.deepOrange
              : agendaPersonnel == true
                  ? Colors.deepOrange
                  : Colors.blue.shade200,
        ),
        SizedBox(
          height: widget.height * 0.001,
        ),
        ListTileMenu(
          onTap: () async {
            agendaPersonnel = false;
            acceuil = false;
            agenda = true;
            agendaVision = false;
            partenaires = false;
            participants = false;
            filactualite = false;
            documents = false;
            galerie = false;
            informationPratique = false;
            operateur = false;
            aPropo = false;
            var userBox = Hive.box('user');
            await userBox.put('selected', 'Agenda');
            setState(() {});
          },
          width: widget.width,
          height: widget.height,
          icon: Icons.calendar_today_outlined,
          title: 'Agenda',
          iconColor: Hive.box('user').get('selected') == 'Agenda'
              ? Colors.deepOrange
              : agenda == true
                  ? Colors.deepOrange
                  : Colors.white,
          textColor: Hive.box('user').get('selected') == 'Agenda'
              ? Colors.deepOrange
              : agenda == true
                  ? Colors.deepOrange
                  : Colors.white,
          arrowIconColor: Hive.box('user').get('selected') == 'Agenda'
              ? Colors.deepOrange
              : agenda == true
                  ? Colors.deepOrange
                  : Colors.white,
          indicatorColor: Hive.box('user').get('selected') == 'Agenda'
              ? Colors.deepOrange
              : agenda == true
                  ? Colors.deepOrange
                  : Colors.blue.shade200,
        ),
        SizedBox(
          height: widget.height * 0.001,
        ),
        ListTileMenu(
          onTap: () async {
            agendaPersonnel = false;
            acceuil = false;
            agenda = false;
            agendaVision = true;
            partenaires = false;
            participants = false;
            filactualite = false;
            documents = false;
            galerie = false;
            informationPratique = false;
            operateur = false;
            aPropo = false;
            var userBox = Hive.box('user');
            await userBox.put('selected', 'AgendaVisionGroupe');
            setState(() {});
          },
          width: widget.width,
          height: widget.height,
          icon: Icons.calendar_today_sharp,
          title: 'Agenda Vision Groupe',
          iconColor: Hive.box('user').get('selected') == 'AgendaVisionGroupe'
              ? Colors.deepOrange
              : agendaVision == true
                  ? Colors.deepOrange
                  : Colors.white,
          textColor: Hive.box('user').get('selected') == 'AgendaVisionGroupe'
              ? Colors.deepOrange
              : agendaVision == true
                  ? Colors.deepOrange
                  : Colors.white,
          arrowIconColor:
              Hive.box('user').get('selected') == 'AgendaVisionGroupe'
                  ? Colors.deepOrange
                  : agendaVision == true
                      ? Colors.deepOrange
                      : Colors.white,
          indicatorColor:
              Hive.box('user').get('selected') == 'AgendaVisionGroupe'
                  ? Colors.deepOrange
                  : agendaVision == true
                      ? Colors.deepOrange
                      : Colors.blue.shade200,
        ),
        SizedBox(
          height: widget.height * 0.001,
        ),
        ListTileMenu(
          onTap: () async {
            agendaPersonnel = false;
            acceuil = false;
            agenda = false;
            agendaVision = false;
            partenaires = false;
            participants = false;
            filactualite = false;
            documents = false;
            galerie = false;
            informationPratique = false;
            operateur = true;
            aPropo = false;
            var userBox = Hive.box('user');
            await userBox.put('selected', 'operateur');
            setState(() {});
          },
          width: widget.width,
          height: widget.height,
          icon: Icons.keyboard_voice_sharp,
          title: 'Operateur',
          iconColor: Hive.box('user').get('selected') == 'operateur'
              ? Colors.deepOrange
              : operateur == true
                  ? Colors.deepOrange
                  : Colors.white,
          textColor: Hive.box('user').get('selected') == 'operateur'
              ? Colors.deepOrange
              : operateur == true
                  ? Colors.deepOrange
                  : Colors.white,
          arrowIconColor: Hive.box('user').get('selected') == 'operateur'
              ? Colors.deepOrange
              : operateur == true
                  ? Colors.deepOrange
                  : Colors.white,
          indicatorColor: Hive.box('user').get('selected') == 'operateur'
              ? Colors.deepOrange
              : operateur == true
                  ? Colors.deepOrange
                  : Colors.blue.shade200,
        ),
        SizedBox(
          height: widget.height * 0.001,
        ),
        ListTileMenu(
          onTap: () async {
            agendaPersonnel = false;
            acceuil = false;
            agenda = false;
            agendaVision = false;
            partenaires = false;
            participants = true;
            filactualite = false;
            documents = false;
            galerie = false;
            informationPratique = false;
            operateur = false;
            aPropo = false;
            var userBox = Hive.box('user');
            await userBox.put('selected', 'participants');
            setState(() {});
          },
          width: widget.width,
          height: widget.height,
          icon: Icons.perm_contact_calendar_sharp,
          title: 'Participants',
          iconColor: Hive.box('user').get('selected') == 'participants'
              ? Colors.deepOrange
              : participants == true
                  ? Colors.deepOrange
                  : Colors.white,
          textColor: Hive.box('user').get('selected') == 'participants'
              ? Colors.deepOrange
              : participants == true
                  ? Colors.deepOrange
                  : Colors.white,
          arrowIconColor: Hive.box('user').get('selected') == 'participants'
              ? Colors.deepOrange
              : participants == true
                  ? Colors.deepOrange
                  : Colors.white,
          indicatorColor: Hive.box('user').get('selected') == 'participants'
              ? Colors.deepOrange
              : participants == true
                  ? Colors.deepOrange
                  : Colors.blue.shade200,
        ),
        SizedBox(
          height: widget.height * 0.001,
        ),
        ListTileMenu(
          onTap: () async {
            agendaPersonnel = false;
            acceuil = false;
            agenda = false;
            agendaVision = false;
            partenaires = false;
            participants = false;
            filactualite = true;
            documents = false;
            galerie = false;
            informationPratique = false;
            operateur = false;
            aPropo = false;
            var userBox = Hive.box('user');
            await userBox.put('selected', 'filactualité');
            setState(() {});
          },
          width: widget.width,
          height: widget.height,
          icon: Icons.compass_calibration,
          title: 'Fil d\'actualités',
          iconColor: Hive.box('user').get('selected') == 'filactualité'
              ? Colors.deepOrange
              : filactualite == true
                  ? Colors.deepOrange
                  : Colors.white,
          textColor: Hive.box('user').get('selected') == 'filactualité'
              ? Colors.deepOrange
              : filactualite == true
                  ? Colors.deepOrange
                  : Colors.white,
          arrowIconColor: Hive.box('user').get('selected') == 'filactualité'
              ? Colors.deepOrange
              : filactualite == true
                  ? Colors.deepOrange
                  : Colors.white,
          indicatorColor: Hive.box('user').get('selected') == 'filactualité'
              ? Colors.deepOrange
              : filactualite == true
                  ? Colors.deepOrange
                  : Colors.blue.shade200,
        ),
        SizedBox(
          height: widget.height * 0.001,
        ),
        ListTileMenu(
          onTap: () async {
            agendaPersonnel = false;
            acceuil = false;
            agenda = false;
            agendaVision = false;
            partenaires = false;
            participants = false;
            filactualite = false;
            documents = true;
            galerie = false;
            informationPratique = false;
            operateur = false;
            aPropo = false;
            var userBox = Hive.box('user');
            await userBox.put('selected', 'documents');
            setState(() {});
          },
          width: widget.width,
          height: widget.height,
          icon: Icons.file_copy_sharp,
          title: 'Documents',
          iconColor: Hive.box('user').get('selected') == 'documents'
              ? Colors.deepOrange
              : documents == true
                  ? Colors.deepOrange
                  : Colors.white,
          textColor: Hive.box('user').get('selected') == 'documents'
              ? Colors.deepOrange
              : documents == true
                  ? Colors.deepOrange
                  : Colors.white,
          arrowIconColor: Hive.box('user').get('selected') == 'documents'
              ? Colors.deepOrange
              : documents == true
                  ? Colors.deepOrange
                  : Colors.white,
          indicatorColor: Hive.box('user').get('selected') == 'documents'
              ? Colors.deepOrange
              : documents == true
                  ? Colors.deepOrange
                  : Colors.blue.shade200,
        ),
        SizedBox(
          height: widget.height * 0.001,
        ),
        ListTileMenu(
          onTap: () async {
            agendaPersonnel = false;
            acceuil = false;
            agenda = false;
            agendaVision = false;
            partenaires = false;
            participants = false;
            filactualite = false;
            documents = false;
            galerie = true;
            informationPratique = false;
            operateur = false;
            aPropo = false;
            var userBox = Hive.box('user');
            await userBox.put('selected', 'galerie');
            setState(() {});
          },
          width: widget.width,
          height: widget.height,
          icon: Icons.info,
          title: 'Galerie',
          iconColor: Hive.box('user').get('selected') == 'galerie'
              ? Colors.deepOrange
              : galerie == true
                  ? Colors.deepOrange
                  : Colors.white,
          textColor: Hive.box('user').get('selected') == 'galerie'
              ? Colors.deepOrange
              : galerie == true
                  ? Colors.deepOrange
                  : Colors.white,
          arrowIconColor: Hive.box('user').get('selected') == 'galerie'
              ? Colors.deepOrange
              : galerie == true
                  ? Colors.deepOrange
                  : Colors.white,
          indicatorColor: Hive.box('user').get('selected') == 'galerie'
              ? Colors.deepOrange
              : galerie == true
                  ? Colors.deepOrange
                  : Colors.blue.shade200,
        ),
        SizedBox(
          height: widget.height * 0.001,
        ),
        ListTileMenu(
          onTap: () async {
            agendaPersonnel = false;
            acceuil = false;
            agenda = false;
            agendaVision = false;
            partenaires = false;
            participants = false;
            filactualite = false;
            documents = false;
            galerie = false;
            informationPratique = true;
            operateur = false;
            aPropo = false;
            var userBox = Hive.box('user');
            await userBox.put('selected', 'informationPratiques');
            setState(() {});
          },
          width: widget.width,
          height: widget.height,
          icon: Icons.six_ft_apart,
          title: 'Informations pratiques',
          iconColor: Hive.box('user').get('selected') == 'informationPratiques'
              ? Colors.deepOrange
              : informationPratique == true
                  ? Colors.deepOrange
                  : Colors.white,
          textColor: Hive.box('user').get('selected') == 'informationPratiques'
              ? Colors.deepOrange
              : informationPratique == true
                  ? Colors.deepOrange
                  : Colors.white,
          arrowIconColor:
              Hive.box('user').get('selected') == 'informationPratiques'
                  ? Colors.deepOrange
                  : informationPratique == true
                      ? Colors.deepOrange
                      : Colors.white,
          indicatorColor:
              Hive.box('user').get('selected') == 'informationPratiques'
                  ? Colors.deepOrange
                  : informationPratique == true
                      ? Colors.deepOrange
                      : Colors.blue.shade200,
        ),
        SizedBox(
          height: widget.height * 0.001,
        ),
        ListTileMenu(
          onTap: () async {
            agendaPersonnel = false;
            acceuil = false;
            agenda = false;
            agendaVision = false;
            partenaires = true;
            participants = false;
            filactualite = false;
            documents = false;
            galerie = false;
            informationPratique = false;
            operateur = false;
            aPropo = false;
            var userBox = Hive.box('user');
            await userBox.put('selected', 'partenaires');
            setState(() {});
          },
          width: widget.width,
          height: widget.height,
          icon: Icons.app_blocking_outlined,
          title: 'Partenaires',
          iconColor: Hive.box('user').get('selected') == 'partenaires'
              ? Colors.deepOrange
              : partenaires == true
                  ? Colors.deepOrange
                  : Colors.white,
          textColor: Hive.box('user').get('selected') == 'partenaires'
              ? Colors.deepOrange
              : partenaires == true
                  ? Colors.deepOrange
                  : Colors.white,
          arrowIconColor: Hive.box('user').get('selected') == 'partenaires'
              ? Colors.deepOrange
              : partenaires == true
                  ? Colors.deepOrange
                  : Colors.white,
          indicatorColor: Hive.box('user').get('selected') == 'partenaires'
              ? Colors.deepOrange
              : partenaires == true
                  ? Colors.deepOrange
                  : Colors.blue.shade200,
        ),
        SizedBox(
          height: widget.height * 0.001,
        ),
        ListTileMenu(
          onTap: () async {
            agendaPersonnel = false;
            acceuil = false;
            agenda = false;
            agendaVision = false;
            partenaires = false;
            participants = false;
            filactualite = false;
            documents = false;
            galerie = false;
            informationPratique = false;
            operateur = false;
            aPropo = true;
            var userBox = Hive.box('user');
            await userBox.put('selected', 'apropo');
            setState(() {});
          },
          width: widget.width,
          height: widget.height,
          icon: Icons.phone_android,
          title: 'A propos APP',
          iconColor: Hive.box('user').get('selected') == 'apropo'
              ? Colors.deepOrange
              : aPropo == true
                  ? Colors.deepOrange
                  : Colors.white,
          textColor: Hive.box('user').get('selected') == 'apropo'
              ? Colors.deepOrange
              : aPropo == true
                  ? Colors.deepOrange
                  : Colors.white,
          arrowIconColor: Hive.box('user').get('selected') == 'apropo'
              ? Colors.deepOrange
              : aPropo == true
                  ? Colors.deepOrange
                  : Colors.white,
          indicatorColor: Hive.box('user').get('selected') == 'apropo'
              ? Colors.deepOrange
              : aPropo == true
                  ? Colors.deepOrange
                  : Colors.blue.shade200,
        ),
        SizedBox(
          height: widget.height * 0.02,
        ),
        InkWell(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.arrow_back_ios,
                color: Colors.deepOrange,
              ),
              Text(
                'Retour à la liste',
                style: TextStyle(color: Colors.deepOrange),
              ),
            ],
          ),
        ),
        SizedBox(
          height: widget.height * 0.02,
        ),
        InkWell(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.data_exploration_sharp,
                color: Colors.deepOrange,
              ),
              Text(
                'Se déconnecter',
                style: TextStyle(color: Colors.deepOrange),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
