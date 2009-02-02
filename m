From: Yinghai Lu <yinghai@kernel.org>
Subject: Re: linux-next: build failure
Date: Mon, 02 Feb 2009 11:43:12 -0800
Message-ID: <49874CD0.4000104@kernel.org>
References: <20090202200254.b89614d8.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from hera.kernel.org ([140.211.167.34]:58517 "EHLO hera.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752956AbZBBTnn (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 2 Feb 2009 14:43:43 -0500
In-Reply-To: <20090202200254.b89614d8.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "David S. Miller" <davem@davemloft.net>, Ingo Molnar <mingo@elte.hu>, linux-next@vger.kernel.org

Stephen Rothwell wrote:
> Hi Dave, Ingo,
> 
> Today's linux-next build (sparc64 defconfig) failed like this:
> 
> arch/sparc/kernel/nmi.c: In function 'perfctr_irq':
> arch/sparc/kernel/nmi.c:97: error: 'struct kernel_stat' has no member named 'irqs'
> 
> Probably caused by commit e5553a6d04421eec326a629571d696e8e745a0e4
> ("sparc64: Implement NMI watchdog on capable cpus") from the
> sparc-current tree interacting with commit
> d7e51e66899f95dabc89b4d4c6674a6e50fa37fc ("sparseirq: make some func to
> be used with genirq") from the sparseirq tree.
> 
> I have temporarily applied the patch below.  I don't know if it is
> correct (but it fixes the build).  If it is, it should be applicable to
> the sparc-current tree as the needed interface exists in Linus' current
> tree.

that is right fix.

YH
