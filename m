From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the ftrace tree
Date: Mon, 25 Aug 2008 12:01:40 +1000
Message-ID: <20080825120140.af8e1fb5.sfr@canb.auug.org.au>
References: <20080815115410.458633f1.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:54164 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753422AbYHYCBs (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 24 Aug 2008 22:01:48 -0400
In-Reply-To: <20080815115410.458633f1.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-next@vger.kernel.org, Mathieu Desnoyers <mathieu.desnoyers@polymtl.ca>, Jason Baron <jbaron@redhat.com>, Greg KH <greg@kroah.com>, Steven Rostedt <rostedt@goodmis.org>

Hi All,

On Fri, 15 Aug 2008 11:54:10 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Today's linux-next merge of the ftrace tree got a conflict in
> kernel/module.c between commit 1b75321c2d0561d9ecfe3794fa939264f3eb7e26
> ("driver core: basic infrastructure for per-module dynamic debug
> messages") from the driver-core tree and commit
> e543dff1468a55cdff9932dd3a806524790cf0b3 ("tracing: Kernel Tracepoints")
> from the ftrace tree.
> 
> Overlapping additions.  I fixed it up. Probably worth a look once I
> publish the tree.

Today this has expanded to include commit
be1c870c22e9b27170b5dd5028b6eaf2aab7b508 ("ftrace: enable mcount
recording for modules") also from the ftrace tree.  I have fixed it up as
below.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc kernel/module.c
index b610466,7426681..0000000
--- a/kernel/module.c
+++ b/kernel/module.c
@@@ -44,9 -44,10 +44,11 @@@
  #include <linux/unwind.h>
  #include <asm/uaccess.h>
  #include <asm/cacheflush.h>
 +#include <asm/sections.h>
  #include <linux/license.h>
  #include <asm/sections.h>
+ #include <linux/tracepoint.h>
+ #include <linux/ftrace.h>
  
  #if 0
  #define DEBUGP printk
@@@ -1866,7 -1836,9 +1871,10 @@@ static struct module *load_module(void 
  #endif
  	unsigned int markersindex;
  	unsigned int markersstringsindex;
 +	unsigned int verboseindex;
+ 	unsigned int tracepointsindex;
+ 	unsigned int tracepointsstringsindex;
+ 	unsigned int mcountindex;
  	struct module *mod;
  	long err = 0;
  	void *percpu = NULL, *ptr = NULL; /* Stops spurious gcc warning */
@@@ -2153,7 -2126,12 +2162,13 @@@
  	markersindex = find_sec(hdr, sechdrs, secstrings, "__markers");
   	markersstringsindex = find_sec(hdr, sechdrs, secstrings,
  					"__markers_strings");
 +	verboseindex = find_sec(hdr, sechdrs, secstrings, "__verbose");
+ 	tracepointsindex = find_sec(hdr, sechdrs, secstrings, "__tracepoints");
+ 	tracepointsstringsindex = find_sec(hdr, sechdrs, secstrings,
+ 					"__tracepoints_strings");
+ 
+ 	mcountindex = find_sec(hdr, sechdrs, secstrings,
+ 			       "__mcount_loc");
  
  	/* Now do relocations. */
  	for (i = 1; i < hdr->e_shnum; i++) {
@@@ -2203,8 -2188,16 +2225,17 @@@
  		marker_update_probe_range(mod->markers,
  			mod->markers + mod->num_markers);
  #endif
+ #ifdef CONFIG_TRACEPOINTS
+ 		tracepoint_update_probe_range(mod->tracepoints,
+ 			mod->tracepoints + mod->num_tracepoints);
+ #endif
+ 	}
+ 
+ 	/* sechdrs[0].sh_size is always zero */
+ 	mseg = (void *)sechdrs[mcountindex].sh_addr;
+ 	ftrace_init_module(mseg, mseg + sechdrs[mcountindex].sh_size);
+ 
 +	dynamic_printk_setup(mod, sechdrs, verboseindex, secstrings);
  	err = module_finalize(hdr, sechdrs, mod);
  	if (err < 0)
  		goto cleanup;
