From: Samuel Ortiz <sameo@linux.intel.com>
Subject: Re: [PATCH v7] MAX8997/8966 MFD: Add IRQ control feature
Date: Tue, 22 Mar 2011 12:51:35 +0100
Message-ID: <20110322115134.GF2351@sortiz-mobl>
References: <20110321135910.267f367f.sfr@canb.auug.org.au>
 <1300694904-29856-1-git-send-email-myungjoo.ham@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga14.intel.com ([143.182.124.37]:15554 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750757Ab1CVLvj (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 22 Mar 2011 07:51:39 -0400
Content-Disposition: inline
In-Reply-To: <1300694904-29856-1-git-send-email-myungjoo.ham@samsung.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: MyungJoo Ham <myungjoo.ham@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, Kyungmin Park <kyungmin.park@samsung.com>, myungjoo.ham@gmail.com

Hi MyungJoo,

On Mon, Mar 21, 2011 at 05:08:24PM +0900, MyungJoo Ham wrote:
> +static struct irq_chip max8997_irq_chip = {
> +	.name			= "max8997",
> +#ifdef CONFIG_GENERIC_HARDIRQS_NO_DEPRECATED
> +	.irq_bus_lock		= max8997_irq_lock,
> +	.irq_bus_sync_unlock	= max8997_irq_sync_unlock,
> +	.irq_mask		= max8997_irq_mask,
> +	.irq_unmask		= max8997_irq_unmask,
> +#else /* CONFIG_GENERIC_HARDIRQS_NO_DEPRECATED */
> +	.bus_lock		= max8997_irq_lock,
> +	.bus_sync_unlock	= max8997_irq_sync_unlock,
> +	.mask			= max8997_irq_mask,
> +	.unmask			= max8997_irq_unmask,
> +#endif /* CONFIG_GENERIC_HARDIRQS_NO_DEPRECATED */
> +};
You actually don't need to define both pointer sets. Setting the irq_* ones
should be enough for both configs.

Cheers,
Samuel.

-- 
Intel Open Source Technology Centre
http://oss.intel.com/
