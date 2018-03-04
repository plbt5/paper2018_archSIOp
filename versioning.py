#! /usr/bin/env python
 
""" Git Versioning Script, programmed in python 3
Source: http://www.mass-communicating.com/code/2013/11/08/python-versions.html
Will transform stdin to expand some keywords with git version/author/date information.

Specify --clean to remove this information before commit.

Setup:

1. Copy versioning.py into your git repository

2. add a version.py file with this contents:

 __version__ = ""
 __author__ = ""
 __email__ = ""
 __date__ = ""
 
3. Run:

 git config filter.versioning.smudge "python versioning.py"
 git config filter.versioning.clean  "python versioning.py --clean"
 echo 'version.py filter=versioning' >> .gitattributes
 git add .gitattributes
 git commit -m "Changed .gitattributes"

Note that the path to versioning.py must be relative to the root of your repository.

4. You update the file version like this:

 rm version.py
 git checkout version.py
 cat version.py

Step 4 can be a post-checkout hook since one might forget updating the version file 
every time one changes something. The way to do this in git is to add hooks. I added two hooks 
to do this, a post-checkout hook and a post-commit hook. I used the same file 
(the files will be run in the root directory of the repository), containing:

 #!/bin/sh
 cat version.py | python versioning.py --clean | python versioning.py > version.py

Now, every time I commit or checkout, my version number will be updated automatically.

"""
 
import sys
import subprocess
import re
import logging
 
 
def main():
    clean = False
    if len(sys.argv) > 1:
        if sys.argv[1] == '--clean':
            clean = True
 
    # initialise empty here. Otherwise: forkbomb through the git calls.
    subst_list = {
        "version": "",
        "date": "",
        "author": "",
        "email": ""
    }
 
    for line in sys.stdin:
        if not clean:
            subst_list = {
                # '--dirty' could be added to the following, too, but is not supported everywhere
                "version": subprocess.check_output(['git', 'describe', '--tags', '--long', '--all']),  
                "date": subprocess.check_output(['git', 'log', '--pretty=format:"%ad"', '-1']),
                "author": subprocess.check_output(['git', 'log', '--pretty=format:"%an"', '-1']),
                "email": subprocess.check_output(['git', 'log', '--pretty=format:"%ae"', '-1'])
            }
            for k, v in subst_list.items():
                v = v.decode('ascii').rstrip()
                rexp = "__%s__\s*=[\s'\"]+" % k
                line = re.sub(rexp, "__%s__ = \"%s\"\n" % (k, v), line)
            sys.stdout.write(line)
        else:
            for k in subst_list:
                rexp = "__%s__\s*=.*" % k
                line = re.sub(rexp, "__%s__ = \"\"" % k, line)
            sys.stdout.write(line)
 
 
if __name__ == "__main__":
    main()
