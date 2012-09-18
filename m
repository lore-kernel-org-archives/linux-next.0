From: Michael Neuling <mikey@neuling.org>
Subject: Re: [PATCH V10] powerpc/fsl-pci: Unify pci/pcie initialization code
Date: Tue, 18 Sep 2012 19:56:14 +1000
Message-ID: <14502.1347962174@neuling.org>
References: <1346139848-28021-1-git-send-email-B38951@freescale.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:59744 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755086Ab2IRJ4R (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 18 Sep 2012 05:56:17 -0400
In-reply-to: <1346139848-28021-1-git-send-email-B38951@freescale.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jia Hongtao <B38951@freescale.com>
Cc: linuxppc-dev@lists.ozlabs.org, galak@kernel.crashing.org, B07421@freescale.com, benh@kernel.crashing.org, linux-next@vger.kernel.org

> +static int __devinit fsl_pci_probe(struct platform_device *pdev)
> +{
> +	int ret;
> +	struct device_node *node;
> +	struct pci_controller *hose;
> +
> +	node = pdev->dev.of_node;
> +	ret = fsl_add_bridge(node, fsl_pci_primary == node);
>  
>  #ifdef CONFIG_SWIOTLB
> -	/*
> -	 * if we couldn't map all of DRAM via the dma windows
> -	 * we need SWIOTLB to handle buffers located outside of
> -	 * dma capable memory region
> -	 */
> -	if (memblock_end_of_DRAM() - 1 > max)
> -		ppc_swiotlb_enable = 1;
> +	if (ret == 0) {
> +		hose = pci_find_hose_for_OF_device(pdev->dev.of_node);
> +
> +		/*
> +		 * if we couldn't map all of DRAM via the dma windows
> +		 * we need SWIOTLB to handle buffers located outside of
> +		 * dma capable memory region
> +		 */
> +		if (memblock_end_of_DRAM() - 1 > hose->dma_window_base_cur +
> +				hose->dma_window_size)
> +			ppc_swiotlb_enable = 1;
> +	}
>  #endif
> +
> +	mpc85xx_pci_err_probe(pdev);
> +
> +	return 0;
> +}

This breaks when CONFIG_SWIOTLB is disabled (chroma_defconfig hit this
next-20120918), but think this could also hit in Linus tree:

  arch/powerpc/sysdev/fsl_pci.c: In function 'fsl_pci_probe':
  arch/powerpc/sysdev/fsl_pci.c:867:25: error: unused variable 'hose' [-Werror=unused-variable]
  cc1: all warnings being treated as errors

Mikey
