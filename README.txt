
The sources underlying the script "TA.pdf" (available from OLAT -> STA406 ->
Materials) can be accessed as follows (works on any Linux box, maybe also on
MacOS, probably not on other systems):

 - install subversion client 

 - check out sources anonymously

   svn co http://scm.ebpi.uzh.ch/scm/svn/TA

 - install LaTeX 

 - install R 

 - install all R packages needed by TA/book/setup.R

 - run ``make all'' in TA/book/

 - this produces TA.pdf and chapter-wise R transcript files Ch*R

 - everything is produced from TA/book/Ch*in files, so these files 
   contain all relevant information

You can modify these sources locally if you want. I would love to hear about
typos, errors, unclear statements etc. The easiest way to inform me is to
add a comment to the source file (Ch*in) and send me the output of

	svn diff Ch<file>.in

on that specific file via email to <Torsten.Hothorn@uzh.ch>.


