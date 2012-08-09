From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH] tools/perf: build when EXTRA_CFLAGS=-m32 is supplied
Date: Thu,  9 Aug 2012 15:12:27 +0300
Message-ID: <1344514347-23444-1-git-send-email-andriy.shevchenko@linux.intel.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:62932 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932153Ab2HIMMe (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 9 Aug 2012 08:12:34 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org, Arnaldo Carvalho de Melo <acme@ghostprotocols.net>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

ARCH=x86 NO_LIBPERL=1 NO_LIBPYTHON=1 NO_NEWT=1 make V=1 -C tools EXTRA_CFLAGS=-m32 perf
...

/usr/bin/ld: Warning: size of symbol `die' changed from 36 in libperf.a(usage.o) to 161 in ../lib/traceevent//libtraceevent.a(parse-utils.o)
/usr/bin/ld: Warning: size of symbol `warning' changed from 54 in libperf.a(usage.o) to 161 in ../lib/traceevent//libtraceevent.a(parse-utils.o)
/usr/bin/ld: i386:x86-64 architecture of input file `../lib/traceevent//libtraceevent.a(event-parse.o)' is incompatible with i386 output
/usr/bin/ld: i386:x86-64 architecture of input file `../lib/traceevent//libtraceevent.a(trace-seq.o)' is incompatible with i386 output
/usr/bin/ld: i386:x86-64 architecture of input file `../lib/traceevent//libtraceevent.a(parse-filter.o)' is incompatible with i386 output
/usr/bin/ld: i386:x86-64 architecture of input file `../lib/traceevent//libtraceevent.a(parse-utils.o)' is incompatible with i386 output
collect2: error: ld returned 1 exit status

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 tools/lib/traceevent/Makefile |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/lib/traceevent/Makefile b/tools/lib/traceevent/Makefile
index 14131cb..65d5512 100644
--- a/tools/lib/traceevent/Makefile
+++ b/tools/lib/traceevent/Makefile
@@ -125,7 +125,7 @@ EVENT_PARSE_VERSION = $(EP_VERSION).$(EP_PATCHLEVEL).$(EP_EXTRAVERSION)
 INCLUDES = -I. -I/usr/local/include $(CONFIG_INCLUDES)
 
 # Set compile option CFLAGS if not set elsewhere
-CFLAGS ?= -g -Wall
+CFLAGS ?= -g -Wall $(EXTRA_CFLAGS)
 
 # Append required CFLAGS
 override CFLAGS += $(CONFIG_FLAGS) $(INCLUDES) $(PLUGIN_DIR_SQ)
-- 
1.7.10.4
