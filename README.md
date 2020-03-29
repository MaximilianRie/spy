# spy
spy is a command line application that searches files or a directorys for regular expressions in python format.

## How to install spy
spy is a python script that can be run from the command line. You can install it by running:
```/bin/bash -c "$(curl -s https://raw.githubusercontent.com/StealthyNiffler/spy/master/installer.sh)"```
Which will install the executable in ```~/.local/bin``` and adds the directory to your PATH if it's not included already. Alternatively you can move the executable to a directory which is included in the PATH, so that the shell can easily find it. To show your PATH simply run: ```echo $PATH``` in the command line. It's not encouraged to move spy to a location where a lot of built in programs are like ```/bin```, ```/sbin```, ```/usr/bin``` or ```/usr/sbin``` are. Instead I recommend moving it either to ```~/.local/bin``` which might already be in your PATH or to a custom directory that you have manually added to your PATH. 

## How to use spy
Using spy is very simple. The easiest way is to search a file for a regular expression. The syntax for an operation like this is: ```spy "regex" path```. Set the "-i" flag if you want to disable case sensitivity.

### Example:
```bash
spy -i "rEg*eX+$" path/to/file.js
```

spy can also be used to scan directories. This is as easy as adding the "-r" flag to scan the whole directory recursively. Note that by default spy ignores all files that either start with a "." ("secret/hidden files") and files which contain an extension that isn't ```.txt .py .c .html .php .css```.  However you can easily activate the search for dotted files with the "-a" flag and add further extensions on the watch list with the "--ext" option.
### Example:
```bash
spy -ari "Har+y Po..e[rl]" path/to/dir --ext js hs
```

spy can also be used in unix pipelines if you want to scan the output of other programs.

### Example:
```bash
# this will only list dotted files
ls -la | spy " \..*$"
```

spy is able to delete and to substitute matches. To delete every match use the "-x" flag and to substitute matching sequences use -s in addition to a string that you want every match to substitute with. Note that spy only creates a view on your data. **This will _not_ change any files on your system**.

### Example:
```bash
# this command shows your every file and its permissions (everything else is getting deleted [note that this leads to unexpected behaviour when a filename begins with digits.])
ls -la | spy -x " [1-9].*[1-9]" 

# this example changes every occurence of Harry to Larry
spy -s "Larry" "Harry" infoAboutHarryPotter.txt
```

Another feature of spy is that you can use it like "cut" to manipulate tables. You can set a delimiter by specifying the -d flag. This will do nothing else but "inverting" your scan. In combination with the -f option you can select fields/columns that will be displayed seperated with enough whitespace. If you want to custumize how tables are displayed, you can set the -n option in combination with a custom seperator.

### Example:
```bash
# this will do the opposite as two examples above and with a fancy separator
ls -la | spy -d -f2,3-8 -n " | " "\s+"
```

If you want to pipe the output of spy to another programm it might disturb you that spy outputs some details like line numbers or filenames. I this this case you can set the -q flag which makes spy only output neccesarry data.
