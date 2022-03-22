#!/bin/bash

TF_CFLAGS=( $(python -c 'import tensorflow as tf; print(" ".join(tf.sysconfig.get_compile_flags()))') )
TF_LFLAGS=( $(python -c 'import tensorflow as tf; print(" ".join(tf.sysconfig.get_link_flags()))') )

# nvcc -std=c++11 -c -o sub_matmul.cu.cc.o sub_matmul.cu.cc ${TF_CFLAGS[@]} -D GOOGLE_CUDA=1 -x cu -Xcompiler -fPIC -DNDEBUG --expt-relaxed-constexpr -D_GLIBCXX_USE_CXX11_ABI=0 -D_MWAITXINTRIN_H_INCLUDED
# /usr/bin/g++-4.8 -std=c++11 -shared -o sub_matmul.so sub_matmul.cc sub_matmul.cu.cc.o  ${TF_CFLAGS[@]} -fPIC -lcuda ${TF_LFLAGS[@]} -O3 -march=native -D_GLIBCXX_USE_CXX11_ABI=0 -D GOOGLE_CUDA=1 -I/usr/local/cuda/targets/x86_64-linux/include -L/usr/local/cuda-10.0/targets/x86_64-linux/lib
g++ -std=c++11 -shared -o sub_matmul.so sub_matmul.cc ${TF_CFLAGS[@]} -fPIC ${TF_LFLAGS[@]} -O3 -march=native -D_GLIBCXX_USE_CXX11_ABI=0 

cp *.so ..
