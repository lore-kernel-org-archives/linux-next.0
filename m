From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: [PATCH] linux-next: Tree for Dec 12 (staging/rtl8192e)
Date: Fri, 16 Dec 2011 10:57:19 -0800
Message-ID: <4EEB948F.9080605@xenotime.net>
References: <20111212161444.22a11535656c6bfbd884d9ec@canb.auug.org.au>	<4EE63A9C.1090503@xenotime.net>	<20111213233939.572235ff@opus.seanm.ca> <20111214201844.60cf5fe5@opus.seanm.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy5-pub.bluehost.com ([67.222.38.55]:57102 "HELO
	oproxy5-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1760315Ab1LPR5J (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 16 Dec 2011 12:57:09 -0500
In-Reply-To: <20111214201844.60cf5fe5@opus.seanm.ca>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sean MacLennan <seanm@seanm.ca>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On 12/14/2011 05:18 PM, Sean MacLennan wrote:
> The rtllib and rtllib_crypt drivers are both required for a fully
> functional rtllib. Make sure both are always available by having
> rtllib select rtllib_crypt.
> 
> Signed-off-by: Sean MacLennan <seanm@seanm.ca>

Reported-by: Randy Dunlap <rdunlap@xenotime.net>
Acked-by: Randy Dunlap <rdunlap@xenotime.net>

Thanks.


> ---
> This patch is against linux-next.
> 
>  drivers/staging/rtl8192e/Kconfig |   13 +++++--------
>  1 files changed, 5 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/staging/rtl8192e/Kconfig b/drivers/staging/rtl8192e/Kconfig
> index a24305d..878f384 100644
> --- a/drivers/staging/rtl8192e/Kconfig
> +++ b/drivers/staging/rtl8192e/Kconfig
> @@ -2,6 +2,7 @@ config RTLLIB
>  	tristate "Support for rtllib wireless devices"
>  	depends on WLAN && m
>  	default n
> +	select RTLLIB_CRYPTO
>  	---help---
>  	  If you have a wireless card that uses rtllib, say
>  	  Y. Currently the only card is the rtl8192e.
> @@ -12,16 +13,12 @@ if RTLLIB
>  
>  config RTLLIB_CRYPTO
>  	tristate "Support for rtllib crypto support"
> -	depends on RTLLIB
> -	default y
>  	---help---
> -	  CCMP crypto driver for rtllib.
> -
> -	  If you enabled RTLLIB, you want this.
> +	  Base crypto driver for rtllib.
>  
>  config RTLLIB_CRYPTO_CCMP
>  	tristate "Support for rtllib CCMP crypto"
> -	depends on RTLLIB && RTLLIB_CRYPTO
> +	depends on RTLLIB_CRYPTO
>  	default y
>  	---help---
>  	  CCMP crypto driver for rtllib.
> @@ -30,7 +27,7 @@ config RTLLIB_CRYPTO_CCMP
>  
>  config RTLLIB_CRYPTO_TKIP
>  	tristate "Support for rtllib TKIP crypto"
> -	depends on RTLLIB && RTLLIB_CRYPTO
> +	depends on RTLLIB_CRYPTO
>  	default y
>  	---help---
>  	  TKIP crypto driver for rtllib.
> @@ -39,7 +36,7 @@ config RTLLIB_CRYPTO_TKIP
>  
>  config RTLLIB_CRYPTO_WEP
>  	tristate "Support for rtllib WEP crypto"
> -	depends on RTLLIB && RTLLIB_CRYPTO
> +	depends on RTLLIB_CRYPTO
>  	default y
>  	---help---
>  	  TKIP crypto driver for rtllib.


-- 
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
