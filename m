From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: linux-next: manual merge of the rcu tree with Linus' tree
Date: Thu, 29 Nov 2012 14:12:48 -0800
Message-ID: <20121129221248.GF2474@linux.vnet.ibm.com>
References: <20121129140651.33881363cc4870a87cf84adc@canb.auug.org.au>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e36.co.us.ibm.com ([32.97.110.154]:35076 "EHLO
	e36.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754609Ab2K2WM6 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 29 Nov 2012 17:12:58 -0500
Received: from /spool/local
	by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
	Thu, 29 Nov 2012 15:12:57 -0700
Content-Disposition: inline
In-Reply-To: <20121129140651.33881363cc4870a87cf84adc@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Frederic Weisbecker <fweisbec@gmail.com>, "H. Peter Anvin" <hpa@linux.intel.com>

On Thu, Nov 29, 2012 at 02:06:51PM +1100, Stephen Rothwell wrote:
> Hi Paul,
> 
> Today's linux-next merge of the rcu tree got a conflict in
> arch/x86/kernel/ptrace.c between commit cb57a2b4cff7 ("x86-32: Export
> kernel_stack_pointer() for modules") from Linus' tree and commit
> 98dbec158343 ("context_tracking: New context tracking susbsystem") from
> the rcu tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Looks good, thank you!

							Thanx, Paul

> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> 
> diff --cc arch/x86/kernel/ptrace.c
> index 974b67e,65b88a5..0000000
> --- a/arch/x86/kernel/ptrace.c
> +++ b/arch/x86/kernel/ptrace.c
> @@@ -21,8 -21,7 +21,8 @@@
>   #include <linux/signal.h>
>   #include <linux/perf_event.h>
>   #include <linux/hw_breakpoint.h>
> - #include <linux/rcupdate.h>
>  +#include <linux/module.h>
> + #include <linux/context_tracking.h>
>   
>   #include <asm/uaccess.h>
>   #include <asm/pgtable.h>
