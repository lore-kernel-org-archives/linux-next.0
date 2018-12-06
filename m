From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the char-misc tree with the mmc tree
Date: Thu, 6 Dec 2018 06:42:24 +0100
Message-ID: <20181206054224.GA12239@kroah.com>
References: <20181206154800.760ff17a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181206154800.760ff17a@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Arnd Bergmann <arnd@arndb.de>, Ulf Hansson <ulf.hansson@linaro.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Oleksij Rempel <linux@rempel-privat.de>, Peng Hao <peng.hao2@zte.com.cn>
List-Id: linux-next.vger.kernel.org

On Thu, Dec 06, 2018 at 03:48:00PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the char-misc tree got a conflict in:
> 
>   drivers/misc/Makefile
> 
> between commit:
> 
>   4eb78924bf0e ("misc: cardreader: add new Alcor Micro Cardreader PCI driver")
> 
> from the mmc tree and commit:
> 
>   fcb418cd567f ("pvpanic: move pvpanic to misc as common driver")
> 
> from the char-misc tree.
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
> diff --cc drivers/misc/Makefile
> index fe3134cf3008,b76d611c87de..000000000000
> --- a/drivers/misc/Makefile
> +++ b/drivers/misc/Makefile
> @@@ -57,4 -57,5 +57,5 @@@ obj-$(CONFIG_ASPEED_LPC_CTRL)	+= aspeed
>   obj-$(CONFIG_ASPEED_LPC_SNOOP)	+= aspeed-lpc-snoop.o
>   obj-$(CONFIG_PCI_ENDPOINT_TEST)	+= pci_endpoint_test.o
>   obj-$(CONFIG_OCXL)		+= ocxl/
>  -obj-$(CONFIG_MISC_RTSX)		+= cardreader/
>  +obj-y		+= cardreader/
> + obj-$(CONFIG_PVPANIC)   	+= pvpanic.o

Looks good to me, thanks!

greg k-h
