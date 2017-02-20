From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [next-20170217] WARN @/arch/powerpc/include/asm/xics.h:124
 .icp_hv_eoi+0x40/0x140
Date: Mon, 20 Feb 2017 14:04:12 -0800 (PST)
Message-ID: <alpine.DEB.2.20.1702201402270.4208@nanos>
References: <E96217CD-2ADD-430D-86BD-27FF87752D7F@linux.vnet.ibm.com>  <87zihhh9mp.fsf@concordia.ellerman.id.au>  <15420F42-D2C6-4E29-8874-C47F4D61B098@linux.vnet.ibm.com>  <87mvdhgmhj.fsf@concordia.ellerman.id.au> <1487624024.23576.181.camel@au1.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from Galois.linutronix.de ([146.0.238.70]:37098 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750919AbdBTWEV (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 20 Feb 2017 17:04:21 -0500
In-Reply-To: <1487624024.23576.181.camel@au1.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Benjamin Herrenschmidt <benh@au1.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Sachin Sant <sachinp@linux.vnet.ibm.com>, linuxppc-dev@ozlabs.org, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Tue, 21 Feb 2017, Benjamin Herrenschmidt wrote:

> On Mon, 2017-02-20 at 21:55 +1100, Michael Ellerman wrote:
> > But when we're called for CONFIG_DEBUG_SHIRQ get_irq() is not called,
> > precisely because we're faking an interrupt.
> > 
> > I'm not sure if there's a good way to fix it :/
> 
> In the irq_replay path we have code to adjust the CPPR stack. We could
> do something similar.
> 
> HOWEVER. Looking at current upstream code I don't understand the error,
> the DEBUG_SHIRQ code is calling the driver's handler not the flow
> handler so it shouldn't be called handle_fasteoi_irq or am I missing
> something ?

I tried to invoke the normal handler path which also invokes the flow
handler, but that breaks on x86 as well for different reasons. I zapped
that commit and still need to find a way to do that debug thing proper. So
it's appearence in -next was only temporary.

Thanks,

	tglx
