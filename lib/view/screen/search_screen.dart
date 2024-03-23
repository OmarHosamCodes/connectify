import 'package:connectify/library.dart';

<<<<<<< HEAD
//TODO: Redo with simpler logic
Set<String> dummydata = {
=======
List<String> dummydata = [
>>>>>>> 715f9ad5af1fe335b73a0c5cb4d68c8ce7aff374
  'apple',
  'orange',
  'juice',
  'paper',
  'board',
  'python',
<<<<<<< HEAD
};
=======
];
>>>>>>> 715f9ad5af1fe335b73a0c5cb4d68c8ce7aff374

final searchTextProvider = StateProvider<String?>((ref) => null);
final existProvider = StateProvider<List<String>>((ref) => []);
final widgetsProvider = StateProvider<Map<String, Widget>>((ref) => {});

class SearchScreen extends ConsumerWidget {
<<<<<<< HEAD
  const SearchScreen({super.key});
  static final controller = TextEditingController();
  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      extendBody: true,
=======
  SearchScreen({super.key});
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      appBar: AppBar(
        title: SearchBar(
          controller: controller,
          onChanged: (value) {
            print(value);
            ref.read(searchTextProvider.notifier).update((state) => value);
            print('notifier value is : ${ref.read(searchTextProvider)}');
            print('notifier value is : ${ref.read(widgetsProvider)}');
            for (String element in dummydata) {
              if (element.contains(ref.read(searchTextProvider)!) &&
                  value != '') {
                print(element + 'added element');
                ref.read(existProvider.notifier).update((existState) {
                  if (existState.contains(element)) {
                    return existState;
                  } else {
                    existState.add(element);
                    ref.read(widgetsProvider.notifier).update((state) => {});
                    for (var element in existState) {
                      ref.read(widgetsProvider.notifier).update((state) {
                        state.addAll({
                          element: Container(
                            margin: const EdgeInsets.fromLTRB(
                                0,
                                SimpleConstants.vertiacalSpace,
                                0,
                                SimpleConstants.vertiacalSpace),
                            child: morphingGlasslistTile(
                                // height: context.height / 6,
                                // width: context.width,
                                roundedValue: SimpleConstants.radius,
                                opacity: 0.4,
                                borderColor: Colors.white.withOpacity(0.4),
                                text: CustomText(text: element),
                                subtitle: CustomText(text: element),
                                leading: const CircleAvatar(
                                  radius: SimpleConstants.radius * 1.25,
                                ),
                                gradientColors: [
                                  Colors.pink.withOpacity(0.4),
                                  Colors.white.withOpacity(0.1)
                                ]),
                          )
                        });
                        return state;
                      });
                    }
                  }
                  return existState;
                });
                print(ref.read(existProvider));
              } else {
                ref.read(existProvider.notifier).update((existState) {
                  if (existState.contains(element)) {
                    existState.remove(element);
                    ref.read(widgetsProvider.notifier).update((state) {
                      state.remove(element);
                      print('notifier value is : ${ref.read(widgetsProvider)}');

                      return state;
                    });
                  }
                  return existState;
                });
              }
            }
          },
        ),
      ),
>>>>>>> 715f9ad5af1fe335b73a0c5cb4d68c8ce7aff374
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: SimpleConstants.horizontalSpace),
<<<<<<< HEAD
          child: Column(
            children: [
              SizedBox(
                height: 50,
                child: Row(
                  children: [
                    Flexible(
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () => context.pop(),
                      ),
                    ),
                    Flexible(
                      flex: 5,
                      child: SearchBar(
                        controller: controller,
                        onChanged: (value) {
                          ref
                              .read(searchTextProvider.notifier)
                              .update((state) => value);

                          for (String element in dummydata) {
                            if (element
                                    .contains(ref.read(searchTextProvider)!) &&
                                value != '') {
                              ref.read(existProvider.notifier).update(
                                (existState) {
                                  if (existState.contains(element)) {
                                    return existState;
                                  } else {
                                    existState.add(element);
                                    ref
                                        .read(widgetsProvider.notifier)
                                        .update((state) => {});
                                    for (var element in existState) {
                                      ref.read(widgetsProvider.notifier).update(
                                        (state) {
                                          state.addAll(
                                            {
                                              element: Container(
                                                margin:
                                                    const EdgeInsets.fromLTRB(
                                                        0,
                                                        SimpleConstants
                                                            .vertiacalSpace,
                                                        0,
                                                        SimpleConstants
                                                            .vertiacalSpace),
                                                child:
                                                    CustomGlassMorphismContainer(
                                                  child: ListTile(
                                                    title: Text(element),
                                                    onTap: () {
                                                      controller.text = element;
                                                      ref
                                                          .read(
                                                              searchTextProvider
                                                                  .notifier)
                                                          .update((state) =>
                                                              controller.text);
                                                      ref
                                                          .read(existProvider
                                                              .notifier)
                                                          .update(
                                                              (existState) =>
                                                                  [element]);
                                                    },
                                                  ),
                                                ),
                                              )
                                            },
                                          );
                                          return state;
                                        },
                                      );
                                    }
                                  }
                                  return existState;
                                },
                              );
                            } else {
                              ref.read(existProvider.notifier).update(
                                (existState) {
                                  if (existState.contains(element)) {
                                    existState.remove(element);
                                    ref.read(widgetsProvider.notifier).update(
                                      (state) {
                                        state.remove(element);

                                        return state;
                                      },
                                    );
                                  }
                                  return existState;
                                },
                              );
                            }
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: List.from(ref.watch(widgetsProvider).values),
                ),
              ),
            ],
=======
          child: ListView(
            children: List.from(ref.watch(widgetsProvider).values),
>>>>>>> 715f9ad5af1fe335b73a0c5cb4d68c8ce7aff374
          ),
        ),
      ),
    );
  }
}
