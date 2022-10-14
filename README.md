# real_time_video_processing_fpga

The aim of the project was to design the real-time video processing on an FPGA and efficiently process the pixel data and quickly show the output. Real-time image processing is difficult to achieve on a serial processor. This is due to several factors such as the large data set represented by the image, and the complex operations which may need to be performed on the image. At real-time video rates of 25 frames per second a single operation performed on every pixel of a 768 by 576 color image (NSTC frame) equates to 33 million operations per second. This does not take into account the overhead of storing and retrieving pixel values. Many image processing applications require that several operations be performed on each pixel in the image resulting in an even large number of operations per second.

Materials and Methods

a. Altera Cyclone® V SE 5CSEMA5F31C6N device (DE1_SoC board)
b. USB-Blaster II onboard for programming; JTAG Mode
c. NTSC Camera
d. Power battery 9V
e. RCA cable, VGA cable
