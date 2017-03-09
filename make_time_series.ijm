setBatchMode(true);
path = getDirectory("Choose a Directory");
//path = "/Users/heesoo/Desktop/Sarah/MB005B/D6/F3/";
path2 = path + "All_Parts" + File.separator;
newDir = path + "New_Stack" + File.separator;
newDir2 = path + "New_Stack_reg" + File.separator;
if (!File.exists(newDir)) {
	File.makeDirectory(newDir);
} 
if (!File.exists(newDir2)) {
	File.makeDirectory(newDir2);
} 

//Make sure this is correct
num_z = 13;
num_t = 50;

for (z=1; z<=num_z; z++) {
	if (z < 10) {
		Z_name = "000"+z+".tif";
	}
	else {
		Z_name = "00"+z+".tif";
	}

	for (i=0; i<num_t; i++) { 
		if (i < 10) {
			t_name = "0"+i+"-";
		}
		else {
			t_name = ""+i+"-";
		}
		
		open(path2+t_name+Z_name);
	}
	run("Images to Stack", "name="+Z_name+" title=[] use");

	saveAs("tiff", newDir + getTitle);
	
	run("StackReg", "transformation=[Rigid Body]");
	
	saveAs("tiff", newDir2 + getTitle);
	close();
}

