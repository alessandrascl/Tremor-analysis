# Tremor analysis
MATLAB script for analysis of tremor behavior in mice 

___
-- Please use Matlab 2015b or newer versions. The codes have been tested with Matlab 2015b.

-- The Matlab software can be purchased from MathWorks. Many universities and research institutes provide free copies for their students and employee. Typical install time on a "normal" desktop computer is ~15 minutes.

-- To run a demo, please place the four data files "156_P.txt, 157_P.txt, 158_P.txt, 159_P.txt" and the three program files "Tremor_index_calculation.m, importfile.m, num2abc.m" in the same folder, then open the file "Tremor_index_calculation.m" with Matlab.  Next, depending on where your folder "Sample data" is located, replace the folder path in line 2 of the program with your own folder path. Run the program. The generated excel file should be the same as the provided file "Results for sample data.xlsx". Expected run time for demo on a "normal" desktop computer is less than 10 seconds.

-- To run the software on your data, place all your data files in the same folder with the three program files. Change the folder path in line 2 of the program, run the program and the results will be summarized in the generated excel file. Please note that your original data file needs to be in the same format as the sample file. You also need to update the recording session length in line 13 of the program (20 minutes by default).

By Mu Zhou
Tsinghua University
2023.02.13
