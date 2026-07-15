SET(CMAKE_SYSTEM_NAME Windows)


SET(CMAKE_C_COMPILER /usr/bin/x86_64-w64-mingw32-gcc)
SET(CMAKE_CXX_COMPILER /usr/bin/x86_64-w64-mingw32-g++)
SET(CMAKE_RC_COMPILER /usr/bin/x86_64-w64-mingw32-windres)

# This PREFIX_PATH will be specified by -DPREFIX_PATH when invoking cmake
SET(CMAKE_FIND_ROOT_PATH /usr/x86_64-w64-mingw32/ ${PREFIX_PATH})

# pkg-config isn't sysroot-aware on its own: without this, pkg_check_modules()
# falls back to its default search dirs and picks up the native Debian .pc
# files (e.g. /usr/lib/x86_64-linux-gnu/pkgconfig/fftw3f.pc), injecting
# -I/usr/include ahead of the mingw sysroot and breaking the cross-compile.
SET(ENV{PKG_CONFIG_LIBDIR} ${PREFIX_PATH}/lib/pkgconfig)
SET(ENV{PKG_CONFIG_PATH} "")
SET(ENV{PKG_CONFIG_SYSROOT_DIR} /usr/x86_64-w64-mingw32)

#export LD=/usr/bin/x86_64-w64-mingw32-gcc
