From: Mathieu Desnoyers <mathieu.desnoyers@polymtl.ca>
Subject: Re: linux-next: manual merge of the ftrace tree
Date: Thu, 21 Aug 2008 00:03:18 -0400
Message-ID: <20080821040317.GA19629@Krystal>
References: <20080821130903.1df56278.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from toq8-srv.bellnexxia.net ([209.226.175.204]:61325 "EHLO
	toq8-srv.bellnexxia.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750880AbYHUEnR (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 21 Aug 2008 00:43:17 -0400
Received: from toip4.srvr.bell.ca ([209.226.175.87])
          by tomts16-srv.bellnexxia.net
          (InterMail vM.5.01.06.13 201-253-122-130-113-20050324) with ESMTP
          id <20080821040318.LMH1723.tomts16-srv.bellnexxia.net@toip4.srvr.bell.ca>
          for <linux-next@vger.kernel.org>; Thu, 21 Aug 2008 00:03:18 -0400
Content-Disposition: inline
In-Reply-To: <20080821130903.1df56278.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, Greg KH <greg@kroah.com>, Jason Baron <jbaron@redhat.com>

* Stephen Rothwell (sfr@canb.auug.org.au) wrote:
> Hi all,
> 
> [I have reported this previously but something has changed slightly.]
> 
> Today's linux-next merge of the ftrace tree got a conflict in
> kernel/module.c between commit bf8b9a59e335ca159aa4b3878ced0e94ea74cbc4
> ("driver core: basic infrastructure for per-module dynamic debug
> messages") from the driver-core tree and commit
> e543dff1468a55cdff9932dd3a806524790cf0b3 ("tracing: Kernel Tracepoints")
> from the ftrace tree.
> 

Looks good to me, thanks !

Mathieu

> Just overlapping additions.  I fixed it up (see below).
> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> http://www.canb.auug.org.au/~sfr/
> 
> diff --cc kernel/module.c
> index b610466,6962348..0000000
> --- a/kernel/module.c
> +++ b/kernel/module.c
> @@@ -44,9 -44,9 +44,10 @@@
>   #include <linux/unwind.h>
>   #include <asm/uaccess.h>
>   #include <asm/cacheflush.h>
>  +#include <asm/sections.h>
>   #include <linux/license.h>
>   #include <asm/sections.h>
> + #include <linux/tracepoint.h>
>   
>   #if 0
>   #define DEBUGP printk
> @@@ -1866,7 -1832,8 +1867,9 @@@ static struct module *load_module(void 
>   #endif
>   	unsigned int markersindex;
>   	unsigned int markersstringsindex;
>  +	unsigned int verboseindex;
> + 	unsigned int tracepointsindex;
> + 	unsigned int tracepointsstringsindex;
>   	struct module *mod;
>   	long err = 0;
>   	void *percpu = NULL, *ptr = NULL; /* Stops spurious gcc warning */
> @@@ -2153,7 -2120,9 +2156,10 @@@
>   	markersindex = find_sec(hdr, sechdrs, secstrings, "__markers");
>    	markersstringsindex = find_sec(hdr, sechdrs, secstrings,
>   					"__markers_strings");
>  +	verboseindex = find_sec(hdr, sechdrs, secstrings, "__verbose");
> + 	tracepointsindex = find_sec(hdr, sechdrs, secstrings, "__tracepoints");
> + 	tracepointsstringsindex = find_sec(hdr, sechdrs, secstrings,
> + 					"__tracepoints_strings");
>   
>   	/* Now do relocations. */
>   	for (i = 1; i < hdr->e_shnum; i++) {
> @@@ -2203,8 -2179,11 +2216,12 @@@
>   		marker_update_probe_range(mod->markers,
>   			mod->markers + mod->num_markers);
>   #endif
> + #ifdef CONFIG_TRACEPOINTS
> + 		tracepoint_update_probe_range(mod->tracepoints,
> + 			mod->tracepoints + mod->num_tracepoints);
> + #endif
> + 	}
>  +	dynamic_printk_setup(mod, sechdrs, verboseindex, secstrings);
>   	err = module_finalize(hdr, sechdrs, mod);
>   	if (err < 0)
>   		goto cleanup;

-- 
Mathieu Desnoyers
OpenPGP key fingerprint: 8CD5 52C3 8E3C 4140 715F  BA06 3F25 A8FE 3BAE 9A68
