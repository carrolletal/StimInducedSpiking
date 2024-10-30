import ffmpeg
# need to install Pillow / pip install Pillow
from PIL import Image
import os
import sys
import ffmpeg

n_frames = 150000     #Change to fit frames of each series of images
tiff_dir = '/Users/mouseuser/Desktop/100224/'
png_dir = '/Users/mouseuser/Desktop/100224-png/'
if not os.path.exists(png_dir):
    os.mkdir(png_dir) #make new png folder EACH TIME.
    print (f"Folder '{png_dir}' created.")
else:
    print(f"Folder '{png_dir}' already exists.")
    
                                                #HEAVY CODE STARTS HERE
                                                #TIFF TO PNG
for filename in os.listdir(tiff_dir):
    if filename.endswith('.tif') or filename.endswith('.tiff'):
        # Open the multi-TIFF file
        im = Image.open(os.path.join(tiff_dir, filename))

        # Save each frame of the multi-TIFF as a separate PNG file
        for i in range(im.n_frames):
            im.seek(i)
            # Set the filename of the PNG file
            png_filename = os.path.splitext(filename)[0] + f'_frame{i}.png'
            # Save the current frame as a PNG file
            im.save(os.path.join(png_dir, png_filename))

#fnames = sorted(os.listdir(dir_name))
                                                #PNG TO AVI VIDEO
#inpts = ffmpeg.input(dir_name, pattern_type='glob', framerate=10)
inpts = ffmpeg.input('/Users/mouseuser/Desktop/100224-png/*.png', pattern_type='glob', framerate=10)
output = inpts.output('100224-vid.avi', vcodec='ffv1', pix_fmt='yuv420p')
output.run()

