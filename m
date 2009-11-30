From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: PATCH] staging: fix a silly typo
Date: Mon, 30 Nov 2009 09:10:30 -0800
Message-ID: <4B13FC86.2090902@oracle.com>
References: <20091130170943.4ebed093@lxorguk.ukuu.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet11.oracle.com ([148.87.113.123]:24937 "EHLO
	rgminet11.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752601AbZK3RKz (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 30 Nov 2009 12:10:55 -0500
In-Reply-To: <20091130170943.4ebed093@lxorguk.ukuu.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: linux-next@vger.kernel.org, greg@kroah.com

Alan Cox wrote:
> Can this either get applied or Rusty's tree dropped. This has been broken
> for ages now, and at the point something like "sizeof" spelled wrongly
> gets into a tree and doesn't get caught by the submitter or fixed for
> weeks when pointed out something is badly wrong
> 
> --
> staging: fix a silly typo
> 
> From: Alan Cox <alan@linux.intel.com>
> 
> Signed-off-by: Alan Cox <alan@linux.intel.com>
> ---
> 
>  drivers/staging/rtl8187se/r8180_core.c  |    2 +-
>  drivers/staging/rtl8192su/r8192U_core.c |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> 
> diff --git a/drivers/staging/rtl8187se/r8180_core.c b/drivers/staging/rtl8187se/r8180_core.c
> index 5a6cd60..d74bf70 100644
> --- a/drivers/staging/rtl8187se/r8180_core.c
> +++ b/drivers/staging/rtl8187se/r8180_core.c
> @@ -79,7 +79,7 @@ MODULE_AUTHOR("Andrea Merello <andreamrl@tiscali.it>");
>  MODULE_DESCRIPTION("Linux driver for Realtek RTL8180 / RTL8185 WiFi cards");
>  
>  
> -module_param_string(ifname, ifname, sizef(ifname), S_IRUGO|S_IWUSR);
> +module_param_string(ifname, ifname, sizeof(ifname), S_IRUGO|S_IWUSR);
>  module_param(hwseqnum,int, S_IRUGO|S_IWUSR);
>  module_param(hwwep,int, S_IRUGO|S_IWUSR);
>  module_param(channels,int, S_IRUGO|S_IWUSR);
> diff --git a/drivers/staging/rtl8192su/r8192U_core.c b/drivers/staging/rtl8192su/r8192U_core.c
> index e24815f..0a052ea 100644
> --- a/drivers/staging/rtl8192su/r8192U_core.c
> +++ b/drivers/staging/rtl8192su/r8192U_core.c
> @@ -142,7 +142,7 @@ static int channels = 0x3fff;
>  
>  
>  
> -module_param_string(ifname, ifname, sizef(ifname), S_IRUGO|S_IWUSR);
> +module_param_string(ifname, ifname, sizeof(ifname), S_IRUGO|S_IWUSR);
>  //module_param(hwseqnum,int, S_IRUGO|S_IWUSR);
>  module_param(hwwep,int, S_IRUGO|S_IWUSR);
>  module_param(channels,int, S_IRUGO|S_IWUSR);
> --

There is also a strcpt() that should be strcpy().

-- 
~Randy
