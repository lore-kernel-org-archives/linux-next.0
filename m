From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: linux-next: manual merge of the tip tree with the powerpc tree
Date: Fri, 20 May 2011 15:38:24 +1000
Message-ID: <1305869904.7481.145.camel@pasglop>
References: <20110520141425.dd38cb7d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from gate.crashing.org ([63.228.1.57]:53052 "EHLO gate.crashing.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S935321Ab1ETFjB (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 20 May 2011 01:39:01 -0400
In-Reply-To: <20110520141425.dd38cb7d.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Milton Miller <miltonm@bga.com>, Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org

On Fri, 2011-05-20 at 14:14 +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the tip tree got a conflict in
> arch/powerpc/kernel/smp.c between commit 23d72bfd8f9f ("powerpc:
> Consolidate ipi message mux and demux") from the powerpc tree and commit
> 184748cc50b2 ("sched: Provide scheduler_ipi() callback in response to
> smp_send_reschedule()") from the tip tree.
> 
> The former superceded part of the latter's changes, so I just used the
> former for that.

I've done the merge and resolved the conflict properly (it's actually
non trivial due to some other changes) in the powerpc tree, I'll send a
pull request to Linus later today.

Cheers,
Ben.
