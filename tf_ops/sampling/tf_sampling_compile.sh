TF_CFLAGS=( $(python -c 'import tensorflow as tf; print(" ".join(tf.sysconfig.get_compile_flags()))') )
TF_LFLAGS=( $(python -c 'import tensorflow as tf; print(" ".join(tf.sysconfig.get_link_flags()))') )

#/bin/bash
nvcc tf_sampling_g.cu -o tf_sampling_g.cu.o -c -O2 -DGOOGLE_CUDA=1 -x cu -Xcompiler -fPIC

g++ tf_sampling.cpp tf_sampling_g.cu.o -o tf_sampling_so.so -shared -fPIC ${TF_CFLAGS[@]} ${TF_LFLAGS[@]}  -I /usr/local/cuda/include -O2

