import 'package:connectify/library.dart';

//TODO: Redo with simpler logic
Set<String> dummydata = {
  'apple',
  'orange',
  'juice',
  'paper',
  'board',
  'python',
};

final searchTextProvider = StateProvider<String?>((ref) => null);
final existProvider = StateProvider<List<String>>((ref) => []);
final widgetsProvider = StateProvider<Map<String, Widget>>((ref) => {});

class SearchScreen extends ConsumerWidget {
  const SearchScreen({super.key});
  static final controller = TextEditingController();
  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      extendBody: true,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: SimpleConstants.horizontalSpace),
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
          ),
        ),
      ),
    );
  }
}
