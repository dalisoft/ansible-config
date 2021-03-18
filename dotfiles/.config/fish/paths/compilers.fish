# Compilers

# ********************************
# ********* openssl env **********
# ********************************

set -gx LDFLAGS "-L/usr/local/opt/openssl@1.1/lib"
set -gx CPPFLAGS "-I/usr/local/opt/openssl@1.1/include"
set -gx PKG_CONFIG_PATH "/usr/local/opt/openssl@1.1/lib/pkgconfig"

# ********************************
# ********* openblas env *********
# ********************************

set -gx LDFLAGS "-L/usr/local/opt/openblas/lib"
set -gx CPPFLAGS "-I/usr/local/opt/openblas/include"
set -gx PKG_CONFIG_PATH "/usr/local/opt/openblas/lib/pkgconfig"
