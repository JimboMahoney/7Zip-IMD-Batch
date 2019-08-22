@ECHO OFF



REM set the path of 7z
SET ZIPPER=C:\Program Files\7-Zip\7z.exe

REM Check the 7z is correctly installed
If Not Exist "%ZIPPER%" (
Echo Error: Zipper is not found as "%ZIPPER%"!
Goto END
)

REM Tune the zipping options (BROTLI Requires additional codecs)
REM 7z options have been tested and selected for optimal speed
SET ZIPOPTIONS=-mm=BROTLI -mx=2 -mmt24
REM -mm=BROTLI - use the BROTLI codec. If not using additional codecs, use LZMA2, which is slightly slower (~10%), but slightly better compression (~4%).
REM -mx=2 - compression quality (higher = better compression, but slower). Use -mx=0 if using LZMA2.
REM -mmt24 - use 24 threads; set as the number of virtual cores on your machine

REM Root folder to backup goes here:
SET WORKDIR=

REM Check if workdir exists
IF NOT EXIST "%WORKDIR%" (
Echo Error: working directory does not exist; check "%WORKDIR%"!
Goto END
)

REM change to working directory
CD /D "%WORKDIR%"

REM Loop across files recursively
REM Zip all IMD files in the WORKDIR directory (and subdirs)
REM but only if they haven't already been zipped
REM %%f = files
REM %%~pnf = path and filename (excluding extension)
FOR /R %%f in (*.imd) DO (
Echo Processing %%f
IF NOT EXIST "%%~pnf.7z" (
"%ZIPPER%" a %ZIPOPTIONS% "%%~pf%%~nf.7z" "%%f" 
)
)
Echo Compression finished.


:END
