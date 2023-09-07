import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelo_ecommerce/core/domain/constants/enums.dart';
import 'package:freelo_ecommerce/core/domain/dependency_injection/dependency_injection.dart';
import 'package:freelo_ecommerce/home/presentation/manager/home_bloc.dart';
import 'package:freelo_ecommerce/home/presentation/widgets/app_bar/custom_app_bar.dart';
import 'package:freelo_ecommerce/home/presentation/widgets/drawer/drawer_widget.dart';
import 'package:hive/hive.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) =>
          sl<HomeBloc>()..add(GetUserByUidEvent(Hive.box('user').get('user'))),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          print(state.connectionMessage);
          if(state.connectionMessage == 'Connected'){
            switch(state.requestState){
              case RequestState.loading:
                return const Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              case RequestState.loaded:
                return Scaffold(
                  appBar: const CustomAppBar(
                    appBarTitle: 'Accueil',
                  ),
                  drawer: DrawerWidget(
                    width: width * 0.8,
                    user: state.user[0],
                  ),
                );
              case RequestState.error:
                return Scaffold(
                  body: Center(
                    child: Text(state.message),
                  ),
                );
            }
          }else{
            return const Scaffold(
              body: Center(
                child: Text('error'),
              ),
            );
          }
        },
      ),
    );
  }
}
