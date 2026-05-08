import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/isolate_cubit.dart';
import '../cubit/isolate_state.dart';


class IsolatePage
    extends StatelessWidget {

  const IsolatePage({
    super.key,
  });


  @override
  Widget build(
    BuildContext context,
  ) {

    return BlocProvider(

      create: (_) =>
          IsolateCubit(),

      child: Scaffold(

        appBar: AppBar(

          title: const Text(
            'Isolate Test',
          ),
        ),


        body: BlocBuilder<
            IsolateCubit,
            IsolateState>(

          builder: (
            context,
            state,
          ) {

            return Center(

              child: Column(

                mainAxisAlignment:
                    MainAxisAlignment.center,

                children: [

                  ElevatedButton(

                    onPressed: () {

                      context
                          .read<
                              IsolateCubit>()
                          .testIsolate();
                    },

                    child: const Text(
                      'Run Isolate',
                    ),
                  ),


                  const SizedBox(
                    height: 24,
                  ),


                  if (state
                      is IsolateLoading)

                    const CircularProgressIndicator(),


                  if (state
                      is IsolateLoaded)

                    Text(
                      state.result,
                    ),


                  if (state
                      is IsolateError)

                    Text(
                      state.message,
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}