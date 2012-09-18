From: Jia Hongtao-B38951 <B38951@freescale.com>
Subject: RE: [PATCH V10] powerpc/fsl-pci: Unify pci/pcie initialization code
Date: Tue, 18 Sep 2012 10:34:48 +0000
Message-ID: <412C8208B4A0464FA894C5F0C278CD5D01AA9F50@039-SN1MPN1-002.039d.mgd.msft.net>
References: <1346139848-28021-1-git-send-email-B38951@freescale.com>
 <14502.1347962174@neuling.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ch1ehsobe004.messaging.microsoft.com ([216.32.181.184]:59161
	"EHLO ch1outboundpool.messaging.microsoft.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751619Ab2IRKew convert rfc822-to-8bit
	(ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 18 Sep 2012 06:34:52 -0400
In-Reply-To: <14502.1347962174@neuling.org>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Michael Neuling <mikey@neuling.org>
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "galak@kernel.crashing.org" <galak@kernel.crashing.org>, Wood Scott-B07421 <B07421@freescale.com>, "benh@kernel.crashing.org" <benh@kernel.crashing.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>



> -----Original Message-----
> From: Michael Neuling [mailto:mikey@neuling.org]
> Sent: Tuesday, September 18, 2012 5:56 PM
> To: Jia Hongtao-B38951
> Cc: linuxppc-dev@lists.ozlabs.org; galak@kernel.crashing.org; Wood Scott-
> B07421; benh@kernel.crashing.org; linux-next@vger.kernel.org
> Subject: Re: [PATCH V10] powerpc/fsl-pci: Unify pci/pcie initialization
> code
> 
> > +static int __devinit fsl_pci_probe(struct platform_device *pdev) {
> > +	int ret;
> > +	struct device_node *node;
> > +	struct pci_controller *hose;
> > +
> > +	node = pdev->dev.of_node;
> > +	ret = fsl_add_bridge(node, fsl_pci_primary == node);
> >
> >  #ifdef CONFIG_SWIOTLB
> > -	/*
> > -	 * if we couldn't map all of DRAM via the dma windows
> > -	 * we need SWIOTLB to handle buffers located outside of
> > -	 * dma capable memory region
> > -	 */
> > -	if (memblock_end_of_DRAM() - 1 > max)
> > -		ppc_swiotlb_enable = 1;
> > +	if (ret == 0) {
> > +		hose = pci_find_hose_for_OF_device(pdev->dev.of_node);
> > +
> > +		/*
> > +		 * if we couldn't map all of DRAM via the dma windows
> > +		 * we need SWIOTLB to handle buffers located outside of
> > +		 * dma capable memory region
> > +		 */
> > +		if (memblock_end_of_DRAM() - 1 > hose->dma_window_base_cur +
> > +				hose->dma_window_size)
> > +			ppc_swiotlb_enable = 1;
> > +	}
> >  #endif
> > +
> > +	mpc85xx_pci_err_probe(pdev);
> > +
> > +	return 0;
> > +}
> 
> This breaks when CONFIG_SWIOTLB is disabled (chroma_defconfig hit this
> next-20120918), but think this could also hit in Linus tree:
> 
>   arch/powerpc/sysdev/fsl_pci.c: In function 'fsl_pci_probe':
>   arch/powerpc/sysdev/fsl_pci.c:867:25: error: unused variable 'hose' [-
> Werror=unused-variable]
>   cc1: all warnings being treated as errors
> 
> Mikey

You are right, it's a problem.
I already send a patch to fix this.
Pls refer to http://patchwork.ozlabs.org/patch/184673/

Thanks for your response.

- Hongtao.
