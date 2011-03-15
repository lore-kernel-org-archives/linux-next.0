From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: Re: linux-next: manual merge of the xen-two tree with the tip tree
Date: Tue, 15 Mar 2011 09:50:04 -0400
Message-ID: <20110315135004.GB3432@dumpdata.com>
References: <20110315172833.4fd17a0c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:47416 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757395Ab1CONu7 (ORCPT
	<rfc822;<linux-next@vger.kernel.org>>);
	Tue, 15 Mar 2011 09:50:59 -0400
Content-Disposition: inline
In-Reply-To: <20110315172833.4fd17a0c.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Ian Campbell <ian.campbell@citrix.com>

On Tue, Mar 15, 2011 at 05:28:33PM +1100, Stephen Rothwell wrote:
> Hi Konrad,
> 
> Today's linux-next merge of the xen-two tree got a conflict in
> arch/x86/pci/xen.c between commit 2c778651f73d ("x86: Cleanup the genirq
> name space") from the tip tree and commit bf480d952bcf ("xen: events:
> separate MSI PIRQ allocation from PIRQ binding to IRQ") from the xen-two
> tree.  Commit f420e010edd8 ("xen: events: push set_irq_msi down into
> xen_create_msi_irq") then moved the code modified by the tip tree commit
> into drivers/xen/events.c.
> 
> I fixed it up (I think - see below) and can carry the fix as necessary (I
> used the xen-two tree's version of arch/x86/pci/xen.c).

Looks good. Thank you for following the trail down the patch changes.


> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> 
> diff --git a/drivers/xen/events.c b/drivers/xen/events.c
> index 62e5237..934a3b1 100644
> --- a/drivers/xen/events.c
> +++ b/drivers/xen/events.c
> @@ -692,7 +692,7 @@ int xen_bind_pirq_msi_to_irq(struct pci_dev *dev, struct msi_desc *msidesc,
>  				      handle_level_irq, name);
>  
>  	xen_irq_info_pirq_init(irq, 0, pirq, 0, vector, 0);
> -	ret = set_irq_msi(irq, msidesc);
> +	ret = irq_set_msi_desc(irq, msidesc);
>  	if (ret < 0)
>  		goto error_irq;
>  out:
> -- 
> 1.7.4.1
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
