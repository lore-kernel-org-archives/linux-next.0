From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the usb tree with the usb.current
 tree
Date: Sun, 1 Jul 2018 10:43:43 +0200
Message-ID: <20180701084343.GA12939@kroah.com>
References: <20180629145719.0d7b8fe7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180629145719.0d7b8fe7@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Randy Dunlap <rdunlap@infradead.org>, Li Jun <jun.li@nxp.com>
List-Id: linux-next.vger.kernel.org

On Fri, Jun 29, 2018 at 02:57:19PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the usb tree got a conflict in:
> 
>   drivers/staging/typec/Kconfig
> 
> between commit:
> 
>   e16711c32bca ("staging/typec: fix tcpci_rt1711h build errors")
> 
> from the usb.current tree and commit:
> 
>   990da41530b3 ("staging: typec: tcpci: move tcpci drivers out of staging")
> 
> from the usb tree.
> 
> I fixed it up (I removed the file and allpied the patch below) and can
> carry the fix as necessary. This is now fixed as far as linux-next is
> concerned, but any non trivial conflicts should be mentioned to your
> upstream maintainer when your tree is submitted for merging.  You may
> also want to consider cooperating with the maintainer of the conflicting
> tree to minimise any particularly complex conflicts.
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Fri, 29 Jun 2018 14:54:04 +1000
> Subject: [PATCH] usb: update for tcpci drivers moving out of staging
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/usb/typec/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/typec/Kconfig b/drivers/usb/typec/Kconfig
> index 972fd1911045..ee808903983f 100644
> --- a/drivers/usb/typec/Kconfig
> +++ b/drivers/usb/typec/Kconfig
> @@ -65,6 +65,7 @@ config TYPEC_TCPCI
>  
>  config TYPEC_RT1711H
>  	tristate "Richtek RT1711H Type-C chip driver"
> +	depends on I2C

Thanks for this, I'll apply this to my tree when I merge these together
in a few days.

greg k-h
