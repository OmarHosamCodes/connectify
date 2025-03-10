import 'package:connectify/library.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen(
      {super.key,
      required this.emailController,
      required this.passwordController,
      required this.nameController});
  static final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController nameController;

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const CustomText(text: 'Register'),
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: RegisterScreen.formKey,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomTextField(
                  controller: widget.nameController,
                  textInputAction: TextInputAction.next,
                  hintText: 'Enter your name',
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Name is required';
                    }

                    return null;
                  },
                ),
                const CustomGap(),
                CustomTextField(
                  controller: widget.emailController,
                  textInputAction: TextInputAction.next,
                  hintText: 'Enter your email',
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Email is required';
                    }

                    return null;
                  },
                ),
                const CustomGap(),
                CustomTextField(
                  controller: widget.passwordController,
                  textInputAction: TextInputAction.done,
                  hintText: 'Enter your password',
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Password is required';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),
                const CustomGap(),
                Consumer(
                  builder: (_, WidgetRef ref, __) {
                    final userType = ref.watch(userTypeProvider);
                    return DropdownButtonFormField(
                      value: userType,
                      onChanged: (UserType? value) {
                        ref.read(userTypeProvider.notifier).state = value!;
                      },
                      items: const [
                        DropdownMenuItem(
                          value: UserType.volunteer,
                          child: CustomText(text: 'Volunteer'),
                        ),
                        DropdownMenuItem(
                          value: UserType.recruiter,
                          child: CustomText(text: 'Recruiter'),
                        ),
                        DropdownMenuItem(
                          value: UserType.csrOrFunder,
                          child: CustomText(text: 'CSR or Funder'),
                        ),
                      ],
                    );
                  },
                ),
                const CustomGap(),
                Consumer(
                  builder: (_, WidgetRef ref, __) {
                    final userType = ref.watch(userTypeProvider);
                    return SizedBox(
                      width: double.infinity,
                      child: CustomButton.raised(
                        onPressed: () {
                          if (RegisterScreen.formKey.currentState!.validate()) {
                            final UserModel user = UserModel(
                              name: widget.nameController.text,
                              id: UniqueKey().toString(),
                              email: widget.emailController.text,
                              password: widget.passwordController.text,
                              userType: userType,
                              imageUrl: '',
                              phoneAuthCredential: null,
                              createdAt: Timestamp.now(),
                            );
                            AuthController.instants.signUpWithEmailAndPassword(
                              user: user,
                              password: widget.passwordController.text,
                            );
                          }
                        },
                        child: const CustomText(text: 'Register'),
                      ),
                    );
                  },
                ),
                const CustomGap(),
                CustomButton.flat(
                  onPressed: () {
                    AuthScreen.changePage(0);
                  },
                  child: const CustomText(text: 'Login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
