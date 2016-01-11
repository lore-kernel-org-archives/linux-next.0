From: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: linux-next: build failure after merge of the pci tree
Date: Mon, 11 Jan 2016 00:34:49 -0600
Message-ID: <20160111063448.GA5393@localhost>
References: <20160111124222.4eb47c81@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:43090 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751615AbcAKGex (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 11 Jan 2016 01:34:53 -0500
Content-Disposition: inline
In-Reply-To: <20160111124222.4eb47c81@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Bjorn Helgaas <bhelgaas@google.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Stanimir Varbanov <svarbanov@mm-sol.com>, Stanimir Varbanov <stanimir.varbanov@linaro.org>

On Mon, Jan 11, 2016 at 12:42:22PM +1100, Stephen Rothwell wrote:
> Hi Bjorn,
> 
> After merging the pci tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
> 
> drivers/pci/host/pcie-designware.c: In function 'dw_pcie_host_init':
> drivers/pci/host/pcie-designware.c:554:7: error: implicit declaration of function 'pci_has_flag' [-Werror=implicit-function-declaration]
>   if (!pci_has_flag(PCI_PROBE_ONLY)) {
>        ^
> drivers/pci/host/pcie-designware.c:554:20: error: 'PCI_PROBE_ONLY' undeclared (first use in this function)
>   if (!pci_has_flag(PCI_PROBE_ONLY)) {
>                     ^
> 
> Caused by commit
> 
>   755007e88a5e ("PCI: qcom: Add Qualcomm PCIe controller driver")
> 
> Please only use CONFIG_COMPILE_TEST *after* testing for cross compile
> problems ...

My fault, sorry.  The build robot did catch this error, but I forgot
to check those results before merging pci/host-qcom.  I folded in your
patch.

> I have added thse folloeing patch for today:
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 11 Jan 2016 12:37:58 +1100
> Subject: [PATCH] PCI: qcom: the Qualcomm PCIe controller driver should not
>  depend on COMPILE_TEST
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/pci/host/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/host/Kconfig b/drivers/pci/host/Kconfig
> index de403b206391..75a605426538 100644
> --- a/drivers/pci/host/Kconfig
> +++ b/drivers/pci/host/Kconfig
> @@ -183,7 +183,7 @@ config PCI_HISI
>  
>  config PCIE_QCOM
>  	bool "Qualcomm PCIe controller"
> -	depends on ARCH_QCOM && OF || COMPILE_TEST
> +	depends on ARCH_QCOM && OF
>  	select PCIE_DW
>  	select PCIEPORTBUS
>  	help
> -- 
> 2.6.4
> 
> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
