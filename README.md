# Feature Matching and Visualization using SURF in MATLAB

This MATLAB script demonstrates how to perform feature detection, extraction, matching, and visualization using the SURF (Speeded-Up Robust Features) algorithm.

## Files

- **feature_matching_surf.m:**
  - This MATLAB script loads two sample images (`m111.jpg` and `m222.jpg`), converts them to grayscale, detects SURF features, extracts feature descriptors, matches the features between the two images, and visualizes the results.

## Requirements

- MATLAB with Image Processing Toolbox

## Setup and Execution

1. **Clone the repository or download the script:**
   - Clone this repository or download the `feature_matching_surf.m` script.

2. **Open MATLAB:**
   - Launch MATLAB and navigate to the directory containing `feature_matching_surf.m`.

3. **Run the Script:**
   - Run the script in MATLAB to see the feature detection, extraction, matching, and visualization steps.

## Process Overview

1. **Detect SURF Features:**
   - SURF features are detected in both images.

2. **Extract Features:**
   - Neighborhood features are extracted around the detected SURF points.

3. **Match Features:**
   - Features extracted from both images are matched.

4. **Visualize Matched Features:**
   - The matched features are visualized.

## Files Included

- `feature_matching_surf.m`: MATLAB script for feature matching using SURF.
- `m111.jpg`: Sample image 1.
- `m222.jpg`: Sample image 2.
