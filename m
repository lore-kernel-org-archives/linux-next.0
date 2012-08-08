From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH] tools/perf: remove yet another strtoull()
Date: Wed,  8 Aug 2012 19:37:26 +0300
Message-ID: <1344443846-5594-1-git-send-email-andriy.shevchenko@linux.intel.com>
References: <20120808161849.GC2210@infradead.org>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:40561 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758805Ab2HHQhI (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 8 Aug 2012 12:37:08 -0400
In-Reply-To: <20120808161849.GC2210@infradead.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Arnaldo Carvalho de Melo <acme@ghostprotocols.net>

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Arnaldo Carvalho de Melo <acme@ghostprotocols.net>
---
 tools/perf/util/symbol.c |   24 ++----------------------
 1 file changed, 2 insertions(+), 22 deletions(-)

diff --git a/tools/perf/util/symbol.c b/tools/perf/util/symbol.c
index 8b63b67..26e695c 100644
--- a/tools/perf/util/symbol.c
+++ b/tools/perf/util/symbol.c
@@ -2825,35 +2825,15 @@ int machines__create_kernel_maps(struct rb_root *machines, pid_t pid)
 	return machine__create_kernel_maps(machine);
 }
 
-static int hex(char ch)
-{
-	if ((ch >= '0') && (ch <= '9'))
-		return ch - '0';
-	if ((ch >= 'a') && (ch <= 'f'))
-		return ch - 'a' + 10;
-	if ((ch >= 'A') && (ch <= 'F'))
-		return ch - 'A' + 10;
-	return -1;
-}
-
 /*
  * While we find nice hex chars, build a long_val.
  * Return number of chars processed.
  */
 int hex2u64(const char *ptr, u64 *long_val)
 {
-	const char *p = ptr;
-	*long_val = 0;
-
-	while (*p) {
-		const int hex_val = hex(*p);
+	char *p;
 
-		if (hex_val < 0)
-			break;
-
-		*long_val = (*long_val << 4) | hex_val;
-		p++;
-	}
+	*long_val = strtoull(ptr, &p, 16);
 
 	return p - ptr;
 }
-- 
1.7.10.4
