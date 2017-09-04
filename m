From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the usb tree with the mips tree
Date: Mon, 4 Sep 2017 11:17:23 +0200
Message-ID: <20170904091723.GA13245@kroah.com>
References: <20170904155132.007b788b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170904155132.007b788b@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Ralf Baechle <ralf@linux-mips.org>, James Hogan <james.hogan@imgtec.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Hauke Mehrtens <hauke@hauke-m.de>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Kishon Vijay Abraham I <kishon@ti.com>
List-Id: linux-next.vger.kernel.org

On Mon, Sep 04, 2017 at 03:51:32PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the usb tree got a conflict in:
> 
>   drivers/phy/Makefile
> 
> between commit:
> 
>   0ab3aa747f26 ("phy: Add an USB PHY driver for the Lantiq SoCs using the RCU module")
> 
> from the mips tree and commit:
> 
>   cd4ec4b03dc1 ("phy: phy-mt65xx-usb3: add mediatek directory and rename file")
> 
> from the usb tree.
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
> diff --cc drivers/phy/Makefile
> index a8b9439a5d8e,06f3c500030d..000000000000
> --- a/drivers/phy/Makefile
> +++ b/drivers/phy/Makefile
> @@@ -4,12 -4,12 +4,12 @@@
>   
>   obj-$(CONFIG_GENERIC_PHY)		+= phy-core.o
>   obj-$(CONFIG_PHY_LPC18XX_USB_OTG)	+= phy-lpc18xx-usb-otg.o
> - obj-$(CONFIG_PHY_MT65XX_USB3)		+= phy-mt65xx-usb3.o
>   obj-$(CONFIG_PHY_XGENE)			+= phy-xgene.o
>   obj-$(CONFIG_PHY_PISTACHIO_USB)		+= phy-pistachio-usb.o
>  -
>   obj-$(CONFIG_ARCH_SUNXI)		+= allwinner/
>   obj-$(CONFIG_ARCH_MESON)		+= amlogic/
>  +obj-$(CONFIG_LANTIQ)			+= lantiq/
> + obj-$(CONFIG_ARCH_MEDIATEK)		+= mediatek/
>   obj-$(CONFIG_ARCH_RENESAS)		+= renesas/
>   obj-$(CONFIG_ARCH_ROCKCHIP)		+= rockchip/
>   obj-$(CONFIG_ARCH_TEGRA)		+= tegra/


Looks good to me, thanks!

greg k-h
