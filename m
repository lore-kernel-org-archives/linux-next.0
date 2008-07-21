From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: net-current tree build failure
Date: Sun, 20 Jul 2008 18:05:14 -0700 (PDT)
Message-ID: <20080720.180514.214251688.davem@davemloft.net>
References: <20080721105852.d49ec615.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:58497
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1755823AbYGUBFP (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Sun, 20 Jul 2008 21:05:15 -0400
In-Reply-To: <20080721105852.d49ec615.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: linux-next@vger.kernel.org

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 21 Jul 2008 10:58:52 +1000

> Hi Dave,
> 
> Today's linux-next build (powerpc ppc64_defconfig) failed like this:
> 
> net/built-in.o: In function `.dev_queue_xmit':
> (.text+0x125a4): undefined reference to `.qdisc_calculate_pkt_len'
> net/built-in.o: In function `.__qdisc_destroy':
> sch_generic.c:(.text+0x28710): undefined reference to `.qdisc_put_stab'
> 
> This config has CONFIG_NET_SCHED not set.
> 
> I applied the patch below, but it is probably not the correct solution.

No, it isn't.  We should just comment out the stab code
when NET_SCHED is not set.

Thanks for catching this.
