 # Report 3/14/2022


 Week 2

 3/12/2022

 3:05pm - 3:30pm

 Read the Computer arithmetic lesson. I feel I have a better understanding of how the format is of the data.

 3/13/2022

 3:50pm - 5:00pm

 I was able to do some more research on the formatting of the data in the fc weight files. I saw that since it is in 16bit 8.8 format, I separated the integer part first by performing a bit shift and then masked the number to get the fractional part. I then added the integer part with the (fractional part/256). I was able to get these values and put them in a header file.
