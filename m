From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: linux-next: sparc tree build failure
Date: Fri, 27 Nov 2009 10:00:54 +0100 (CET)
Message-ID: <alpine.LFD.2.00.0911271000110.24119@localhost.localdomain>
References: <20091126201607.023e1269.sfr@canb.auug.org.au> <20091126.152816.233622295.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from www.tglx.de ([62.245.132.106]:59611 "EHLO www.tglx.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751002AbZK0JBL (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 27 Nov 2009 04:01:11 -0500
In-Reply-To: <20091126.152816.233622295.davem@davemloft.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, 26 Nov 2009, David Miller wrote:
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Thu, 26 Nov 2009 20:16:07 +1100
> 
> > Today's linux-next build (sparc32 defconfig) failed like this:
> > 
> > arch/sparc/lib/atomic32.c: In function '__atomic_add_return':
> > arch/sparc/lib/atomic32.c:34: error: implicit declaration of function '__raw_spin_lock_irqsave'
> > arch/sparc/lib/atomic32.c:38: error: implicit declaration of function '__raw_spin_unlock_irqrestore'
> > 
> > Caused by commit 4df286e52917c95c415400367cfd523dfbb0f93a ("sparc: Make
> > atomic locks raw") which I have reverted for today.
> 
> Ho hum, that's the second iteration and it broke the build first time
> too.
> 
> __raw_spin_lock_irqsave() definitions don't exist anywhere in the
> tree, I wonder what this was even build tested against?
> 
> I'm reverting, and I'll be hard pressed to add new versions without
> solid proof that it doesn't break the build a third time :-)

/me blushes. Dunno what went wrong this time. Sorry.

    tglx
