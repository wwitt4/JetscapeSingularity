#!/bin/bash

#source nics/c/home/wwitt4/.bashrc
# above you may need to source environmental variables or add include statements
#below is what directory on ACF  your output files will go
export outdir=/lustre/haven/user/wwitt4/jewel_output/5020.0-5/$PBS_JOBID
mkdir $outdir

#cd $PBS_O_WORKDIR

echo $PBS_TASKNUM
JOBID=`echo $PBS_JOBID | cut -d . -f 1`
#To have completely unique seeds, need to multiply by a number which is greater than the number of jobs.  Protecting in case multiple jobs start at once.
NEWTASKNUM=$((PBS_TASKNUM * 1000))
JOB_NUMBER=$((NEWTASKNUM + $JOBID))

echo $JOB_NUMBER
pwd
mkdir $outdir/$JOB_NUMBER

#below is where your code will go, replace mycode.C with all the files you need to run your code, if you only need 1, erase line 22, if you need more than 2 add a similar line !!! ALSO INCLUDE HEADERS (.h files) and .CXX
cp /nics/c/home/wwitt4/JEWEL/jewel-2.2.0/jewel-2.2.0-simple $outdir/$JOB_NUMBER/
cp /nics/c/home/wwitt4/JEWEL/jewel-2.2.0/params.5020.0-5.dat $outdir/$JOB_NUMBER/
cp /nics/c/home/wwitt4/JEWEL/jewel-2.2.0/medium.5020.0-5.dat $outdir/$JOB_NUMBER/

echo 'NJOB '$JOB_NUMBER >> $outdir/$JOB_NUMBER/params.5020.0-5.dat
#echo 'MEDIUMPARAMS medium'$JOB_NUMBER'.dat' >> $outdir/$JOB_NUMBER/params.dat

cd $outdir/$JOB_NUMBER
#below is where you run your code, e.g. rivet ... ... (replace mycode.C with your executable)
./jewel-2.2.0-simple params.5020.0-5.dat
#root -b -l -q  "mycode.C"
#rm -r $outdir/$JOB_NUMBER
