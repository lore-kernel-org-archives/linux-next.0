From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [PATCH -next] x86: perf_event_amd.c needs <asm/apicdef.h>
Date: Wed, 28 Sep 2011 08:58:02 +0200
Message-ID: <20110928065801.GA14126@elte.hu>
References: <20110926172348.be01ff9a1c16267ffd000d2a@canb.auug.org.au>
 <4E820138.90301@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4E820138.90301@xenotime.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Robert Richter <robert.richter@amd.com>, Andre Przywara <andre.przywara@amd.com>, Andrew Morton <akpm@linux-foundation.org>
List-Id: linux-next.vger.kernel.org


* Randy Dunlap <rdunlap@xenotime.net> wrote:

> From: Randy Dunlap <rdunlap@xenotime.net>
> 
> Fix build error by adding <asm/apicdef.h> header file:
> 
> arch/x86/kernel/cpu/perf_event_amd.c:350:2: error: 'BAD_APICID' undeclared (first use in this function)
> 
> Signed-off-by: Randy Dunlap <rdunlap@xenotime.net>
> ---
> 
> Found in linux-next and patch only applies cleanly to linux-next,
> but looks like mainline could use a similar patch (with more
> header files).
> 
>  arch/x86/kernel/cpu/perf_event_amd.c |    1 +
>  1 file changed, 1 insertion(+)

Applied to tip:perf/core, thanks Randy!

	Ingo
