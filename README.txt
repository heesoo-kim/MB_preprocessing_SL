spinning disk calcium imaging README

separate_each_Z
	This function takes all time-based tif images and saves out a new tif for each time and z slice.
	Assumes that the ##.tif (from Slidebook) are in a folder called "orig"
	
	To execute:
		Choose the directory that has "orig" in it (or directly edit ijm file).
		Make sure to edit the number of z slices!!!
	
	Saves out in the "All_Parts" folder numbered as follows:
		TT_00SS.tif
		TT = time point (generally, 00-19)
		SS = z slice number (01 - n)

make_time_series
	This function makes "New_Stack" and "New_Stack_reg" directory. Goes through the "All_Parts" directory and makes tiff files for each z across time (saved in "New_Stack"). Uses rigid realign to make sure that each z slices is realigned to the first time point (saved in "New_Stack_reg"). 
	
	To execute:
		Select main directory first.
		Make sure that number of z slices is correct.
		Make sure time number is correct (though it probably is, set at 50)
		
max_project.ijm
	Goes through given folder (should be New_Stack_reg) and makes max projection across time for each z slice. Then takes max projection of that. [i used this to make the initial masks]
	To make masks, smooth [Process -> Smooth] and use Threshold [Image -> Adjust -> Threshold].