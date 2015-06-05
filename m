From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the usb tree with the mips tree
Date: Fri, 5 Jun 2015 19:53:14 +0900
Message-ID: <20150605105314.GC5346@kroah.com>
References: <20150604183933.5f403cfd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150604183933.5f403cfd@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Ralf Baechle <ralf@linux-mips.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Bresticker <abrestic@chromium.org>, Brian Norris <computersforpeace@gmail.com>, Kishon Vijay Abraham I <kishon@ti.com>
List-Id: linux-next.vger.kernel.org

On Thu, Jun 04, 2015 at 06:39:33PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the usb tree got a conflict in
> drivers/phy/Makefile between commit d38dee131827 ("PHY: Add driver for
> Pistachio USB2.0 PHY") from the mips tree and commit 0d486806ffd0 ("phy:
> add Broadcom SATA3 PHY driver for Broadcom STB SoCs") from the usb tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).
> 
> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> 
> diff --cc drivers/phy/Makefile
> index 75a37dc952f5,bc92b427e5ca..000000000000
> --- a/drivers/phy/Makefile
> +++ b/drivers/phy/Makefile
> @@@ -40,4 -40,5 +40,6 @@@ obj-$(CONFIG_PHY_STIH41X_USB)		+= phy-s
>   obj-$(CONFIG_PHY_QCOM_UFS) 	+= phy-qcom-ufs.o
>   obj-$(CONFIG_PHY_QCOM_UFS) 	+= phy-qcom-ufs-qmp-20nm.o
>   obj-$(CONFIG_PHY_QCOM_UFS) 	+= phy-qcom-ufs-qmp-14nm.o
>  +obj-$(CONFIG_PHY_PISTACHIO_USB)		+= phy-pistachio-usb.o
> + obj-$(CONFIG_PHY_TUSB1210)		+= phy-tusb1210.o
> + obj-$(CONFIG_PHY_BRCMSTB_SATA)		+= phy-brcmstb-sata.o


Thanks, that looks correct to me.

greg k-h
