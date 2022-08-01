# Burden_colocalisation_analysis_3D

This script is designed to analyse the percent of image volume occupied by staining in a binary image.

## Scripts
-	The two needed scripts should be saved into the same folder (i.e **Scripts**).
-	Does not need to be the folder where the images are located.
-	Scripts required:
    - **Burden_analysis_3D.m**
    -	**read_stackTiff.m**

## Inputs
-	The input folder should contain segmented images (black and white).
-	Be sure that the name of the channel is not included in the case name (image_name).

## Run the script
-	Run **Burden_analysis_3D.m** in Matlab.
-	It will ask the folder where the images are located.
-	In the menu that appears write the name of the channel that you want to test

## Output
-	It creates a new folder into the input folder called **Results_burden** that contains an Excel file named: **burdenchannelnamechosen_percent_volume.csv**.
-	It contains:
      -	Percent of the image occupied by the "burden channel".


