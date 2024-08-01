TF_CFLAGS=( $(python -c 'import tensorflow as tf; print(" ".join(tf.sysconfig.get_compile_flags()))') )
TF_LFLAGS=( $(python -c 'import tensorflow as tf; print(" ".join(tf.sysconfig.get_link_flags()))') )

# TF1.2
#g++ -std=c++11 tf_interpolate.cpp -o tf_interpolate_so.so -shared -fPIC -I /usr/local/lib/python2.7/dist-packages/tensorflow/include -I /usr/local/cuda-8.0/include -lcudart -L /usr/local/cuda-8.0/lib64/ -O2 -D_GLIBCXX_USE_CXX11_ABI=0

# TF1.4
#echo "g++ tf_interpolate.cpp -o tf_interpolate_so.so -shared -fPIC -I $TF_INC -I $CUDA_INC -I ${TF_INC}/external/nsync/public -lcudart -L $CUDA_LIB -L ${TF_LIB} -ltensorflow_framework -O2 -D_GLIBCXX_USE_CXX11_ABI=1"
#g++ tf_interpolate.cpp -o tf_interpolate_so.so -shared -fPIC -I $TF_INC -I $CUDA_INC -I ${TF_INC}/external/nsync/public -lcudart -L $CUDA_LIB -L ${TF_LIB} -ltensorflow_framework -O2 -D_GLIBCXX_USE_CXX11_ABI=1


g++ tf_interpolate.cpp -o tf_interpolate_so.so -shared -fPIC ${TF_CFLAGS[@]} ${TF_LFLAGS[@]} -O2