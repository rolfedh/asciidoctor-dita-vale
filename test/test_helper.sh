# Copyright (C) 2025 Jaromir Hradilek

# MIT License
#
# Permission  is hereby granted,  free of charge,  to any person  obtaining
# a copy of  this software  and associated documentation files  (the "Soft-
# ware"),  to deal in the Software  without restriction,  including without
# limitation the rights to use,  copy, modify, merge,  publish, distribute,
# sublicense, and/or sell copies of the Software,  and to permit persons to
# whom the Software is furnished to do so,  subject to the following condi-
# tions:
#
# The above copyright notice  and this permission notice  shall be included
# in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS",  WITHOUT WARRANTY OF ANY KIND,  EXPRESS
# OR IMPLIED,  INCLUDING BUT NOT LIMITED TO  THE WARRANTIES OF MERCHANTABI-
# LITY,  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT
# SHALL THE AUTHORS OR COPYRIGHT HOLDERS  BE LIABLE FOR ANY CLAIM,  DAMAGES
# OR OTHER LIABILITY,  WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
# ARISING FROM,  OUT OF OR IN CONNECTION WITH  THE SOFTWARE  OR  THE USE OR
# OTHER DEALINGS IN THE SOFTWARE.

# Move to the directory with sample AsciiDoc files and run Vale on them:
#
# Usage: run_vale TEST_FILE [SAMPLE_FILE]
function run_vale {
   local -r testname=${1##*/}
   local -r filename=${2:-'.'}

   # Compose the path to the sample files:
   local -r fixtures="fixtures/${testname/%.bats/}/"

   # Move to the composed path and run Vale in it:
   cd "$fixtures" && \vale --output line --no-wrap --sort --config vale.ini "$filename"
}
