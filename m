From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: Re: linux-next: manual merge of the arm64 tree with Linus' tree
Date: Thu, 19 Oct 2017 13:50:05 +0100
Message-ID: <20171019125005.GA18883@red-moon>
References: <20171019112833.2h5ah7tidjnkvo7o@sirena.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:52912 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753021AbdJSMuF (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 19 Oct 2017 08:50:05 -0400
Content-Disposition: inline
In-Reply-To: <20171019112833.2h5ah7tidjnkvo7o@sirena.co.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Hanjun Guo <hanjun.guo@linaro.org>, Robin Murphy <robin.murphy@arm.com>, Nate Watterson <nwatters@codeaurora.org>, linux-arm-kernel@lists.infradead.org, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, will.deacon@arm.com

[+Will]

On Thu, Oct 19, 2017 at 12:28:33PM +0100, Mark Brown wrote:
> Hi Catalin,
> 
> Today's linux-next merge of the arm64 tree got a conflict in:
> 
>   drivers/acpi/arm64/iort.c
> 
> between commit:
> 
>   37f6b42e9c296 ("ACPI/IORT: Fix PCI ACS enablement")
> 
> from Linus' tree and commit:
> 
>   896dd2c324842 ("ACPI/IORT: Make platform devices initialization code SMMU agnostic")
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

Hi Mark,

it is expected and that's the right conflict resolution:

https://marc.info/?l=linux-arm-kernel&m=150817031118241&w=2

Thank you,
Lorenzo
