setBatchMode(true);

//MAKE SURE THIS IS CORRECT!!
num_z = 13;
path = "/Users/heesoo/Desktop/Sarah/MB005B/D6/F3/";
//path = getDirectory("Choose a Directory");

path2 = path + "orig/";

filename = getFileList(path2);
newDir = path + "All_Parts" + File.separator;
if (File.exists(newDir)) exit("Destination directory already exists; remove it and then run this macro again");
File.makeDirectory(newDir); 


for (i=0; i<filename.length; i++) { 
	if(endsWith(filename[i], ".tiff")) { 
		num_files = num_files+1;
		open(path2+filename[i]);
		run('Stack to Images');

		for (j=0; j<num_z; j++) {
			saveAs("tiff", newDir + getTitle);
			close();
		}
		//close();
	}
}