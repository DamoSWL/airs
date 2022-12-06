# airs
course project for ML system
# airs
course project for ML system
### install packages
    conda create -n airs python=3.8
    conda activate airs

    conda install pytorch==1.10.0 torchvision==0.11.0 torchaudio==0.10.0 cudatoolkit=11.3 -c pytorch -c conda-forge
    pip install -r GeoSeg/requirements.txt

### dataset
dataset are prepared under ./data folder

### experiment

for potsdam training

    python GeoSeg/train_supervision.py -c GeoSeg/config/potsdam/unetformer.py #CNN

    python GeoSeg/train_supervision.py -c GeoSeg/config/potsdam/ftunetformer.py #transformer

for potsdam testing

    python GeoSeg/potsdam_test.py -c GeoSeg/config/potsdam/unetformer.py -o fig_results/potsdam/unetformer.py --rgb -t 'lr'  #CNN

    python GeoSeg/potsdam_test.py -c GeoSeg/config/potsdam/ftunetformer.py -o fig_results/potsdam/ftunetformer --rgb -t 'lr'  #transformer


for vaihingen training

    python GeoSeg/train_supervision.py -c GeoSeg/config/vaihingen/unetformer.py #CNN

    python GeoSeg/train_supervision.py -c GeoSeg/config/vaihingen/ftunetformer.py #transformer


for vaihingen testing

    python GeoSeg/vaihingen_test.py -c GeoSeg/config/vaihingen/unetformer.py -o fig_results/vaihingen/unetformer --rgb -t 'd4'

    python GeoSeg/vaihingen_test.py -c GeoSeg/config/vaihingen/ftunetformer.py -o fig_results/vaihingen/ftunetformer --rgb -t 'd4'
