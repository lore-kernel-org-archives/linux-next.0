From: Konstantin Khlebnikov <koct9i@gmail.com>
Subject: [PATCH] scripts/decode_stacktrace.sh: handle symbols in modules
Date: Sat, 23 Apr 2016 22:03:34 +0300
Message-ID: <146143821438.5129.1986898879678002890.stgit@zurg>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-lf0-f47.google.com ([209.85.215.47]:33854 "EHLO
	mail-lf0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751742AbcDWTDl (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 23 Apr 2016 15:03:41 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sasha Levin <sasha.levin@oracle.com>, Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Add third argument: path where script looks for file module.ko when
decode module symbol "func+0x0ff/0x5153 [module]" into something like
"func (foo/bar.c:123) module". Without argument or if file isn't found
script prints such symbols as is without decoding.

Signed-off-by: Konstantin Khlebnikov <koct9i@gmail.com>
---
 scripts/decode_stacktrace.sh |   55 ++++++++++++++++++++++++++++++------------
 1 file changed, 39 insertions(+), 16 deletions(-)

diff --git a/scripts/decode_stacktrace.sh b/scripts/decode_stacktrace.sh
index 00d6d53c2681..c332684e1b5a 100755
--- a/scripts/decode_stacktrace.sh
+++ b/scripts/decode_stacktrace.sh
@@ -2,15 +2,17 @@
 # (c) 2014, Sasha Levin <sasha.levin@oracle.com>
 #set -x
 
-if [[ $# != 2 ]]; then
+if [[ $# < 2 ]]; then
 	echo "Usage:"
-	echo "	$0 [vmlinux] [base path]"
+	echo "	$0 [vmlinux] [base path] [modules path]"
 	exit 1
 fi
 
 vmlinux=$1
 basepath=$2
+modpath=$3
 declare -A cache
+declare -A modcache
 
 parse_symbol() {
 	# The structure of symbol at this point is:
@@ -19,6 +21,17 @@ parse_symbol() {
 	# For example:
 	#   do_basic_setup+0x9c/0xbf
 
+	if [[ $module == "" ]] ; then
+		local objfile=$vmlinux
+	elif [[ "${modcache[$module]+isset}" == "isset" ]]; then
+		local objfile=${modcache[$module]}
+	else
+		[[ $modpath == "" ]] && return
+		local objfile=$(find "$modpath" -name $module.ko -print -quit)
+		[[ $objfile == "" ]] && return
+		modcache[$module]=$objfile
+	fi
+
 	# Remove the englobing parenthesis
 	symbol=${symbol#\(}
 	symbol=${symbol%\)}
@@ -29,11 +42,11 @@ parse_symbol() {
 	# Use 'nm vmlinux' to figure out the base address of said symbol.
 	# It's actually faster to call it every time than to load it
 	# all into bash.
-	if [[ "${cache[$name]+isset}" == "isset" ]]; then
-		local base_addr=${cache[$name]}
+	if [[ "${cache[$module,$name]+isset}" == "isset" ]]; then
+		local base_addr=${cache[$module,$name]}
 	else
-		local base_addr=$(nm "$vmlinux" | grep -i ' t ' | awk "/ $name\$/ {print \$1}" | head -n1)
-		cache["$name"]="$base_addr"
+		local base_addr=$(nm "$objfile" | grep -i ' t ' | awk "/ $name\$/ {print \$1}" | head -n1)
+		cache[$module,$name]="$base_addr"
 	fi
 	# Let's start doing the math to get the exact address into the
 	# symbol. First, strip out the symbol total length.
@@ -48,12 +61,12 @@ parse_symbol() {
 	local address=$(printf "%x\n" "$expr")
 
 	# Pass it to addr2line to get filename and line number
-        # Could get more than one result
-	if [[ "${cache[$address]+isset}" == "isset" ]]; then
-		local code=${cache[$address]}
+	# Could get more than one result
+	if [[ "${cache[$module,$address]+isset}" == "isset" ]]; then
+		local code=${cache[$module,$address]}
 	else
-		local code=$(addr2line -i -e "$vmlinux" "$address")
-		cache[$address]=$code
+		local code=$(addr2line -i -e "$objfile" "$address")
+		cache[$module,$address]=$code
 	fi
 
 	# addr2line doesn't return a proper error code if it fails, so
@@ -105,13 +118,23 @@ handle_line() {
 		fi
 	done
 
-	# The symbol is the last element, process it
-	symbol=${words[$last]}
+	if [[ ${words[$last]} =~ \[([^]]+)\] ]]; then
+		module=${words[$last]}
+		module=${module#\[}
+		module=${module%\]}
+		symbol=${words[$last-1]}
+		unset words[$last-1]
+	else
+		# The symbol is the last element, process it
+		symbol=${words[$last]}
+		module=
+	fi
+
 	unset words[$last]
 	parse_symbol # modifies $symbol
 
 	# Add up the line number to the symbol
-	echo "${words[@]}" "$symbol"
+	echo "${words[@]}" "$symbol $module"
 }
 
 while read line; do
@@ -121,8 +144,8 @@ while read line; do
 		handle_line "$line"
 	# Is it a code line?
 	elif [[ $line == *Code:* ]]; then
-                decode_code "$line"
-        else
+		decode_code "$line"
+	else
 		# Nothing special in this line, show it as is
 		echo "$line"
 	fi
