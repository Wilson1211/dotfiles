#!/usr/bin/env bash

# Filename: recursively_rename.sh
# Author: Tzu-Yu Jeng
# Date: Feb. 2017
# Description: If included in a script, this parses input arguments;
#    when there are two arguments, the 1st is source, the 2nd binary
#    without extension; when there is only one, it is source, and the
#    binary's name is obtained by substituting source's extension.


# To substitute `bar` for all substring `foo` occurring in filename with `bar`, with `RecursivelyRename foo bar`,
# within filenames throughout current directory and all subdirectories.
# A Perl-based utility `rename` is used; `-S` for "substitute all".
# Enter `brew install rename` to install that.

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

# The fullname of source is saved as `full_name_src`.
# The basename of binary is saved as `bare_name_bin`.

# Note that `EXT_BIN` need to be defined in advance!
# To check number of arguments.
# If no. of arguments equals (`-eq`) 0:
if [[ "$#" -eq 0 ]]
then
   echo "No arguments supplied. 1 or 2 expected, 0 present. Stop." > /dev/stderr
   exit 1

# If no. of arguments is strictly greater than (`-gt`) 2:
elif [[ "$#" -gt 2 ]]
then
   echo "Too many arguments. 1 or 2 expected, $# present. Stop." > /dev/stderr
   exit 1

else
   # To set source name to be the 1st argument.
   full_name_src="$1"
fi

# To replace extension of source with that of binary.
if [[ "$#" -eq 1 ]]
then
   bare_name_bin="${full_name_src%%.*}"

# To set binary name to be the 2nd argument stripped of extension.
elif [[ "$#" -eq 2 ]]
then
   if [[ "$2" == *"\."* ]]
   then
      echo "Superfluous extension in filename $2 will be stripped." > /dev/stderr
   fi

   bare_name_bin=$2
   bare_name_bin="${bare_name_bin%%.*}"
fi