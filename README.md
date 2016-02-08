###Mario Giraldo R, [Mateo Restrepo Restrepo](https://github.com/hackeo1/)

####EAFIT University, 2014-1

##Computer Architecture Final Project 
####'Processing Parallel Of Strings'

One of the typical problems of the strings is to convert text to uppercase or lowercase. using the **tr** command, the process is made sequentially character by character. The Final Project for this course was to implement a program in assembler for Linux that do the following tasks:

  - Read the line command instruction. For example: **trmmx upper lower < texto.txt > newFile.txt**
  - Read the specified file and using that file becomes **MMX instructions** uppercase or lowercase according to the instruction given.
  - Save a new file, the output.
  - In case of errors, they should be displayed in the standard error output.

##Usage

```
Usage: practica {OPTION} [entry file] <name Output.txt>

Standard Options:

    default,       the command converts to uppercase the content of the
                   file "file.txt" and leave the answer in the file
                   "nuevoarchivo.txt".

  --lower case, l  This command converts lowercase entire contents of the
                   file "file.txt" and leave the answer in the file
                   "newFileOutput.txt".

```

**Text converted to lowercase.**

![](https://github.com/marbros/Computer-Architecture/blob/master/Screenshots/lowercase.jpg?raw=true)

**Text converted to uppercase.**

![](https://github.com/marbros/Computer-Architecture/blob/master/Screenshots/uppercase.jpg?raw=true)

