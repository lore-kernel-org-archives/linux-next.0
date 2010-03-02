From: Maxim Levitsky <maximlevitsky@gmail.com>
Subject: Re: [PATCH -next] mtd/nand/r852: fix build for CONFIG_PM=n
Date: Tue, 02 Mar 2010 14:02:09 +0200
Message-ID: <1267531329.10734.1.camel@maxim-laptop>
References: <20100301210210.c6f465e6.sfr@canb.auug.org.au>
	 <4B8C378B.2090400@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-fx0-f219.google.com ([209.85.220.219]:61114 "EHLO
	mail-fx0-f219.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752123Ab0CBMCP (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 2 Mar 2010 07:02:15 -0500
In-Reply-To: <4B8C378B.2090400@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, "Rafael J. Wysocki" <rjw@sisk.pl>, David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org

On Mon, 2010-03-01 at 13:54 -0800, Randy Dunlap wrote: 
> From: Randy Dunlap <randy.dunlap@oracle.com>
> 
> Fix r852 build for the case of CONFIG_PM=n.
> 
> drivers/mtd/nand/r852.c:1039: error: implicit declaration of function 'pci_prepare_to_sleep'
> drivers/mtd/nand/r852.c:1048: error: implicit declaration of function 'pci_back_from_sleep'
> 
> This patch leaves r852_pm_ops untouched.
> 
> Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
> Cc: Maxim Levitsky <maximlevitsky@gmail.com>
> Cc: "Rafael J. Wysocki" <rjw@sisk.pl>
> Cc: David Woodhouse <dwmw2@infradead.org>
> ---
>  drivers/mtd/nand/r852.c |    5 +++++
>  1 file changed, 5 insertions(+)
> 
> --- linux-next-20100301.orig/drivers/mtd/nand/r852.c
> +++ linux-next-20100301/drivers/mtd/nand/r852.c
> @@ -1007,6 +1007,7 @@ void r852_shutdown(struct pci_dev *pci_d
>  	pci_disable_device(pci_dev);
>  }
>  
> +#ifdef CONFIG_PM
>  int r852_suspend(struct device *device)
>  {
>  	struct r852_device *dev = pci_get_drvdata(to_pci_dev(device));
> @@ -1081,6 +1082,10 @@ int r852_resume(struct device *device)
>  	r852_update_card_detect(dev);
>  	return 0;
>  }
> +#else
> +#define r852_suspend	NULL
> +#define r852_resume	NULL
> +#endif
>  
>  static const struct pci_device_id r852_pci_id_tbl[] = {
>  
> 
oops, I forgot about that case again..
Acked-by: Maxim Levitsky <maximlevitsky@gmail.com>

Best regards,
Maxim Levitsky
