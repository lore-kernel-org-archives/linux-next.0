From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: + softirq-fix-tasklet_kill-and-its-users.patch added to -mm
 tree
Date: Fri, 23 Sep 2016 09:37:51 +1000
Message-ID: <20160923093751.1b74c620@canb.auug.org.au>
References: <57e1b041.zRoBcsxStpPQoyeo%akpm@linux-foundation.org>
        <20160921051810.GA396@swordfish>
        <20160921080942.GA476@swordfish>
        <d072b085-2d07-066c-f1f7-7eab0a45273a@oracle.com>
        <20160922004204.GA701@swordfish>
        <36fffd08-17ec-0a73-17f3-378597e0c25a@oracle.com>
        <alpine.DEB.2.20.1609220854090.5599@nanos>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:38982 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753364AbcIVXhy (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 22 Sep 2016 19:37:54 -0400
In-Reply-To: <alpine.DEB.2.20.1609220854090.5599@nanos>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Santosh Shilimkar <santosh.shilimkar@oracle.com>, Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, ssantosh@kernel.org, David Miller <davem@davemloft.net>, giovanni.cabiddu@intel.com, gregkh@linuxfoundation.org, herbert@gondor.apana.org.au, isdn@linux-pingi.de, mingo@elte.hu, pebolle@tiscali.nl, Peter Zijlstra <peterz@infradead.org>, salvatore.benedetto@intel.com, tadeusz.struk@intel.com, mm-commits@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org, sergey.senozhatsky@gmail.com, Ingo Molnar <mingo@kernel.org>, Tony Lindgren <tony@atomide.com>

Hi Thomas,

On Thu, 22 Sep 2016 09:05:23 +0200 (CEST) Thomas Gleixner <tglx@linutronix.de> wrote:
>
> B1;2802;0cOn Wed, 21 Sep 2016, Santosh Shilimkar wrote:
> > I requested you to include this patch but now am not sure anymore.
> > Looks like there are almost 30 more users which are directly
> > tweaking 'tasklet_struct' fields and calling other APIs. Hunting them
> > and fixing them probably would be an exercise and also those changes
> > needs those changed drivers to be tested.
> > 
> > What do you suggest ? At least this patch needs to be dropped as of now
> > till we can have complete coverage for those bad users.  
> 
> Yes, it needs to be dropped. Stephen, can you please revert it from next?

I will do the revert today.  It reverts cleanly, so hopefully there are
no side effects.

-- 
Cheers,
Stephen Rothwell
