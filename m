From: Randy Dunlap <rdunlap@xenotime.net>
Subject: [PATCH -next] x86: perf_event_amd.c needs <asm/apicdef.h>
Date: Tue, 27 Sep 2011 10:00:40 -0700
Message-ID: <4E820138.90301@xenotime.net>
References: <20110926172348.be01ff9a1c16267ffd000d2a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy3-pub.bluehost.com ([69.89.21.8]:42740 "HELO
	oproxy3-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1750975Ab1I0RAm (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 27 Sep 2011 13:00:42 -0400
In-Reply-To: <20110926172348.be01ff9a1c16267ffd000d2a@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Robert Richter <robert.richter@amd.com>, Ingo Molnar <mingo@elte.hu>, Andre Przywara <andre.przywara@amd.com>, Andrew Morton <akpm@linux-foundation.org>

From: Randy Dunlap <rdunlap@xenotime.net>

Fix build error by adding <asm/apicdef.h> header file:

arch/x86/kernel/cpu/perf_event_amd.c:350:2: error: 'BAD_APICID' undeclared (first use in this function)

Signed-off-by: Randy Dunlap <rdunlap@xenotime.net>
---

Found in linux-next and patch only applies cleanly to linux-next,
but looks like mainline could use a similar patch (with more
header files).

 arch/x86/kernel/cpu/perf_event_amd.c |    1 +
 1 file changed, 1 insertion(+)

--- next-2011-0927.orig/arch/x86/kernel/cpu/perf_event_amd.c
+++ next-2011-0927/arch/x86/kernel/cpu/perf_event_amd.c
@@ -2,6 +2,7 @@
 #include <linux/types.h>
 #include <linux/init.h>
 #include <linux/slab.h>
+#include <asm/apicdef.h>
 
 #include "perf_event.h"
 
