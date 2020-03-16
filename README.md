# Spy
Spy is a command line application that searches files or a directorys for regular expressions in python format.

## How to install spy
Spy is a python script that can be run from the command line. It's best to move the file to a directory which is encluded in the PATH, so that the shell can easily find it. To show your PATH simply run: ```echo $PATH``` in the command line. It's not encouraged to move spy to a location where a lot of built in programs are like ```/bin```, ```/sbin```, ```/usr/bin``` or ```/usr/sbin``` are. Instead I recommend moving it either to ```/usr/.local/bin``` which might already be in your PATH or to a custom directory that you have manually added to your PATH. 

## How to use spy
Using spy is very simple. The easiest way is to search a file for a regular expression. The syntax for an operation like this is: ```spy "regex" path```. Note that by default spy ignores all files that either start with a "." ("secret/hidden files") and files which contain an extension that isn't ```.txt .py .c .html .php .css```. However you can easily activate the search for dotted files with the "-d" flag and add further extensions on the watch list with the "--ext" option. Set the "-i" flag if you want to ignore case sensitivity.

### Example:
```bash
spy -di "reg*ex+$" path/to/file.js --ext js
```

Spy can also be used to scan directories. This is as easy as adding the "-r" flag to scan the whole directory recursively.

### Example:
```bash
spy -dri "Har+y Po..e[rl]" path/to/dir --ext js hs
```

Spy can also be used in unix pipelines if you want to scan the output of other programs.

### Example:
```bash
# this will only list dotted files
ls -la | ./spy " \..*$"
```
