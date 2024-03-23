import 'package:connectify/library.dart';

class CustomPopups extends StatelessWidget {
  const CustomPopups.dialog({
    super.key,
    this.title,
    this.content,
    this.dialogType = DialogType.info,
  })  : message = null,
        snackBarType = null,
        popupType = PopupType.dialog;

  const CustomPopups.loadingDialog({
    super.key,
  })  : title = null,
        content = null,
        message = null,
        dialogType = null,
        snackBarType = null,
        popupType = PopupType.loadingDialog;

  const CustomPopups.loadingIndicator({
    super.key,
  })  : title = null,
        content = null,
        message = null,
        dialogType = null,
        snackBarType = null,
        popupType = PopupType.loadingIndicator;

  const CustomPopups.snackBar({
    super.key,
    this.message,
    this.snackBarType = SnackBarType.info,
  })  : title = null,
        content = null,
        dialogType = null,
        popupType = PopupType.snackBar;

// Dialog

  final String? title;
  final String? content;
  final DialogType? dialogType;

// SnackBar

  final String? message;
  final SnackBarType? snackBarType;

// Popup
  final PopupType? popupType;

  @override
  Widget build(BuildContext context) {
    return switch (popupType!) {
      PopupType.dialog => _buildDialog(),
      PopupType.snackBar => _buildSnackBar(),
      PopupType.loadingDialog => _buildLoadingDialog(),
      PopupType.loadingIndicator => _buildLoadingIndicator(),
    };
  }

  Widget _buildDialog() {
    return AlertDialog(
      backgroundColor: switch (dialogType!) {
        DialogType.success => Colors.green,
        DialogType.error => Colors.red,
        DialogType.warning => Colors.orange,
        DialogType.info => Colors.blue,
        DialogType.question => Colors.blue,
      },
      title: CustomText(
        text: title!,
      ),
      content: CustomText(
        text: content!,
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            RoutingController.context.pop();
          },
          child: const CustomText(
            text: 'OK',
          ),
        ),
      ],
    );
  }

  Widget _buildSnackBar() {
    return SnackBar(
      content: CustomText(
        text: message!,
      ),
      backgroundColor: switch (snackBarType!) {
        SnackBarType.success => Colors.green,
        SnackBarType.error => Colors.red,
        SnackBarType.warning => Colors.orange,
        SnackBarType.info => Colors.blue,
      },
    );
  }

  Widget _buildLoadingDialog() {
    return const AlertDialog(
        content: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        CircularProgressIndicator(),
        SizedBox(height: 10),
        CustomText(
          text: 'Please wait...',
        ),
      ],
    ));
  }

  Widget _buildLoadingIndicator() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  static void show(
    CustomPopups customPopup,
  ) {
    switch (customPopup.popupType!) {
      case PopupType.dialog:
        showDialog<void>(
          context: RoutingController.context,
          builder: (BuildContext context) {
            return customPopup;
          },
        );
      case PopupType.loadingDialog:
        showDialog<void>(
          context: RoutingController.context,
          builder: (context) {
            return customPopup;
          },
        );
      case PopupType.snackBar:
        ScaffoldMessenger.of(RoutingController.context)
            .showSnackBar(customPopup as SnackBar);
      case PopupType.loadingIndicator:
        showDialog<void>(
          context: RoutingController.context,
          builder: (context) {
            return customPopup;
          },
        );
    }
  }
}

enum DialogType {
  success,
  error,
  warning,
  info,
  question,
}

enum SnackBarType {
  success,
  error,
  warning,
  info,
}

enum PopupType {
  dialog,
  loadingDialog,
  snackBar,
  loadingIndicator,
}
