From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: linux-next: manual merge of the rcu tree with the tip tree
Date: Tue, 21 Aug 2012 22:03:38 -0700
Message-ID: <20120822050338.GB2531@linux.vnet.ibm.com>
References: <20120822142722.1132127ef7d8a6214b7b2b32@canb.auug.org.au>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e39.co.us.ibm.com ([32.97.110.160]:37587 "EHLO
	e39.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756012Ab2HVFEN (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 22 Aug 2012 01:04:13 -0400
Received: from /spool/local
	by e39.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
	Tue, 21 Aug 2012 23:04:13 -0600
Content-Disposition: inline
In-Reply-To: <20120822142722.1132127ef7d8a6214b7b2b32@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>

On Wed, Aug 22, 2012 at 02:27:22PM +1000, Stephen Rothwell wrote:
> Hi Paul,
> 
> Today's linux-next merge of the rcu tree got a conflict in
> kernel/rcutree_plugin.h between commit 62ab7072476a ("rcu: Use
> smp_hotplug_thread facility for RCUs per-CPU kthread") from the tip tree
> and commit 8732d57a8ce0 ("rcu: Provide OOM handler to motivate lazy RCU
> callbacks") from the rcu tree.
> 
> Just context changes.  I fixed it up (see below) and can carry the fix as
> necessary.

The fix looks correct to me!

							Thanx, Paul

> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> 
> diff --cc kernel/rcutree_plugin.h
> index c1961ae,c3e3fc4..0000000
> --- a/kernel/rcutree_plugin.h
> +++ b/kernel/rcutree_plugin.h
> @@@ -25,7 -25,7 +25,8 @@@
>    */
>   
>   #include <linux/delay.h>
>  +#include <linux/smpboot.h>
> + #include <linux/oom.h>
>   
>   #define RCU_KTHREAD_PRIO 1
>   
