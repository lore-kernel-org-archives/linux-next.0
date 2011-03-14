From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: linux-next: build failure after merge of the final tree (powerpc
 tree related)
Date: Mon, 14 Mar 2011 22:17:56 +0100 (CET)
Message-ID: <alpine.LFD.2.00.1103142213081.2787@localhost6.localdomain6>
References: <20110314203827.4b61818e.sfr@canb.auug.org.au> <1300135074.22236.788.camel@pasglop> <20110314.135116.112600339.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from www.tglx.de ([62.245.132.106]:55989 "EHLO www.tglx.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755631Ab1CNVTL (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 14 Mar 2011 17:19:11 -0400
In-Reply-To: <20110314.135116.112600339.davem@davemloft.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, buytenh@secretlab.ca, grant.likely@secretlab.ca, Ingo Molnar <mingo@elte.hu>, Andrew Morton <akpm@linux-foundation.org>, Feng Tang <feng.tang@intel.com>, Alan Cox <alan@lxorguk.ukuu.org.uk>

On Mon, 14 Mar 2011, David Miller wrote:

> From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Date: Tue, 15 Mar 2011 07:37:54 +1100
> 
> > On Mon, 2011-03-14 at 20:38 +1100, Stephen Rothwell wrote:
> >> Hi all,
> >> 
> >> After merging the final tree, today's linux-next build (powerpc
> >> allyesconfig) failed like this:
> >> 
> >> drivers/gpio/langwell_gpio.c: In function 'lnw_irq_handler':
> >> drivers/gpio/langwell_gpio.c:210: error: 'struct irq_desc' has no member named 'chip'
> >> drivers/gpio/langwell_gpio.c:211: error: 'struct irq_desc' has no member named 'chip'
> >> 
> >> Caused by commit 17b9f9e2653a ("powerpc: Enable
> >> GENERIC_HARDIRQS_NO_DEPRECATED") enabling
> >> CONFIG_GENERIC_HARDIRQS_NO_DEPRECATED for powerpc without previously
> >> fixing up the above driver.
> >> 
> >> I have reverted that commit for today.
> > 
> > Except that the above driver has nothing to do with powerpc, it's some
> > Intel Moorestown stuff...
> > 
> > It should be fixed regardless I suppose, CC'ing Thomas.
> 
> I've had to make fixes to this driver in sparc64 allmodconfig builds
> too :-)

Sigh. Yes, this wants to depend on x86 in the first place.

But this is the second instance of blindly and mindlessly changing eoi
to irq_eoi w/o looking at the reason for this change.

Those patches should have been rejected based on their changelog in
the first place:

    Latest kernel has many changes in IRQ subsystem and its interfaces, like
    adding "irq_eoi" for struct irq_chip, this patch is a follow up change
    for that.

When noone beats me to fix that mess, I'll do it tomorrow morning.

Thanks,

	tglx
