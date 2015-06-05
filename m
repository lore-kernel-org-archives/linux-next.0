From: Joerg Roedel <joro@8bytes.org>
Subject: Re: linux-next: manual merge of the tip tree with the iommu tree
Date: Fri, 5 Jun 2015 10:57:37 +0200
Message-ID: <20150605085737.GS20384@8bytes.org>
References: <20150605085030.17051140293@ozlabs.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 8bytes.org ([81.169.241.247]:56422 "EHLO theia.8bytes.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751748AbbFEI5k (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 5 Jun 2015 04:57:40 -0400
Content-Disposition: inline
In-Reply-To: <20150605085030.17051140293@ozlabs.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jiang Liu <jiang.liu@linux.intel.com>

Hi Michael,

On Fri, Jun 05, 2015 at 06:50:30PM +1000, Michael Ellerman wrote:
> diff --cc include/linux/intel-iommu.h
> index a81ceeeaa3d1,0af9b03e2b1c..000000000000
> --- a/include/linux/intel-iommu.h
> +++ b/include/linux/intel-iommu.h
> @@@ -355,9 -349,8 +357,11 @@@ struct intel_iommu 
>   
>   #ifdef CONFIG_IRQ_REMAP
>   	struct ir_table *ir_table;	/* Interrupt remapping info */
> + 	struct irq_domain *ir_domain;
> + 	struct irq_domain *ir_msi_domain;
>  +
>  +	/* whether interrupt remapping is enabled prior to OS*/
>  +	u8		pre_enabled_ir;
>   #endif
>   	struct device	*iommu_dev; /* IOMMU-sysfs device */
>   	int		node;

This solution looks correct, thanks for fixing.


	Joerg
