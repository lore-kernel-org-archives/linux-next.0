From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: linux-next: build failure after merge of the final tree (net
 and tip tree related)
Date: Mon, 31 Jan 2011 09:02:49 +0100 (CET)
Message-ID: <alpine.LFD.2.00.1101310902330.31804@localhost6.localdomain6>
References: <20110131170123.9ee51a40.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from www.tglx.de ([62.245.132.106]:53576 "EHLO www.tglx.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751651Ab1AaID0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 31 Jan 2011 03:03:26 -0500
In-Reply-To: <20110131170123.9ee51a40.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Miller <davem@davemloft.net>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ben Hutchings <bhutchings@solarflare.com>, linux-net-drivers@solarflare.com, Tom Herbert <therbert@google.com>

On Mon, 31 Jan 2011, Stephen Rothwell wrote:

> Hi all,
> 
> After merging the final tree, today's linux-next build (sparc64 defconfig)
> failed like this:
> 
> kernel/irq/manage.c: In function 'irq_affinity_notify':
> kernel/irq/manage.c:182: error: 'struct irq_desc' has no member named 'affinity'
> 
> Caused by commit cd7eab44e9946c28d595abe3e9a43e945bc49141 ("genirq: Add
> IRQ affinity notifiers").  This build has
> CONFIG_GENERIC_HARDIRQS_NO_DEPRECATED=y.
> 
> I have just left it broken for today.

Queued a fix.

Thanks,

	tglx
