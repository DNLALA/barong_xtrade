import 'package:flutter/material.dart';

class CustomBtn extends StatelessWidget {
  final String? buttonText;
  final Color? buttonColor;
  final VoidCallback? onPressed;
  final Color? textColor;

  const CustomBtn(
      {Key? key,
      this.buttonText,
      this.buttonColor,
      this.onPressed,
      this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          height: 70,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: buttonColor,
              border: Border.all(width: 1, color: Colors.white),
              borderRadius: BorderRadius.circular(45)),
          child: Center(
              child: Text(
            buttonText!,
            style: TextStyle(color: textColor, fontSize: 25),
          )),
        ),
      ),
    );
  }
}

class CustoMBtn extends StatelessWidget {
  final String? buttonText;
  final Color? buttonColor;
  final VoidCallback? onPressed;
  final Color? textColor;

  const CustoMBtn({
    Key? key,
    this.buttonText,
    this.buttonColor,
    this.onPressed,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          height: 37,
          width: 110,
          decoration: BoxDecoration(
              color: buttonColor,
              border: Border.all(width: 1, color: Colors.white),
              borderRadius: BorderRadius.circular(10)),
          child: Center(
              child: Text(
            buttonText!,
            style: TextStyle(color: textColor, fontSize: 15),
          )),
        ),
      ),
    );
  }
}

class CustoSBtn extends StatelessWidget {
  final String? buttonText;
  final Color? buttonColor;
  final VoidCallback? onPressed;
  final Color? textColor;

  const CustoSBtn({
    Key? key,
    this.buttonText,
    this.buttonColor,
    this.onPressed,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          height: 50,
          width: 200,
          decoration: BoxDecoration(
              color: buttonColor,
              border: Border.all(width: 1, color: Colors.white),
              borderRadius: BorderRadius.circular(10)),
          child: Center(
              child: Text(
            buttonText!,
            style: TextStyle(color: textColor, fontSize: 15),
          )),
        ),
      ),
    );
  }
}

class CustoSBd extends StatelessWidget {
  final String? buttonText;
  final Color? buttonColor;
  final VoidCallback? onPressed;
  final Color? textColor;

  const CustoSBd({
    Key? key,
    this.buttonText,
    this.buttonColor,
    this.onPressed,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          image: const DecorationImage(
            image: AssetImage('pics/IMG_2279.JPG'),
            fit: BoxFit.cover,
          )),
    );
  }
}

// class CustomBtnT extends StatelessWidget {
//   final String? buttonText;
//   final Color? buttonColor;
//   final VoidCallback? onPressed;
//   final Color? textColor;

//   const CustomBtnT(
//       {Key? key,
//       this.buttonText,
//       this.buttonColor,
//       this.onPressed,
//       this.textColor})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: InkWell(
//         onTap: () {
//           Navigator.push(context,
//               MaterialPageRoute(builder: (context) => const PayMent()));
//         },
//         child: Container(
//           height: 70,
//           width: MediaQuery.of(context).size.width,
//           decoration: BoxDecoration(
//               color: buttonColor,
//               border: Border.all(width: 1, color: Colors.white),
//               borderRadius: BorderRadius.circular(35)),
//           child: Center(
//               child: Text(
//             buttonText!,
//             style: TextStyle(color: textColor, fontSize: 25),
//           )),
//         ),
//       ),
//     );
//   }
// }

class CustomBtnT1 extends StatelessWidget {
  final String? buttonText;
  final Color? buttonColor;
  final VoidCallback? onPressed;
  final Color? textColor;

  const CustomBtnT1(
      {Key? key,
      this.buttonText,
      this.buttonColor,
      this.onPressed,
      this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          height: 70,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: buttonColor,
              border: Border.all(width: 1, color: Colors.white),
              borderRadius: BorderRadius.circular(35)),
          child: Center(
              child: Text(
            buttonText!,
            style: TextStyle(color: textColor, fontSize: 25),
          )),
        ),
      ),
    );
  }
}

// class CustomBtnTA extends StatelessWidget {
//   final String? buttonText;
//   final Color? buttonColor;
//   final VoidCallback? onPressed;
//   final Color? textColor;

//   const CustomBtnTA(
//       {Key? key,
//       this.buttonText,
//       this.buttonColor,
//       this.onPressed,
//       this.textColor})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: InkWell(
//         onTap: () {
//           Navigator.push(context,
//               MaterialPageRoute(builder: (context) => const SigUpPage()));
//         },
//         child: Container(
//           height: 10,
//           width: 10,
//           decoration: BoxDecoration(
//               color: buttonColor,
//               border: Border.all(width: 1, color: Colors.white),
//               borderRadius: BorderRadius.circular(35)),
//           child: Center(
//               child: Text(
//             'OK',
//             style: TextStyle(color: textColor, fontSize: 25),
//           )),
//         ),
//       ),
//     );
//   }
// }
