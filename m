From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: manual merge of the arm-soc tree with the usb tree
Date: Tue, 27 Nov 2012 08:37:48 +0000
Message-ID: <201211270837.48458.arnd@arndb.de>
References: <20121127155732.c3422fdbf62501ee134024d7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.10]:62166 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753549Ab2K0IiB (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 27 Nov 2012 03:38:01 -0500
In-Reply-To: <20121127155732.c3422fdbf62501ee134024d7@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, Bill Pemberton <wfp5p@virginia.edu>, Greg KH <greg@kroah.com>

On Tuesday 27 November 2012, Stephen Rothwell wrote:
> @@@ -167,7 -184,9 +170,9 @@@ ehci_orion_conf_mbus_windows(struct usb
>         }
>   }
>   
> + static u64 ehci_orion_dma_mask = DMA_BIT_MASK(32);
> + 
>  -static int __devinit ehci_orion_drv_probe(struct platform_device *pdev)
>  +static int ehci_orion_drv_probe(struct platform_device *pdev)
>   {
>         struct orion_ehci_data *pd = pdev->dev.platform_data;
>         const struct mbus_dram_target_info *dram;

Looks good, thanks!

	Arnd
