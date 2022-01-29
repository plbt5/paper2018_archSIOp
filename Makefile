# Makefile for compiling Multimarkdown, and synching document sources to GitLab
# 	* GitLab used: git.ics.ele.tue.nl
#	* Sources: 
#		* Scrivener projects
#		* Related directory structure
#		* Images from Visio
#
# DIRECTIVES:
#	* <name>.scriv: Create a new scrivener project and folders structure, named <name>
#					- clone a project folder structure as subfolder <name> from $(RMTGIT) with default files (like this one)
#					- create a Scrivener project <name> 
#					- push the newly created git repository <name> to $(RMTGIT)/<name>, provided you already created this project at $(RMTGIT)
#	* git PROJECT=<name>:	Bring your scrivener project under git control
#							- cd to project root that contains the dir <yourProject>.scriv
#							PREREQUISITES:
#							(i) you have a scrivener project conforming to std folder structure, 
#							(ii) you have created a project <name> at $(RMTGIT) already
#	* clean:		remove all unnecessary files in this project
#	* commit:		Commit your staged index to the (local) Head
#
#------------------------------------------------------------------------------

#------------------------------------------------------------------------------
# SUGGESTIONS FOR DEVELOPMENT
#					- create a Papers Collection <name>
#					- open Scrivener to edit the default README.md
#	* git:			create a repository from this project at GitLab;
#	* pdf <name>:	compile a pdf from the default mmd in this project;
#	* branch:		branche the current project into its repository;
#	* release:		merge, compile, commit and branch
#	* clean:		remove all unnecessary files in this project
#	* bib:			create a bib file from Papers
#
#------------------------------------------------------------------------------

#------------------------------------------------------------------------------#
# Declare variables.                                                           #
#------------------------------------------------------------------------------#

# Leave PROJECT empty to signal command line error
PROJECT = 
RMTGIT	= git.ics.ele.tue.nl:pbrandt/
TMPLT	= template.scrivener-and-git-project.git 
LOCTMPLT	= file:///C:/Users/brandtp/AppData/Local/My Local Documents/My/Git/template.scrivener-and-git-project/

MMD		= pandoc
LATEX	= pdflatex

MMDS	= $(wildcard *.mmd)
PDFS	= $(MMDS:%.mmd=%.pdf)
REPO	:=$(shell git remote)
VERSION = $(shell git describe --all --tags --long --always)

MFLAGS  = -o README.md


.PHONY: all clean new commit git gitInit

#------------------------------------------------------------------------------#
# Make new from gitlab.														   #
#                                                                              #
#   'Make new PROJECT=projectname'                                             #
# 	Veel te ingewikkeld, want eenvoudiger om                                   #
#		1) handmatig een --bare kloon van t template te maken op github met    #
#			dezelfde naam als gewenste PROJECT.                                #
#		2) handmatig een shellmacro aan te roepen op de juiste plek die:       #
#			- lokaal een dir te maken;                                         #
#			- een lokale git clone maakt van --bare PROJECT;                   #
#			- de juiste Scrivener naamsveranderingen aanbrengt;                #
#			- alle lokaal commit, en terug pushed naar repository.             #
#------------------------------------------------------------------------------#

new:
	@echo === cloning $(RMTGIT)$(TMPLT) into $(CURDIR)/$(PROJECT)
ifndef PROJECT
	$(error new: No target PROJECT dir specified - use: 'make new PROJECT=yourChoice')
else
	git clone $(RMTGIT)$(PROJECT) 
	mv $(addprefix $(PROJECT)/,starter.scriv $(PROJECT).scriv)
	mv $(addprefix $(PROJECT)/$(PROJECT).scriv/,starter.scrivx $(PROJECT).scrivx)
	git add -A
	git commit -m "Created the Scrivener git repository as '$(PROJECT)'. First init, first commit"
	@echo === Git cloned locally! 
	git push
	@echo === Drag and drop the newly cloned folder from the Windows UI over, on to the GitHub for Windows client in order to inform the latter.
endif
	
#------------------------------------------------------------------------------#
# Make git from existing Scrivener project.										#
#																				#
#   'Make git PROJECT=projectname'                                             #
# 	Useful when you already have a Scrivener project and want to place it      #
#	under Git control.                                                         #
#	Prerequisites:                                                             #
#			- cd to project root that contains the dir <yourProject>.scriv     #
#			- create your project at the remote repository
#------------------------------------------------------------------------------#


gitInit: 
	$(info === putting $(CURDIR)/$(PROJECT) under git control)
# Initialize this new project in git, locally
	git init 
# Add all stuff from its working directory to the git index, i.e., stage the initial files, locally
	git add -A
# Commit the staged files to the HEAD, locally
	git commit -m "Created the Scrivener project '$(PROJECT)' as git repository. First init, first commit"
# Create the 'original' branch at the remote repository
	git remote add origin $(RMTGIT)$(PROJECT).git
# Push the local changes to the remote branch
# Check existence of project on server first, since a remote project cannot be created from local shell
	$(info === pushing local commit to remote repo ($(REPO)) at $(RMTGIT)$(PROJECT).git)
	git push -u origin master
# Create a new branch to work from, and subsequently push it to the remote repo
	git checkout -b draft
	git push origin draft
	git remote -v
	git status
	$(info === Drag and drop the newly cloned folder from the Windows UI over, on to the GitHub for Windows client in order to inform the latter.)
	
git: 
ifndef PROJECT
	$(error git: No target PROJECT dir specified - use: 'make git PROJECT=yourProject')
# Check existence of project on server, since this cannot be done from local shell
else ifeq (,$(findstring fatal,$(REPO))) 
	$(error git: No repo found at ($(REPO)) --> Create $(RMTGIT)$(PROJECT) at the server first)
else
	$(info === creating git environment into $(CURDIR)/$(PROJECT))
# Clone the template git project into the new git project
	git clone $(RMTGIT)$(TMPLT) $(PROJECT)
# Remove the reference to the template git
	rm -rf $(PROJECT)/.git/
# Move the existing Scrivener project into the new git project	
	-mv -uv $(PROJECT).scriv $(PROJECT)/ 
# Remove the template's startup project, but keep the .git-files in there
	mv -uv $(PROJECT)/starter.scriv/.gitignore $(PROJECT)/$(PROJECT).scriv/
	mv -uv $(PROJECT)/starter.scriv/Settings/.gitkeep $(PROJECT)/$(PROJECT).scriv/Settings/
	mv -uv $(PROJECT)/starter.scriv/Files/Docs/.gitkeep $(PROJECT)/$(PROJECT).scriv/Files/Docs/
	rm -rf $(PROJECT)/starter.scriv
# Init git	
	$(MAKE) -C $(PROJECT) gitInit
endif


#------------------------------------------------------------------------------#
# Make the high level targets:                                                 #
#------------------------------------------------------------------------------#

# all: $(PDFS)

#------------------------------------------------------------------------------#
# Make -f URL-vanDezeFile <projectnaam>.scriv                                  #
# 	Make a new Scrivener Project, e.g., 									   #
#		1 - clone template from github, and rename it  						   #
#		2 - put it under git control                                           #
#------------------------------------------------------------------------------#

%.scriv:  
	@echo === cloning git@$(RMTGIT)$(TMPLT) into $(CURDIR)/$(*F)
	exit
# Clone the template git project into the new git project
	git clone git@$(RMTGIT)$(TMPLT) $(*F)
# Remove the reference to the template git
	rm -rf $(*F)/.git/
# Rename the template's startup project to the new project name
	mv $(addprefix $(*F)/,starter.scriv $(*F).scriv)
	mv $(addprefix $(*F)/$(*F).scriv/,starter.scrivx $(*F).scrivx)
# Init git	
	$(MAKE) -C $(*F) PROJECT=$(*F) gitInit
	@ECHO `C:\Program Files (x86)\Scrivener\Scrivener.exe '$(*F)\$(*F).scriv'`

	
#------------------------------------------------------------------------------#
# Make README.md                                                   			   #
# 	Generate a README.md for your GIT repo, (including revision)			   #
#	using the title and abstract from your main mmd    						   #
#------------------------------------------------------------------------------#

README.md: templates\pandoc-GenerateReadme.tex
# Create the project README.md as copy from title and abstract
	$(MMD) -o README.md -f markdown_mmd+yaml_metadata_block -t markdown_github --template templates\pandoc-GenerateReadme.tex \
		-M version=$(VERSION) src/mmd/$(PROJECT).mmd

pandoc-GenerateReadme.tex:
	$(warning README.tex: No pandoc-GenerateReadme.tex found in templates\)
	
#------------------------------------------------------------------------------#
# Clean the distribution.                                                      #
#------------------------------------------------------------------------------#

clean:
	-rm -rf -- $(MMDS) $(PDFS) \
		*.aux *.bbl *.blg *.glo *.idx *.ist *.log *.out *.toc

#-------------------------------------------------------------------------------#
# Commit the Scrivener project contents to local git                           	#
#-------------------------------------------------------------------------------#

commit: README.md
# Check for untracked textual assets and stage them.
	git add -- $(wildcard $(PROJECT).scriv/Files/Docs/*.rtf)
	git add -u
# Commit, but read the commit message from standard input
	git commit -F -
	$(Done local commit only: use 'push' to bring it to the remote repo $(RMTGIT)\)
	touch .commit

#-------------------------------------------------------------------------------#
# Push the local git commits to the remote repository                          	#
#-------------------------------------------------------------------------------#

push: .commit
# push to remote
	git push 
	