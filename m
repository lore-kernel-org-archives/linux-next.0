From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: build failure after merge of the staging tree
Date: Sun, 30 Apr 2017 14:15:40 +0200
Message-ID: <20170430121540.GA24235@kroah.com>
References: <20170427142021.1ae68aa9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:60253 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1753434AbdD3M3F (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Sun, 30 Apr 2017 08:29:05 -0400
Content-Disposition: inline
In-Reply-To: <20170427142021.1ae68aa9@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Johannes Berg <johannes@sipsolutions.net>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, Arend Van Spriel <arend.vanspriel@broadcom.com>

On Thu, Apr 27, 2017 at 02:20:21PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> After merging the staging tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c: In function 'rtw_cfg80211_preinit_wiphy':
> drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:3409:18: error: 'WIPHY_FLAG_SUPPORTS_SCHED_SCAN' undeclared (first use in this function)
>   wiphy->flags |= WIPHY_FLAG_SUPPORTS_SCHED_SCAN;
>                   ^
> 
> Caused by commit
> 
>   554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
> 
> interacting with commit
> 
>   ca986ad9bcd3 ("nl80211: allow multiple active scheduled scan requests")
> 
> from the mac80211-next tree.
> 
> I applied the below merge fix patch.
> 
> Also, I noticed that CONFIG_PNO_SUPPORT is checked for in several
> files, but there is no such Kconfig option ...
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Thu, 27 Apr 2017 14:12:12 +1000
> Subject: [PATCH] staging: merge fix for "nl80211: allow multiple active
>  scheduled scan requests"
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> index f17f4fbd3396..c1977b11b6ac 100644
> --- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> +++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> @@ -3406,7 +3406,7 @@ static void rtw_cfg80211_preinit_wiphy(struct adapter *padapter, struct wiphy *w
>  	wiphy->flags |= WIPHY_FLAG_OFFCHAN_TX | WIPHY_FLAG_HAVE_AP_SME;
>  
>  #if defined(CONFIG_PM)
> -	wiphy->flags |= WIPHY_FLAG_SUPPORTS_SCHED_SCAN;
> +	wiphy->max_sched_scan_reqs = 1;
>  #ifdef CONFIG_PNO_SUPPORT
>  	wiphy->max_sched_scan_ssids = MAX_PNO_LIST_COUNT;
>  #endif

Thanks for the patch, looks good to me.

greg k-h
