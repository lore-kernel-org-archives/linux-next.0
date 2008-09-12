From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rr tree
Date: Sat, 13 Sep 2008 07:53:35 +1000
Message-ID: <20080913075335.14e1c637.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:58156 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756571AbYILVxr (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 12 Sep 2008 17:53:47 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@elte.hu>, Mathieu Desnoyers <mathieu.desnoyers@polymtl.ca>, Jason Baron <jbaron@redhat.com>, Greg KH <greg@kroah.com>

Hi Rusty,

Today's linux-next merge of the rr tree got a conflict in kernel/module.c
between commits 9ac8b6586540c99a78ecc0162bde07eec3165f71 (driver core:
basic infrastructure for per-module dynamic debug messages"") (from the
driver-core tree), e543dff1468a55cdff9932dd3a806524790cf0b3 ("tracing:
Kernel Tracepoints"), be1c870c22e9b27170b5dd5028b6eaf2aab7b508 ("ftrace:
enable mcount recording for modules"),
61e679bf257baf9a089641999cf618e92f07b5dd ("ftrace: remove old pointers to
mcount") (from the ftrace tree) and commit
7e3f5b32db2fdb84b552a1f9d6e12da5fd48b2d9 ("module:simplify-load_module")
from the rr tree.

Overlapping additions/removals.  I fixed it up (see below) and can carry
the fixup.  It is probably worth a careful check of this fix.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc kernel/module.c
index 47c42ec,5292adb..0000000
--- a/kernel/module.c
+++ b/kernel/module.c
@@@ -42,13 -42,11 +42,14 @@@
  #include <linux/string.h>
  #include <linux/mutex.h>
  #include <linux/unwind.h>
+ #include <linux/rculist.h>
  #include <asm/uaccess.h>
  #include <asm/cacheflush.h>
 +#include <asm/sections.h>
  #include <linux/license.h>
  #include <asm/sections.h>
 +#include <linux/tracepoint.h>
 +#include <linux/ftrace.h>
  
  #if 0
  #define DEBUGP printk
@@@ -1843,37 -1822,13 +1856,16 @@@ static noinline struct module *load_mod
  	unsigned int i;
  	unsigned int symindex = 0;
  	unsigned int strindex = 0;
- 	unsigned int setupindex;
- 	unsigned int exindex;
- 	unsigned int exportindex;
- 	unsigned int modindex;
- 	unsigned int obsparmindex;
- 	unsigned int infoindex;
- 	unsigned int gplindex;
- 	unsigned int crcindex;
- 	unsigned int gplcrcindex;
- 	unsigned int versindex;
- 	unsigned int pcpuindex;
- 	unsigned int gplfutureindex;
- 	unsigned int gplfuturecrcindex;
+ 	unsigned int modindex, versindex, infoindex, pcpuindex;
  	unsigned int unwindex = 0;
- #ifdef CONFIG_UNUSED_SYMBOLS
- 	unsigned int unusedindex;
- 	unsigned int unusedcrcindex;
- 	unsigned int unusedgplindex;
- 	unsigned int unusedgplcrcindex;
- #endif
- 	unsigned int markersindex;
- 	unsigned int markersstringsindex;
 +	unsigned int verboseindex;
- 	unsigned int tracepointsindex;
- 	unsigned int tracepointsstringsindex;
- 	unsigned int mcountindex;
++	unsigned int mcountsize;
+ 	unsigned int num_kp;
+ 	struct kernel_param *kp;
  	struct module *mod;
  	long err = 0;
  	void *percpu = NULL, *ptr = NULL; /* Stops spurious gcc warning */
 +	void *mseg;
- 	struct exception_table_entry *extable;
  	mm_segment_t old_fs;
  
  	DEBUGP("load_module: umod=%p, len=%lu, uargs=%p\n",
@@@ -2109,42 -2049,51 +2086,56 @@@
  	if (err < 0)
  		goto cleanup;
  
- 	/* Set up EXPORTed & EXPORT_GPLed symbols (section 0 is 0 length) */
- 	mod->num_syms = sechdrs[exportindex].sh_size / sizeof(*mod->syms);
- 	mod->syms = (void *)sechdrs[exportindex].sh_addr;
- 	if (crcindex)
- 		mod->crcs = (void *)sechdrs[crcindex].sh_addr;
- 	mod->num_gpl_syms = sechdrs[gplindex].sh_size / sizeof(*mod->gpl_syms);
- 	mod->gpl_syms = (void *)sechdrs[gplindex].sh_addr;
- 	if (gplcrcindex)
- 		mod->gpl_crcs = (void *)sechdrs[gplcrcindex].sh_addr;
- 	mod->num_gpl_future_syms = sechdrs[gplfutureindex].sh_size /
- 					sizeof(*mod->gpl_future_syms);
- 	mod->gpl_future_syms = (void *)sechdrs[gplfutureindex].sh_addr;
- 	if (gplfuturecrcindex)
- 		mod->gpl_future_crcs = (void *)sechdrs[gplfuturecrcindex].sh_addr;
+ 	/* Now we've got everything in the final locations, we can
+ 	 * find optional sections. */
+ 	kp = section_objs(hdr, sechdrs, secstrings, "__param", sizeof(*kp),
+ 			  &num_kp);
+ 	mod->syms = section_objs(hdr, sechdrs, secstrings, "__ksymtab",
+ 				 sizeof(*mod->syms), &mod->num_syms);
+ 	mod->crcs = section_addr(hdr, sechdrs, secstrings, "__kcrctab");
+ 	mod->gpl_syms = section_objs(hdr, sechdrs, secstrings, "__ksymtab_gpl",
+ 				     sizeof(*mod->gpl_syms),
+ 				     &mod->num_gpl_syms);
+ 	mod->gpl_crcs = section_addr(hdr, sechdrs, secstrings, "__kcrctab_gpl");
+ 	mod->gpl_future_syms = section_objs(hdr, sechdrs, secstrings,
+ 					    "__ksymtab_gpl_future",
+ 					    sizeof(*mod->gpl_future_syms),
+ 					    &mod->num_gpl_future_syms);
+ 	mod->gpl_future_crcs = section_addr(hdr, sechdrs, secstrings,
+ 					    "__kcrctab_gpl_future");
  
  #ifdef CONFIG_UNUSED_SYMBOLS
- 	mod->num_unused_syms = sechdrs[unusedindex].sh_size /
- 					sizeof(*mod->unused_syms);
- 	mod->num_unused_gpl_syms = sechdrs[unusedgplindex].sh_size /
- 					sizeof(*mod->unused_gpl_syms);
- 	mod->unused_syms = (void *)sechdrs[unusedindex].sh_addr;
- 	if (unusedcrcindex)
- 		mod->unused_crcs = (void *)sechdrs[unusedcrcindex].sh_addr;
- 	mod->unused_gpl_syms = (void *)sechdrs[unusedgplindex].sh_addr;
- 	if (unusedgplcrcindex)
- 		mod->unused_gpl_crcs
- 			= (void *)sechdrs[unusedgplcrcindex].sh_addr;
+ 	mod->unused_syms = section_objs(hdr, sechdrs, secstrings,
+ 					"__ksymtab_unused",
+ 					sizeof(*mod->unused_syms),
+ 					&mod->num_unused_syms);
+ 	mod->unused_crcs = section_addr(hdr, sechdrs, secstrings,
+ 					"__kcrctab_unused");
+ 	mod->unused_gpl_syms = section_objs(hdr, sechdrs, secstrings,
+ 					    "__ksymtab_unused_gpl",
+ 					    sizeof(*mod->unused_gpl_syms),
+ 					    &mod->num_unused_gpl_syms);
+ 	mod->unused_gpl_crcs = section_addr(hdr, sechdrs, secstrings,
+ 					    "__kcrctab_unused_gpl");
+ #endif
+ 
+ #ifdef CONFIG_MARKERS
+ 	mod->markers = section_objs(hdr, sechdrs, secstrings, "__markers",
+ 				    sizeof(*mod->markers), &mod->num_markers);
+ #endif
++#ifdef CONFIG_TRACEPOINTS
++	mod->tracepoints = section_objs(hdr, sechdrs, secstrings,
++				"__tracepoints", sizeof(*mod->tracepoints),
++				&mod->num_tracepoints);
 +#endif
  
  #ifdef CONFIG_MODVERSIONS
- 	if ((mod->num_syms && !crcindex)
- 	    || (mod->num_gpl_syms && !gplcrcindex)
- 	    || (mod->num_gpl_future_syms && !gplfuturecrcindex)
+ 	if ((mod->num_syms && !mod->crcs)
+ 	    || (mod->num_gpl_syms && !mod->gpl_crcs)
+ 	    || (mod->num_gpl_future_syms && !mod->gpl_future_crcs)
  #ifdef CONFIG_UNUSED_SYMBOLS
- 	    || (mod->num_unused_syms && !unusedcrcindex)
- 	    || (mod->num_unused_gpl_syms && !unusedgplcrcindex)
+ 	    || (mod->num_unused_syms && !mod->unused_crcs)
+ 	    || (mod->num_unused_gpl_syms && !mod->unused_gpl_crcs)
  #endif
  		) {
  		printk(KERN_WARNING "%s: No versions for exported symbols.\n", mod->name);
@@@ -2153,16 -2102,6 +2144,7 @@@
  			goto cleanup;
  	}
  #endif
- 	markersindex = find_sec(hdr, sechdrs, secstrings, "__markers");
-  	markersstringsindex = find_sec(hdr, sechdrs, secstrings,
- 					"__markers_strings");
 +	verboseindex = find_sec(hdr, sechdrs, secstrings, "__verbose");
- 	tracepointsindex = find_sec(hdr, sechdrs, secstrings, "__tracepoints");
- 	tracepointsstringsindex = find_sec(hdr, sechdrs, secstrings,
- 					"__tracepoints_strings");
- 
- 	mcountindex = find_sec(hdr, sechdrs, secstrings,
- 			       "__mcount_loc");
  
  	/* Now do relocations. */
  	for (i = 1; i < hdr->e_shnum; i++) {
@@@ -2219,17 -2145,7 +2189,18 @@@
  		marker_update_probe_range(mod->markers,
  			mod->markers + mod->num_markers);
  #endif
 +#ifdef CONFIG_TRACEPOINTS
 +		tracepoint_update_probe_range(mod->tracepoints,
 +			mod->tracepoints + mod->num_tracepoints);
 +#endif
 +	}
 +	dynamic_printk_setup(sechdrs, verboseindex);
 +
 +	/* sechdrs[0].sh_size is always zero */
- 	mseg = (void *)sechdrs[mcountindex].sh_addr;
- 	ftrace_init_module(mseg, mseg + sechdrs[mcountindex].sh_size);
++	mseg = section_objs(hdr, sechdrs, secstrings,
++			       "__mcount_loc", 1, &mcountsize);
++	ftrace_init_module(mseg, mseg + mcountsize);
 +
  	err = module_finalize(hdr, sechdrs, mod);
  	if (err < 0)
  		goto cleanup;
