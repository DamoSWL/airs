#!/bin/bash


#SBATCH --job-name=seg
#SBATCH --ntasks-per-node=1
#SBATCH --mem=100GB
#SBATCH --partition=gpu
#SBATCH --gres=gpu:a100:1
#SBATCH --time=3-00:00:00
#SBATCH --account=ds7003-fall22 
#SBATCH --output=log_vai.txt
#SBATCH --exclude=udc-an28-1,udc-an28-7

nvidia-smi

module load cuda anaconda 

source activate
conda deactivate

conda activate /project/SDS/research/sds-rise/weili/.conda/envs/action




# python GeoSeg/train_supervision.py -c GeoSeg/config/potsdam/ftunetformer.py

# python GeoSeg/train_supervision.py -c GeoSeg/config/vaihingen/ftunetformer.py


# python GeoSeg/potsdam_test.py -c GeoSeg/config/potsdam/ftunetformer.py -o fig_results/potsdam/ftunetformer --rgb -t 'lr'

python GeoSeg/vaihingen_test.py -c GeoSeg/config/vaihingen/ftunetformer.py -o fig_results/vaihingen/ftunetformer --rgb -t 'd4'

# python GeoSeg/tools/potsdam_patch_split.py \
#         --img-dir data/potsdam/train_images \
#         --mask-dir data/potsdam/train_masks \
#         --output-img-dir data/potsdam/train/images_1024 \
#         --output-mask-dir data/potsdam/train/masks_1024 \
#         --mode train --split-size 1024 --stride 1024 --rgb-image 
      

# python GeoSeg/tools/potsdam_patch_split.py \
#         --img-dir data/potsdam/test_images \
#         --mask-dir data/potsdam/test_masks_eroded \
#         --output-img-dir data/potsdam/test/images_1024 \
#         --output-mask-dir data/potsdam/test/masks_1024 \
#         --mode val --split-size 1024 --stride 1024 \
#         --eroded --rgb-image

# python GeoSeg/tools/potsdam_patch_split.py \
#         --img-dir data/potsdam/test_images \
#         --mask-dir data/potsdam/test_masks \
#         --output-img-dir data/potsdam/test/images_1024 \
#         --output-mask-dir data/potsdam/test/masks_1024_rgb \
#         --mode val --split-size 1024 --stride 1024 \
#         --gt --rgb-image
                
# python GeoSeg/tools/vaihingen_patch_split.py \
#         --img-dir data/vaihingen/train_images \
#         --mask-dir data/vaihingen/train_masks \
#         --output-img-dir data/vaihingen/train/images_1024 \
#         --output-mask-dir data/vaihingen/train/masks_1024 \
#         --mode train --split-size 1024 --stride 512 


# python GeoSeg/tools/vaihingen_patch_split.py \
#         --img-dir data/vaihingen/test_images \
#         --mask-dir data/vaihingen/test_masks_eroded \
#         --output-img-dir data/vaihingen/test/images_1024 \
#         --output-mask-dir data/vaihingen/test/masks_1024 \
#         --mode val --split-size 1024 --stride 1024 \
#         --eroded

# python GeoSeg/tools/vaihingen_patch_split.py \
#         --img-dir data/vaihingen/test_images \
#         --mask-dir data/vaihingen/test_masks \
#         --output-img-dir data/vaihingen/test/images_1024 \
#         --output-mask-dir data/vaihingen/test/masks_1024_rgb \
#         --mode val --split-size 1024 --stride 1024 \
#         --gt


# python GeoSeg/tools/loveda_mask_convert.py --mask-dir data/LoveDA/Train/Rural/masks_png --output-mask-dir data/LoveDA/Train/Rural/masks_png_convert
# python GeoSeg/tools/loveda_mask_convert.py --mask-dir data/LoveDA/Train/Urban/masks_png --output-mask-dir data/LoveDA/Train/Urban/masks_png_convert
# python GeoSeg/tools/loveda_mask_convert.py --mask-dir data/LoveDA/Val/Rural/masks_png --output-mask-dir data/LoveDA/Val/Rural/masks_png_convert
# python GeoSeg/tools/loveda_mask_convert.py --mask-dir data/LoveDA/Val/Urban/masks_png --output-mask-dir data/LoveDA/Val/Urban/masks_png_convert