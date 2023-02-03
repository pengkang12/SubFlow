#!/bin/bash
#!/bin/bash

TF_CFLAGS=( $(python -c 'import tensorflow as tf; print(" ".join(tf.sysconfig.get_compile_flags()))') )
TF_LFLAGS=( $(python -c 'import tensorflow as tf; print(" ".join(tf.sysconfig.get_link_flags()))') )

/usr/bin/g++ -std=c++11 -shared -o sub_matmul.so sub_matmul.cc ${TF_CFLAGS[@]} -fPIC ${TF_LFLAGS[@]} -O3 -march=native -D_GLIBCXX_USE_CXX11_ABI=0 

cp *.so ..
