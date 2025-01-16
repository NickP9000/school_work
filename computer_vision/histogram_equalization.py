# -*- coding: utf-8 -*-
"""histogram equalization.ipynb

Automatically generated by Colab.

Original file is located at
    https://colab.research.google.com/drive/1cFzL4dA6yasphGyGh-Ax1bMjziw84Neg
"""

#Nick Peters
#02/12/22

from PIL import Image
from PIL import ImageFilter
from PIL import ImageDraw
import matplotlib.pyplot as plt

from google.colab import drive
drive.mount('/content/drive')


img = Image.open('/content/drive/MyDrive/cs195_sp22/lab1_input_images/himalaya_dark.jpg')

#image histogram
hist = img.histogram()
print("image histogram:",hist)

#get hist_derivative from the image histogram
hist_derivative = [0] * 256
for i in range (256):
  hist_derivative[i] = hist[i]/(img.width * img.height)
  hist_derivative[i] = int(hist_derivative[i] * 255)

#get cumulitive sum of hist_derivative
histicum = [0] * 256
for i in range (256):
  histicum[i] = hist_derivative[i]
  if (i != 0): #prevent program from reaching out of bounds
    histicum[i] += histicum[i-1]

#create new image and apply histogram equalization
img_equalization = Image.new('L', (img.width, img.height), color=0)
for x in range (img.width):
  for y in range (img.height):
    img_equalization.putpixel((x,y), histicum[img.getpixel((x,y))])

e_hist = img_equalization.histogram()
print("equalized histogram:",e_hist)

#diplay original image
plt.figure(figsize=(8,8))
plt.imshow(img, cmap='gray')
plt.title('Original Photo')

#display equalized image
plt.figure(figsize=(8,8))
plt.imshow(img_equalization, cmap='gray')
plt.title('Equalized Photo')