switch (uname)
    case Darwin
        set -gx JAVA_HOME (/usr/libexec/java_home -v11)

    case Linux
        set -gx JAVE_HOME "/usr/lib/jvm/adoptopenjdk-14-hotspot-amd64"
end

# **** Android SDK ****
set -gx ANDROID_HOME "$HOME/Library/Android/sdk"
set -gx ANDROID_SDK_ROOT "$HOME/Library/Android/sdk"
set -gx ANDROID_AVD_HOME "$HOME/.android/avd"

set -gx PATH "$ANDROID_HOME/emulator" $PATH
set -gx PATH "$ANDROID_HOME/tools" $PATH
set -gx PATH "$ANDROID_HOME/tools/bin" $PATH
set -gx PATH "$ANDROID_HOME/platform-tools" $PATH

set -gx PATH "$JAVA_HOME/bin" $PATH

