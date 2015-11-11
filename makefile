APP = $(shell basename $(shell pwd))

CC = g++

CFLAGS = -Wall `wx-config --cppflags`
LFLAGS = `wx-config --libs core,base`

BUIDIR = build
OBJDIR = obj
OSXDIR = osx
SRCDIR = src

SOURCES := $(wildcard $(SRCDIR)/*.cpp)
OBJECTS := $(patsubst $(SRCDIR)/%,%,$(patsubst %.cpp,%.o,$(SOURCES)))

NO_COLOR = \033[0m
O1_COLOR = \033[0;01m
O2_COLOR = \033[32;01m

PREFIX = "$(O2_COLOR)==>$(O1_COLOR)"
SUFFIX = "$(NO_COLOR)"


all: clean linking osx
	@echo $(PREFIX) Build finished $(SUFFIX)
http://cdn.appstorm.net/mac.appstorm.net/files/2012/04/Untitled-thumb.png
clean:
	@echo $(PREFIX) Cleaning up $(SUFFIX)
	rm -rfv $(BUIDIR) $(OBJDIR)

$(BUIDIR)/:
	mkdir -p $@

$(OBJDIR)/:
	mkdir -p $@

$(OSXDIR)/:
	mkdir -p $@

%.o: $(SRCDIR)/%.cpp
	@echo $(PREFIX) Compiling $< $(SUFFIX)
	$(CC) $(CFLAGS) -c $< -o $(OBJDIR)/$@

linking: $(BUIDIR)/ $(OBJDIR)/ $(OBJECTS)
	@echo $(PREFIX) Linking $(SUFFIX)
	$(CC) $(CFLAGS) $(OBJDIR)/*.o -o $(BUIDIR)/$(APP) $(LFLAGS)

osx: $(BUIDIR)/$(APP) $(OSXDIR)/Info.plist
	@echo $(PREFIX) Creating Mac OS X executable file $(SUFFIX)
	-mkdir $(BUIDIR)/$(APP).app
	-mkdir $(BUIDIR)/$(APP).app/Contents
	-mkdir $(BUIDIR)/$(APP).app/Contents/MacOS
	-mkdir $(BUIDIR)/$(APP).app/Contents/Resources
	-mkdir $(BUIDIR)/$(APP).app/Contents/Resources/English.lproj
	cp $(OSXDIR)/Info.plist $(BUIDIR)/$(APP).app/Contents/
	@#cp $(OSXDIR)/version.plist $(APP).app/Contents/
	@#cp $(OSXDIR)/InfoPlist.strings $(APP).app/Contents/Resources/English.lproj/
	@#cp $(OSXDIR)/Icons.icns AnotherResource.txt $(APP).app/Contents/Resources/
	cp $(OSXDIR)/Icons.icns $(BUIDIR)/$(APP).app/Contents/Resources/
	cp $(BUIDIR)/$(APP) $(BUIDIR)/$(APP).app/Contents/MacOS/$(APP)
	echo -n 'APPL????' > $(BUIDIR)/$(APP).app/Contents/PkgInfo

.PHONY: all clean linking osx
.SILENT: $(BUIDIR)/ $(OBJDIR)/