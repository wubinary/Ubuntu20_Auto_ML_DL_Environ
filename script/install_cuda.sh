USER=$USER
PASS=$1

LCYAN='\033[1;36m' # Light Cyan Color
RED='\033[0;31m' # RED Color
NC='\033[0m' # No Color

show(){
	echo "\t${LCYAN}$1${NC}"
	sleep 1
}

wait_apt_lock(){
	while sudo fuser /var/{lib/{dpkg,apt/lists},cache/apt/archives}/lock >/dev/null 2>&1; do
		sleep 1
	done
}

###########################################
############  Install CUDA  ###############

show "######################################"
show "###########  Install CUDA  ###########"
show "https://www.tensorflow.org/install/gpu"
show " cuda-10-1, libcudnn7=7.6.4.38-1, libnvinfer6=6.0.1-1"
show ""

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/extras/CUPTI/lib64

# Install development and runtime libraries (~4GB)
show "[Info] Install cuda development and runtime libraries "
echo $PASS | sudo -S apt-get -y install --no-install-recommends \
    cuda-10-1 \
    libcudnn7=7.6.4.38-1+cuda10.1  \
    libcudnn7-dev=7.6.4.38-1+cuda10.1
wait 

# Install TensorRT. Requires that libcudnn7 is installed above.
show "[Info] Install TensorRT "
echo $PASS | sudo -S apt-get install -y --no-install-recommends libnvinfer6=6.0.1-1+cuda10.1 \
    libnvinfer-dev=6.0.1-1+cuda10.1 \
    libnvinfer-plugin6=6.0.1-1+cuda10.1
wait 


