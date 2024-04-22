import cv2
import os

# Path to the folder containing images
folder_path = 'C:/DS285FINAL/ds285final/Q2/curframes50/'

# Get the list of image files in the folder
image_files = sorted([f for f in os.listdir(folder_path) if f.endswith('.png')])
#print(image_files[10])


# Get the first image to retrieve dimensions
first_image = cv2.imread(os.path.join(folder_path, image_files[0]))
height, width, _ = first_image.shape

# Define the codec and create VideoWriter object
fourcc = cv2.VideoWriter_fourcc(*'mp4v')  # Define the codec
output_video = cv2.VideoWriter('tcur50.mp4', fourcc, 18, (width, height))  # 18 frames per second for 18 seconds

# Loop through each image file and add it to the video
for image_file in image_files:
    image_path = os.path.join(folder_path, image_file)
    frame = cv2.imread(image_path)
    output_video.write(frame)

# Release the VideoWriter object
output_video.release()

print("Video created successfully.")
