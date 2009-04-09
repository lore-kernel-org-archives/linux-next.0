From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: sparc tree build failure
Date: Thu, 9 Apr 2009 07:27:17 +0200
Message-ID: <20090409052717.GF5352@elte.hu>
References: <20090409151722.c8eabb56.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:46942 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753241AbZDIF1n (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 9 Apr 2009 01:27:43 -0400
Content-Disposition: inline
In-Reply-To: <20090409151722.c8eabb56.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, "David S. Miller" <davem@davemloft.net>
Cc: Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, Darren Hart <dvhltc@us.ibm.com>


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> Today's linux-next build (sparc64 defconfig) failed like this:
> 
> arch/sparc/kernel/built-in.o: In function `trap_init':
> (.init.text+0x4): undefined reference to `thread_info_offsets_are_bolixed_dave'
> 
> Caused by commit 52400ba946759af28442dee6265c5c0180ac7122 ("futex: add
> requeue_pi functionality") (from the tip-core tree) which changed the
> size of struct restart_block.
> 
> Dave, this might be a good time to suggest that sparc64 create its TI_
> offsets automatically via asm-offsets ...
> 
> I applied the following patch for today.

David, would it be appropriate for us to queue up Stephen's fix in 
the futex tree, so that any rewrite can be decoupled from these 
changes and the Sparc tree would still work as well?

	Ingo
