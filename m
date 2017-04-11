From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: build failure after merge of the staging tree
Date: Tue, 11 Apr 2017 07:15:42 +0200
Message-ID: <20170411051542.GB21419@kroah.com>
References: <20170411150440.0c7fc587@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:56860 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1753060AbdDKFQD (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 11 Apr 2017 01:16:03 -0400
Content-Disposition: inline
In-Reply-To: <20170411150440.0c7fc587@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>

On Tue, Apr 11, 2017 at 03:04:40PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> After merging the staging tree, today's linux-next build (powerpc
> allyesconfig - I presume that an x86_64 allyesconfig will fail the
> same way) failed like this:
> 
> drivers/staging/rtl8188eu/core/rtw_wlan_util.o: In function `.rtw_get_oper_ch':
> (.text+0x9d0): multiple definition of `.rtw_get_oper_ch'
> drivers/staging/rtl8723bs/core/rtw_wlan_util.o:(.text+0x9a0): first defined here
> 
> and many, many more ...
> 
> Presumably caused by commit
> 
>   554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
> 
> I guess this driver was copied from drivers/staging/rtl8188eu/ at some
> point and modified (or they have the same ancestor) since they share a
> large number of global symbols.
> 
> I have applied the following patch for today:
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Tue, 11 Apr 2017 14:53:55 +1000
> Subject: [PATCH] staging: disable the rtl8723bs sdio wifi driver for now
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/staging/rtl8723bs/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/staging/rtl8723bs/Kconfig b/drivers/staging/rtl8723bs/Kconfig
> index 71450eee3b28..04706d3148d6 100644
> --- a/drivers/staging/rtl8723bs/Kconfig
> +++ b/drivers/staging/rtl8723bs/Kconfig
> @@ -1,6 +1,7 @@
>  config RTL8723BS
>  	tristate "Realtek RTL8723BS SDIO Wireless LAN NIC driver"
>  	depends on WLAN && MMC && CFG80211
> +	depends on BROKEN
>  	select WIRELESS_EXT
>  	select WEXT_PRIV
>  	---help---

Yes, thanks, we are going to force this to be built as a module which
should resolve the issues...

thanks,

greg k-h
