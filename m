From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: linux-next: manual merge of the staging tree with the tip tree
Date: Wed, 2 Mar 2016 08:54:39 +0100 (CET)
Message-ID: <alpine.DEB.2.11.1603020853460.3638@nanos>
References: <20160302143506.5f75d279@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from www.linutronix.de ([62.245.132.108]:49663 "EHLO
	Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751144AbcCBH4S (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 2 Mar 2016 02:56:18 -0500
In-Reply-To: <20160302143506.5f75d279@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "J. German Rivera" <German.Rivera@freescale.com>, Qais Yousef <qais.yousef@imgtec.com>

On Wed, 2 Mar 2016, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the staging tree got a conflict in:
> 
>   include/linux/irqdomain.h
> 
> between commit:
> 
>   29d5c8db26ad ("genirq: Add DOMAIN_BUS_IPI")
> 
> from the tip tree and commit:
> 
>   9b1b282ccd81 ("irqdomain: Added domain bus token DOMAIN_BUS_FSL_MC_MSI")
> 
> from the staging tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).
> 
> -- 
> Cheers,
> Stephen Rothwell
> 
> diff --cc include/linux/irqdomain.h
> index ed48594e96d2,0934d06c8b00..000000000000
> --- a/include/linux/irqdomain.h
> +++ b/include/linux/irqdomain.h
> @@@ -74,7 -74,7 +74,8 @@@ enum irq_domain_bus_token 
>   	DOMAIN_BUS_PCI_MSI,
>   	DOMAIN_BUS_PLATFORM_MSI,
>   	DOMAIN_BUS_NEXUS,
>  +	DOMAIN_BUS_IPI,
> + 	DOMAIN_BUS_FSL_MC_MSI,

Errm. What's that? Did that DOMAIN_BUS_FSL_MC_MSI thingy get any review of the
irq[domain] maintainers?

Thanks,

	tglx
