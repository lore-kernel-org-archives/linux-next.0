From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: linux-next: manual merge of the kvm-arm tree with the tip tree
Date: Wed, 4 May 2016 08:58:26 +0100
Message-ID: <5729ABA2.5040403@arm.com>
References: <20160504134918.11edacf7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:43492 "EHLO foss.arm.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751478AbcEDH6e (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 4 May 2016 03:58:34 -0400
In-Reply-To: <20160504134918.11edacf7@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Christoffer Dall <cdall@cs.columbia.edu>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, Julien Grall <julien.grall@arm.com>

On 04/05/16 04:49, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the kvm-arm tree got a conflict in:
> 
>   drivers/irqchip/irq-gic-v3.c
> 
> between commit:
> 
>   e3825ba1af3a ("irqchip/gic-v3: Add support for partitioned PPIs")
> 
> from the tip tree and commit:
> 
>   1839e576968f ("irqchip/gic-v3: Parse and export virtual GIC information")
> 
> from the kvm-arm tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Looks good, thanks Stephen.

	M.
-- 
Jazz is not dead. It just smells funny...
