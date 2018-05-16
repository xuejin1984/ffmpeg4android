#!/bin/bash
 

export NDK=/home/jxue/Android/android-ndk-r17
export PREBUILT=$NDK/toolchains/arm-linux-androideabi-4.9/prebuilt
export PLATFORM=$NDK/platforms/android-27/arch-arm
export PREFIX=../simplefflib
build_one(){
  ./configure --target-os=linux --prefix=$PREFIX \
	--sysinclude=$NDK/sysroot/usr/include \
	--enable-cross-compile \
	--enable-runtime-cpudetect \
	--disable-asm \
	--arch=arm \
	--cc=$PREBUILT/linux-x86_64/bin/arm-linux-androideabi-gcc \
	--cross-prefix=$PREBUILT/linux-x86_64/bin/arm-linux-androideabi- \
	--disable-stripping \
	--nm=$PREBUILT/linux-x86_64/bin/arm-linux-androideabi-nm \
	--sysroot=$PLATFORM \
	--enable-gpl --enable-shared --disable-static --enable-small \
	--disable-ffprobe --disable-ffplay --disable-ffmpeg --disable-debug \
	--extra-cflags="-I$NDK/sysroot/usr/include/arm-linux-androideabi -I$NDK/sysroot/usr/include -fPIC -DANDROID -D__thumb__ -mthumb -Wfatal-errors -Wno-deprecated -mfloat-abi=softfp -marm -march=armv7-a"   
}

build_one

make -j8
make install

