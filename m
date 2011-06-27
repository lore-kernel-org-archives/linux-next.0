From: Randy Dunlap <randy.dunlap-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH -next] bluetooth: uses crypto interfaces, select CRYPTO
Date: Mon, 27 Jun 2011 11:03:08 -0700
Message-ID: <20110627110308.dc64e3a7.randy.dunlap@oracle.com>
References: <20110622163651.7ebc407c.sfr@canb.auug.org.au>
	<20110622100811.258091ff.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20110622100811.258091ff.randy.dunlap-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-bluetooth-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, Marcel Holtmann <marcel-kz+m5ild9QBg9hUCZPvPmw@public.gmane.org>, "Gustavo F. Padovan" <padovan-Y3ZbgMPKUGA34EUeqzHoZw@public.gmane.org>, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org
List-Id: linux-next.vger.kernel.org

On Wed, 22 Jun 2011 10:08:11 -0700 Randy Dunlap wrote:

> From: Randy Dunlap <randy.dunlap-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>

ping.  still need this patch in linux-next....


> Recent changes to hci_core.c use crypto interfaces, so select CRYPTO
> to make sure that those interfaces are present.
> 
> Fixes these build errors when CRYPTO is not enabled:
> 
> net/built-in.o: In function `hci_register_dev':
> (.text+0x4cf86): undefined reference to `crypto_alloc_base'
> net/built-in.o: In function `hci_unregister_dev':
> (.text+0x4f912): undefined reference to `crypto_destroy_tfm'
> 
> Signed-off-by: Randy Dunlap <randy.dunlap-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
> ---
>  net/bluetooth/Kconfig |    1 +
>  1 file changed, 1 insertion(+)
> 
> --- linux-next-20110622.orig/net/bluetooth/Kconfig
> +++ linux-next-20110622/net/bluetooth/Kconfig
> @@ -6,6 +6,7 @@ menuconfig BT
>  	tristate "Bluetooth subsystem support"
>  	depends on NET && !S390
>  	depends on RFKILL || !RFKILL
> +	select CRYPTO
>  	help
>  	  Bluetooth is low-cost, low-power, short-range wireless technology.
>  	  It was designed as a replacement for cables and other short-range
> --


---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
