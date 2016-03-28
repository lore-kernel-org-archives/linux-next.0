From: Arnaldo Carvalho de Melo <acme@redhat.com>
Subject: Re: linux-next: build failure in Linus' tree
Date: Mon, 28 Mar 2016 17:44:51 -0300
Message-ID: <20160328204451.GA3439@redhat.com>
References: <20160327170618.7713e43c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:46896 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754065AbcC1Uoy (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 28 Mar 2016 16:44:54 -0400
Content-Disposition: inline
In-Reply-To: <20160327170618.7713e43c@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Em Sun, Mar 27, 2016 at 05:06:18PM +1100, Stephen Rothwell escreveu:
> Hi all,
> 
> After merging the fixes tree, today's linux-next build (perf powerpcle)
> failed like this:
> 
> arch/powerpc/util/header.c:17:1: error: no previous prototype for 'get_cpuid' [-Werror=missing-prototypes]
>  get_cpuid(char *buffer, size_t sz)
>  ^
> arch/powerpc/util/header.c: In function 'get_cpuid':
> arch/powerpc/util/header.c:24:7: error: implicit declaration of function 'scnprintf' [-Werror=implicit-function-declaration]
>   nb = scnprintf(buffer, sz, "%lu,%lu$", PVR_VER(pvr), PVR_REV(pvr));
>        ^
> arch/powerpc/util/header.c:24:2: error: nested extern declaration of 'scnprintf' [-Werror=nested-externs]
>   nb = scnprintf(buffer, sz, "%lu,%lu$", PVR_VER(pvr), PVR_REV(pvr));
>   ^
> 
> Caused by commit
> 
>   531d2410635c ("perf tools: Do not include stringify.h from the kernel sources")
> 
> I added the following fix patch for for today:

I have the fix and got a docker image with ubuntu cross-compiling to
ppc64 and ppc64le, will submit the patch now.

- Arnaldo
 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Sun, 27 Mar 2016 14:44:26 +1100
> Subject: [PATCH] perf tools: we stil need header.h for various things
> 
> Fixes:  531d2410635c ("perf tools: Do not include stringify.h from the kernel sources")
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  tools/perf/arch/powerpc/util/header.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tools/perf/arch/powerpc/util/header.c b/tools/perf/arch/powerpc/util/header.c
> index 6138bdef6e63..8a0191a11f87 100644
> --- a/tools/perf/arch/powerpc/util/header.c
> +++ b/tools/perf/arch/powerpc/util/header.c
> @@ -5,6 +5,8 @@
>  #include <string.h>
>  #include <linux/stringify.h>
>  
> +#include "../../util/header.h"
> +
>  #define mfspr(rn)       ({unsigned long rval; \
>  			 asm volatile("mfspr %0," __stringify(rn) \
>  				      : "=r" (rval)); rval; })
> -- 
> 2.7.0
> 
> -- 
> Cheers,
> Stephen Rothwell
