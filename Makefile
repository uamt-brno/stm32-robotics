##
## This file is part of the stm32-robotics project.
##
## This library is free software: you can redistribute it and/or modify
## it under the terms of the GNU Lesser General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## This library is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU Lesser General Public License for more details.
##
## You should have received a copy of the GNU Lesser General Public License
## along with this library.  If not, see <http://www.gnu.org/licenses/>.
##

# this variable should be same as the project name, instead debugging
# will not work !
BINARY = project

DEVICE = stm32f407vgt6

# Configure directories. These should end with trailing / !
OPENCM3_DIR	= lib/libopencm3/
INTERMEDIATE_DIR= tmp/
OUTPUT_DIR	= bin/
SRC_DIR		= src/

#PRINTF	= scripts/fancyprint.sh

CPPFLAGS	+= -Iinclude

###############################################################################
# End of user config.

# Append all sources in the src directory
SRCS += $(patsubst $(SRC_DIR)%,%,$(wildcard $(SRC_DIR)*.c) $(wildcard $(SRC_DIR)*.cpp))

VPATH	+= src

V ?= 0
# silent mode
ifeq ($(V),-1)
PRINTF = \#printf
Q = @
endif
#normal mode
ifeq ($(V),0)
Q = @
endif
#verbose mode
ifeq ($(V),1)
endif

OBJS	:= $(addprefix $(INTERMEDIATE_DIR),			\
		$(patsubst %.c,%.o,$(filter %.c,$(SRCS)))	\
		$(patsubst %.cpp,%.o,$(filter %.cpp,$(SRCS)))	\
		$(OBJS))


###############################################################################
# GENERAL CONFIG

include mk/common.mk

include $(OPENCM3_DIR)mk/gcc-config.mk
include $(OPENCM3_DIR)mk/genlink-config.mk

# this must be included after genlink !
include mk/libopencm3-config.mk

.SUFFIXES: .elf .bin .hex .srec .list .images
.SECONDEXPANSION:
.SECONDARY:

###############################################################################
# RULES

.PHONY: all
all: images

include $(OPENCM3_DIR)mk/gcc-rules.mk
include $(OPENCM3_DIR)mk/genlink-rules.mk
include mk/libopencm3-rules.mk



.PHONY: images
images: $(INTERMEDIATE_DEP) bin bin/$(BINARY).images

.PHONY: flash
flash: bin/$(BINARY).flash

.PHONY: gdb
gdb: bin/$(BINARY).gdb

.PHONY: clean
clean:
	$(Q)$(RM) -rf bin $(INTERMEDIATE_DEP)

%.images: %.elf %.list %.size
	@# empty rule

%.flash: %.elf
	@$(PRINTF) "  GDB     $< (flash)\n"
	$(Q)$(GDB) --batch -ex 'target extended-remote COM3' \
		   -x $(OPENCM3_DIR)scripts/black_magic_probe_flash.scr $<

%.gdb: %.elf
	@$(PRINTF) "  GDB     $< (gdb)\n"
	$(Q)$(GDB) -ex 'target extended-remote COM3' \
		   -x $(OPENCM3_DIR)scripts/black_magic_probe_flash.scr $<

###############################################################################
# Directories

bin $(INTERMEDIATE_DEP):
	@$(PRINTF) "  DIR     $@\n"
	-@mkdir	$@

###############################################################################
# DEPENDENCIES

-include $(OBJS:.o=.d)
