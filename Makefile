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


# Append all sources in the src directory
SRCS += $(patsubst $(SRC_DIR)%,%,$(wildcard $(SRC_DIR)*.c))

include Makefile.include

