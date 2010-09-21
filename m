From: Greg KH <greg@kroah.com>
Subject: Re: [PATCH -next] staging: brcm80211 depends on MAC80211
Date: Tue, 21 Sep 2010 11:06:14 -0700
Message-ID: <20100921180614.GA24227@kroah.com>
References: <20100921170055.4512dd19.sfr@canb.auug.org.au>
 <20100921093549.a39a2a8d.randy.dunlap@oracle.com>
 <4C98EA0B.6050903@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4C98EA0B.6050903@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Henry Ptasinski <henryp@broadcom.com>
Cc: Randy Dunlap <randy.dunlap@oracle.com>, Stephen Rothwell <sfr@canb.auug.org.au>, driverdevel <devel@driverdev.osuosl.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, "gregkh@suse.de" <gregkh@suse.de>, Brett Rudley <brudley@broadcom.com>, Nohee Ko <noheek@broadcom.com>
List-Id: linux-next.vger.kernel.org

On Tue, Sep 21, 2010 at 10:23:23AM -0700, Henry Ptasinski wrote:
> On 09/21/2010 09:35 AM, Randy Dunlap wrote:
> >From: Randy Dunlap<randy.dunlap@oracle.com>
> >
> >Fix brcm890211 build: it should depend on MAC80211.
> >MAC80211 depends on CFG80211, which takes care of<regulatory_hint>
> >below.
> >
> >ERROR: "ieee80211_rx_irqsafe" [drivers/staging/brcm80211/brcm80211.ko] undefined!
> >ERROR: "ieee80211_unregister_hw" [drivers/staging/brcm80211/brcm80211.ko] undefined!
> >ERROR: "ieee80211_stop_queues" [drivers/staging/brcm80211/brcm80211.ko] undefined!
> >ERROR: "ieee80211_wake_queues" [drivers/staging/brcm80211/brcm80211.ko] undefined!
> >ERROR: "ieee80211_stop_tx_ba_cb_irqsafe" [drivers/staging/brcm80211/brcm80211.ko] undefined!
> >ERROR: "ieee80211_tx_status_irqsafe" [drivers/staging/brcm80211/brcm80211.ko] undefined!
> >ERROR: "ieee80211_register_hw" [drivers/staging/brcm80211/brcm80211.ko] undefined!
> >ERROR: "regulatory_hint" [drivers/staging/brcm80211/brcm80211.ko] undefined!
> >ERROR: "ieee80211_alloc_hw" [drivers/staging/brcm80211/brcm80211.ko] undefined!
> >ERROR: "ieee80211_free_hw" [drivers/staging/brcm80211/brcm80211.ko] undefined!
> >ERROR: "ieee80211_start_tx_ba_cb_irqsafe" [drivers/staging/brcm80211/brcm80211.ko] undefined!
> >
> >Signed-off-by: Randy Dunlap<randy.dunlap@oracle.com>
> >Cc: Brett Rudley<brudley@broadcom.com>
> >Cc: Henry Ptasinski<henryp@broadcom.com>
> >Cc: Nohee Ko<noheek@broadcom.com>
> >---
> >  drivers/staging/brcm80211/Kconfig |    2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> >--- linux-next-20100921.orig/drivers/staging/brcm80211/Kconfig
> >+++ linux-next-20100921/drivers/staging/brcm80211/Kconfig
> >@@ -1,6 +1,6 @@
> >  menuconfig BRCM80211
> >  	tristate "Broadcom 802.11 WLAN driver for bcm43xx chips"
> >-	depends on PCI&&  WLAN
> >+	depends on PCI&&  WLAN&&  MAC80211
> >  	select WIRELESS_EXT
> >  	select WEXT_PRIV
> >  	default N
> >
> 
> Actually, I think that should be something like:
> 
> diff --git a/drivers/staging/brcm80211/Kconfig
> b/drivers/staging/brcm80211/Kconf
> index 6b74685..228ec37 100644
> --- a/drivers/staging/brcm80211/Kconfig
> +++ b/drivers/staging/brcm80211/Kconfig
> @@ -1,6 +1,6 @@
>  menuconfig BRCM80211
>         tristate "Broadcom 802.11 WLAN driver for bcm43xx chips"
> -       depends on PCI && WLAN
> +       depends on WLAN
>         select WIRELESS_EXT
>         select WEXT_PRIV
>         default N
> @@ -9,6 +9,6 @@ menuconfig BRCM80211
> 
>  config BRCM80211_PCI
>         bool "Broadcom 802.11 WLAN NIC driver"
> -       depends on BRCM80211
> +       depends on BRCM80211 && PCI && MAC80211
>         default y
> 
> 
> Our fullmac sdio driver is going to use the brcm80211 framework, and
> it'll only need CFG80211.

Care to send this in a patch-format that I can apply it (i.e. proper
changelog entry, reported-by:, signed-off-by:, etc.)?

thanks,

greg k-h
