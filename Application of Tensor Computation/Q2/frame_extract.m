videoFile = 'Q2/video.mp4'; % Specify the name of your video file
outputFolder = 'videoframes'; % Specify the folder where you want to save the frames

% Create the output folder if it doesn't exist
if ~exist(outputFolder, 'dir')
    mkdir(outputFolder);
end

% Read the video file
videoObj = VideoReader(videoFile);

% Get information about the video
numFrames = videoObj.NumberOfFrames;
frameRate = videoObj.FrameRate;

% Loop through each frame and save it as an image
for k = 1 : numFrames
    % Read the frame
    frame = read(videoObj, k);
    
    % Generate the filename for the frame
    frameName = sprintf('frame_%d.png', k);
    
    % Save the frame as an image in the output folder
    imwrite(frame, fullfile(outputFolder, frameName));
end

disp('Frames extracted successfully.');