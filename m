From: Frederic Weisbecker <fweisbec@gmail.com>
Subject: Re: linux-next: manual merge of the tip tree with the rr tree
Date: Fri, 28 Sep 2012 14:39:40 +0200
Message-ID: <20120928123931.GA12843@somewhere.redhat.com>
References: <20120928133341.5697fbecc1674b2143101f52@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wi0-f170.google.com ([209.85.212.170]:43127 "EHLO
	mail-wi0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754836Ab2I1Mjo (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 28 Sep 2012 08:39:44 -0400
Content-Disposition: inline
In-Reply-To: <20120928133341.5697fbecc1674b2143101f52@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, David Howells <dhowells@redhat.com>, Rusty Russell <rusty@rustcorp.com.au>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>

On Fri, Sep 28, 2012 at 01:33:41PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the tip tree got a conflict in arch/Kconfig
> between commit 9a9d5786a5e7 ("Make most arch asm/module.h files use
> asm-generic/module.h") from the rr tree and commits fdf9c356502a
> ("cputime: Make finegrained irqtime accounting generally available") and
> 2b1d5024e17b ("rcu: Settle config for userspace extended quiescent
> state") from the tip tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Looks good. Thanks.
