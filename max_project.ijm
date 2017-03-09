setBatchMode(true);

//path = "/Users/heesoo/Desktop/Sarah/MB005B/D6/F3/";
path = getDirectory("Choose a Directory");

path2 = path + "New_Stack_reg/";
num_files = 0;
filename = getFileList(path2);

for (i=0; i<filename.length; i++) { 
	if(endsWith(filename[i], ".tif") & startsWith(filename[i],"00")) { 
		num_files = num_files+1;
		open(path2+filename[i]);
		run("Z Project...", "start=1 stop=50 projection=[Max Intensity]");
		//close();
	}
}

run('Images to Stack');
saveAs("tiff", path2 + "Max_proj");

run("Z Project...", "start=1 stop="+num_files+" projection=[Max Intensity]");
saveAs("tiff", path2 + "Max_Max_proj");