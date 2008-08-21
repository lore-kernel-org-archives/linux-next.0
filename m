From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the ftrace tree
Date: Thu, 21 Aug 2008 13:09:03 +1000
Message-ID: <20080821130903.1df56278.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:43179 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756692AbYHUDJP (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 20 Aug 2008 23:09:15 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-next@vger.kernel.org, Greg KH <greg@kroah.com>, Mathieu Desnoyers <mathieu.desnoyers@polymtl.ca>, Jason Baron <jbaron@redhat.com>

Hi all,

[I have reported this previously but something has changed slightly.]

Today's linux-next merge of the ftrace tree got a conflict in
kernel/module.c between commit bf8b9a59e335ca159aa4b3878ced0e94ea74cbc4
("driver core: basic infrastructure for per-module dynamic debug
messages") from the driver-core tree and commit
e543dff1468a55cdff9932dd3a806524790cf0b3 ("tracing: Kernel Tracepoints")
from the ftrace tree.

Just overlapping additions.  I fixed it up (see below).
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc kernel/module.c
index b610466,6962348..0000000
--- a/kernel/module.c
+++ b/kernel/module.c
@@@ -44,9 -44,9 +44,10 @@@
  #include <linux/unwind.h>
  #include <asm/uaccess.h>
  #include <asm/cacheflush.h>
 +#include <asm/sections.h>
  #include <linux/license.h>
  #include <asm/sections.h>
+ #include <linux/tracepoint.h>
  
  #if 0
  #define DEBUGP printk
@@@ -1866,7 -1832,8 +1867,9 @@@ static struct module *load_module(void 
  #endif
  	unsigned int markersindex;
  	unsigned int markersstringsindex;
 +	unsigned int verboseindex;
+ 	unsigned int tracepointsindex;
+ 	unsigned int tracepointsstringsindex;
  	struct module *mod;
  	long err = 0;
  	void *percpu = NULL, *ptr = NULL; /* Stops spurious gcc warning */
@@@ -2153,7 -2120,9 +2156,10 @@@
  	markersindex = find_sec(hdr, sechdrs, secstrings, "__markers");
   	markersstringsindex = find_sec(hdr, sechdrs, secstrings,
  					"__markers_strings");
 +	verboseindex = find_sec(hdr, sechdrs, secstrings, "__verbose");
+ 	tracepointsindex = find_sec(hdr, sechdrs, secstrings, "__tracepoints");
+ 	tracepointsstringsindex = find_sec(hdr, sechdrs, secstrings,
+ 					"__tracepoints_strings");
  
  	/* Now do relocations. */
  	for (i = 1; i < hdr->e_shnum; i++) {
@@@ -2203,8 -2179,11 +2216,12 @@@
  		marker_update_probe_range(mod->markers,
  			mod->markers + mod->num_markers);
  #endif
+ #ifdef CONFIG_TRACEPOINTS
+ 		tracepoint_update_probe_range(mod->tracepoints,
+ 			mod->tracepoints + mod->num_tracepoints);
+ #endif
+ 	}
 +	dynamic_printk_setup(mod, sechdrs, verboseindex, secstrings);
  	err = module_finalize(hdr, sechdrs, mod);
  	if (err < 0)
  		goto cleanup;
