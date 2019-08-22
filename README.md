# 7Zip-IMD-Batch

Created to help backup data from a CyTOF system (Windows)

I needed a method to quickly compress the IMD files on a Fluidigm CyTOF (Helios) system so they could be more effectively backed up.

IMD files are VERY large (typically 10s of GBs) but compress well (e.g. 90%).

Speed is dependent on the CPU, HDD and 7zip algorithm, but with the default settings and a Fluidigm PC supplied late 2018 (Dual Intel Xeon E5-2643 v4 3.4 GHz, with 6 cores and 12 threads each), a 55 GB IMD file is compressed to <1GB in about 40 seconds.

### <b>Description</b>

This script will:

1) Look in a specified directory, and all subdirectories, for IMD files.
2) Check if they have previously been zipped.
3) If not, each IMD file will be individually zipped into a 7z file with the same name as the IMD file.

This script will NOT:

1) Delete the IMD files after compression (i.e. it only creates zipped copies of the IMD files. It's not intended to "clean up" the drive or save space. 
2) Backup the 7z files (you will have your own method for this).



### <b>Requirements</b>

https://www.7-zip.org/

https://github.com/mcmilk/7-Zip-zstd/releases (Optional - download the Codecs.7z if you want to use the slightly faster BROTLI algo)




### <b>Usage</b>

Add the root directory you wish to backup at this location in the file:
```
SET WORKDIR=
```

e.g.

```
SET WORKDIR=E:\User_Data\
```

Optionally set the command line options for 7Zip. Currently, they are set as follows and therefore require the additional codecs:

```
SET ZIPOPTIONS=-mm=BROTLI -mx=2 -mmt24
```

<b>Thanks to Samuel Granjeaud for some help improving the script!</b>
