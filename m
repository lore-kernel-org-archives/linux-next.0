From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: linux-next: manual merge of the akpm tree with the tip tree
Date: Fri, 31 Mar 2017 08:42:28 +0200
Message-ID: <20170331064228.2u6x3s4yp6xolsbw@hirez.programming.kicks-ass.net>
References: <20170331164451.519d1d7e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:36253 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751527AbdCaGml (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 31 Mar 2017 02:42:41 -0400
Content-Disposition: inline
In-Reply-To: <20170331164451.519d1d7e@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andi Kleen <ak@linux.intel.com>

On Fri, Mar 31, 2017 at 04:44:51PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the akpm tree got a conflict in:
> 
>   kernel/sched/fair.c
> 
> between commit:
> 
>   0ccb977f4c80 ("sched/fair: Explicitly generate __update_load_avg() instances")
> 
> from the tip tree and patch:
> 
>    "kernel/sched/fair.c: uninline __update_load_avg()"
> 
> from the akpm tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Argh!

Andrew, please drop that patch. And the x86 out-of-line of __atomic_add_unless().
