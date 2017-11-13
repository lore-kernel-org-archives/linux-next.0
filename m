From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the arm64 tree with Linus' tree
Date: Mon, 13 Nov 2017 17:09:53 +1100
Message-ID: <20171113170953.0cdda59d@canb.auug.org.au>
References: <20171101075723.20965225@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:46887 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751535AbdKMGJz (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 13 Nov 2017 01:09:55 -0500
In-Reply-To: <20171101075723.20965225@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>

Hi all,

On Wed, 1 Nov 2017 07:57:23 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> 
> Today's linux-next merge of the arm64 tree got a conflict in:
> 
>   drivers/acpi/arm64/iort.c
> 
> between commit:
> 
>   37f6b42e9c29 ("ACPI/IORT: Fix PCI ACS enablement")
> 
> from Linus' tree and commit:
> 
>   896dd2c32484 ("ACPI/IORT: Make platform devices initialization code SMMU agnostic")
> 
> from the arm64 tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> -- 
> Cheers,
> Stephen Rothwell
> 
> diff --cc drivers/acpi/arm64/iort.c
> index de56394dd161,7dc964f4d8f1..000000000000
> --- a/drivers/acpi/arm64/iort.c
> +++ b/drivers/acpi/arm64/iort.c
> @@@ -1215,7 -1326,7 +1357,8 @@@ static void __init iort_init_platform_d
>   	struct acpi_table_iort *iort;
>   	struct fwnode_handle *fwnode;
>   	int i, ret;
>  +	bool acs_enabled = false;
> + 	const struct iort_dev_config *ops;
>   
>   	/*
>   	 * iort_table and iort both point to the start of IORT table, but
> @@@ -1235,12 -1346,8 +1378,11 @@@
>   			return;
>   		}
>   
>  +		if (!acs_enabled)
>  +			acs_enabled = iort_enable_acs(iort_node);
>  +
> - 		if ((iort_node->type == ACPI_IORT_NODE_SMMU) ||
> - 			(iort_node->type == ACPI_IORT_NODE_SMMU_V3)) {
> - 
> + 		ops = iort_get_dev_cfg(iort_node);
> + 		if (ops) {
>   			fwnode = acpi_alloc_fwnode_static();
>   			if (!fwnode)
>   				return;

Just a reminder that this conflict still exists.

-- 
Cheers,
Stephen Rothwell
