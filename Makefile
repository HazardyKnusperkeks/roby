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
include $(dir $(abspath $(firstword $(MAKEFILE_LIST))))/../ruby.mk

ROBY_PATH = $(dir $(abspath $(firstword $(MAKEFILE_LIST))))

ifeq ($(HAVE_RUBY),1)
  TARGETS_all += $(ROBY_PATH)/touch_file
else
  ifneq ($(HAVE_RUBY),1)
    WARN_TARGETS = warning_ruby
  endif
endif

CLEAN_FILES += $(ROBY_PATH)/lib/roby_bgl.so $(ROBY_PATH)/lib/roby_marshalling.so $(ROBY_PATH)/lib/value_set/value_set.so $(ROBY_PATH)/touch_file

$(ROBY_PATH)/touch_file: $(ROBY_PATH)/lib/roby_bgl.so $(ROBY_PATH)/lib/roby_marshalling.so $(ROBY_PATH)/lib/value_set/value_set.so
	$(SILENT)rake && touch $(ROBY_PATH)/touch_file

$(ROBY_PATH)/lib/roby_bgl.so:

$(ROBY_PATH)/lib/roby_marshalling.so:

$(ROBY_PATH)/lib/value_set/value_set.so:

ifeq ($(OBJSSUBMAKE),1)
all: $(WARN_TARGETS)
.PHONY: warning_ruby
warning_ruby:
	$(SILENT)echo -e "$(INDENT_PRINT)--> $(TRED)Omitting Roby$(TNORMAL) ($(RUBY_ERROR))"
endif

include $(BUILDSYSDIR)/base.mk
