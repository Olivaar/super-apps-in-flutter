{ pkgs, lib, config, inputs, ... }:

{

  env.FLUTTER_ROOT = pkgs.flutter;

  packages = [
    pkgs.git

    # Flutter
    pkgs.flutter

    # Java
    pkgs.jdk17

    # Ferramentas Android básicas
    pkgs.android-tools

    # Para iOS
    pkgs.cocoapods

    #melos
    pkgs.melos
  ];

  # 3. Scripts
  scripts.doctor.exec = "flutter doctor";
  scripts.run-android.exec = "flutter run -d android";
  scripts.run-ios.exec = "flutter run -d ios";
  scripts.setup-repo.exec = "melos bootstrap";

  enterShell = ''
    echo "⚡ Ambiente Flutter carregado com sucesso!"
    echo "Flutter version:"
    flutter --version

    # Garante que o Flutter saiba onde o Android SDK está (se definido localmente)
    # export ANDROID_HOME=$HOME/Android/Sdk
  '';

  languages.dart.enable = true;
}