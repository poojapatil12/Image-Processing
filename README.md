# Image-Processing
MATLAB program which aims at making old, degraded, poor quality document images, clear and easy to read.  This is done using what the paper says is, a novel adaptive binarization algorithm, which is  implemented using ternary entropy-based approach. Here the main motivation is binarization, which is a conversion of a multicolor image into a binary image, by thresholding techniques, that classify pixels to be either white or black. With the increase in the digitization of the images, the demand today is for accurate and less time consuming document analysis systems. 

The main problem in binarization is the fact that, it results in damaged document images, due to uneven illumination, bleeding-through, large black border, ink-fading, contrast variation, smear, various pattern background, and so on. In this paper, the method proposed is, a novel nonparametric local adaptive binarization method for poorly degraded document Image. Since binarization leads to the generation of an amount of redundant pixels, post-processing operations are used to eliminate noise, fill the breaks, gaps, holes and preserve strokeconnectivity.

To deal with salt and pepper, the filter applied, removes the region noise from the background i.e., around the text as well as fills the regions in the foreground. And to deal with block noise, a graph searching strategy is used, edge is detected if nodes are connected by black pixels.

Pre-processing:

Input: Grayscale Image
Output: Contrast Image

Post-processing:

Input: Binarized Image
Output: A set of trees. Each tree is considered to be a black noise.
