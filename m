From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: sparc tree build failure
Date: Thu, 26 Nov 2009 15:28:16 -0800 (PST)
Message-ID: <20091126.152816.233622295.davem@davemloft.net>
References: <20091126201607.023e1269.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:47828
	"EHLO sunset.davemloft.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750919AbZKZX17 (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Thu, 26 Nov 2009 18:27:59 -0500
In-Reply-To: <20091126201607.023e1269.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, tglx@linutronix.de

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 26 Nov 2009 20:16:07 +1100

> Today's linux-next build (sparc32 defconfig) failed like this:
> 
> arch/sparc/lib/atomic32.c: In function '__atomic_add_return':
> arch/sparc/lib/atomic32.c:34: error: implicit declaration of function '__raw_spin_lock_irqsave'
> arch/sparc/lib/atomic32.c:38: error: implicit declaration of function '__raw_spin_unlock_irqrestore'
> 
> Caused by commit 4df286e52917c95c415400367cfd523dfbb0f93a ("sparc: Make
> atomic locks raw") which I have reverted for today.

Ho hum, that's the second iteration and it broke the build first time
too.

__raw_spin_lock_irqsave() definitions don't exist anywhere in the
tree, I wonder what this was even build tested against?

I'm reverting, and I'll be hard pressed to add new versions without
solid proof that it doesn't break the build a third time :-)
