From: Mike Pagano <mpagano@gentoo.org>
Subject: [PATCH RESEND] kconfig: Update to diffconfig to support python 2.6 and greater
Date: Wed, 07 Aug 2013 20:33:32 -0400
Message-ID: <1416176.geFjaPh5V0@comanche>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 216.155.138.14.choopa.net ([216.155.138.14]:40475 "EHLO
	hopi.mpagano.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
	with ESMTP id S933367Ab3HHAdj (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 7 Aug 2013 20:33:39 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: tim.bird@am.sony.com

Modification of the diffconfig script to support python versions 2.6 and 
greater. Added a small change to gracefully exit if the default config files 
are not present. (.config and .config.old)

Note that Linux distributions are starting to deprecate python versions < 2.5

Diffconfig is a utility script for comparing kernel configuration files.

Signed-off-by: Mike Pagano <mpagano@gentoo.org>
Signed-off-by: Tobias Klausmann <klausman@gentoo.org>
Signed-off-by: Ewoud Kohl van Wijngaarden <ewoud@kohlvanwijngaarden.nl>
---
 scripts/diffconfig | 60 ++++++++++++++++++++++++++++++------------------------
 1 file changed, 33 insertions(+), 27 deletions(-)

diff --git a/scripts/diffconfig b/scripts/diffconfig
index b91f3e3..4829594 100755
--- a/scripts/diffconfig
+++ b/scripts/diffconfig
@@ -10,7 +10,7 @@
 import sys, os
 
 def usage():
-    print """Usage: diffconfig [-h] [-m] [<config1> <config2>]
+    print("""Usage: diffconfig [-h] [-m] [<config1> <config2>]
 
 Diffconfig is a simple utility for comparing two .config files.
 Using standard diff to compare .config files often includes extraneous and
@@ -33,7 +33,7 @@ Example usage:
  EXT2_FS  y -> n
  LOG_BUF_SHIFT  14 -> 16
  PRINTK_TIME  n -> y
-"""
+""")
     sys.exit(0)
 
 # returns a dictionary of name/value pairs for config items in the file
@@ -54,23 +54,26 @@ def print_config(op, config, value, new_value):
     if merge_style:
         if new_value:
             if new_value=="n":
-                print "# CONFIG_%s is not set" % config
+                print("# CONFIG_%s is not set" % config)
             else:
-                print "CONFIG_%s=%s" % (config, new_value)
+                print("CONFIG_%s=%s" % (config, new_value))
     else:
         if op=="-":
-            print "-%s %s" % (config, value)
+            print("-%s %s" % (config, value))
         elif op=="+":
-            print "+%s %s" % (config, new_value)
+            print("+%s %s" % (config, new_value))
         else:
-            print " %s %s -> %s" % (config, value, new_value)
+            print(" %s %s -> %s" % (config, value, new_value))
 
 def main():
     global merge_style
 
+    config_a = {}
+    config_b = {}
+
     # parse command line args
     if ("-h" in sys.argv or "--help" in sys.argv):
-	usage()
+        usage()
 
     merge_style = 0
     if "-m" in sys.argv:
@@ -79,13 +82,13 @@ def main():
 
     argc = len(sys.argv)
     if not (argc==1 or argc == 3):
-        print "Error: incorrect number of arguments or unrecognized option"
+        print("Error: incorrect number of arguments or unrecognized option")
         usage()
 
     if argc == 1:
         # if no filenames given, assume .config and .config.old
         build_dir=""
-        if os.environ.has_key("KBUILD_OUTPUT"):
+        if "KBUILD_OUTPUT" in os.environ:
             build_dir = os.environ["KBUILD_OUTPUT"]+"/"
 
         configa_filename = build_dir + ".config.old"
@@ -94,36 +97,39 @@ def main():
         configa_filename = sys.argv[1]
         configb_filename = sys.argv[2]
 
-    a = readconfig(file(configa_filename))
-    b = readconfig(file(configb_filename))
+    try:
+        config_a = readconfig(open(configa_filename))
+        config_b = readconfig(open(configb_filename))
+    except IOError as e:
+        print("I/O error({0}): {1}\n".format(e.errno, e.strerror))
+        usage()
 
-    # print items in a but not b (accumulate, sort and print)
+    # print items in config_a but not config_b (accumulate, sort and print)
     old = []
-    for config in a:
-        if config not in b:
+    for config in config_a:
+        if config not in config_b:
             old.append(config)
     old.sort()
     for config in old:
-        print_config("-", config, a[config], None)
-        del a[config]
+        print_config("-", config, config_a[config], None)
+        del config_a[config]
 
     # print items that changed (accumulate, sort, and print)
     changed = []
-    for config in a:
-        if a[config] != b[config]:
+    for config in config_a:
+        if config_a[config] != config_b[config]:
             changed.append(config)
         else:
-            del b[config]
+            del config_b[config]
     changed.sort()
     for config in changed:
-        print_config("->", config, a[config], b[config])
-        del b[config]
+        print_config("->", config, config_a[config], config_b[config])
+        del config_b[config]
 
-    # now print items in b but not in a
-    # (items from b that were in a were removed above)
-    new = b.keys()
-    new.sort()
+    # now print items in config_b but not in config_a
+    # (items from config_b that were in config_a were removed above)
+    new = sorted(config_b.keys())
     for config in new:
-        print_config("+", config, None, b[config])
+        print_config("+", config, None, config_b[config])
 
 main()
-- 
1.8.1.5
