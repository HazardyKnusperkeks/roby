#*****************************************************************************
#           Makefile Build System for Fawkes: Roby
#                            -------------------
#   Created on Sat Mar 09 12:36:02 2016
#   Copyright (C) 2016 by Björn Schäpers
#
#*****************************************************************************
#
#   This program is free software; you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation; either version 2 of the License, or
#   (at your option) any later version.
#
#*****************************************************************************

BASEDIR = ../../../..
include $(BASEDIR)/etc/buildsys/config.mk

#todo Check for ruby
HAVE_RUBY = 1
ifeq ($(HAVE_RUBY),1)
  #todo rake aufrufen
else
  ifneq ($(HAVE_RUBY),1)
    WARN_TARGETS = warning_ruby
  endif
endif
ifeq ($(OBJSSUBMAKE),1)
all: $(WARN_TARGETS)
.PHONY: warning_ruby
warning_ruby:
	$(SILENT)echo -e "$(INDENT_PRINT)--> $(TRED)Omitting Roby$(TNORMAL) ($(RUBY_ERROR))"
endif

include $(BUILDSYSDIR)/base.mk
