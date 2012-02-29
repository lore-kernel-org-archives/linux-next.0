From: Vincenzo Frascino <vincenzo.frascino@st.com>
Subject: Re: [PATCH] thermal: add missing HAS_IOMEM dependency for SPEAr13x
 thermal sensor driver
Date: Wed, 29 Feb 2012 15:17:14 +0100
Message-ID: <4F4E336A.8050602@st.com>
References: <1330519212-7046-1-git-send-email-heiko.carstens@de.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from eu1sys200aog111.obsmtp.com ([207.126.144.131]:54601 "EHLO
	eu1sys200aog111.obsmtp.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1757770Ab2B2OPJ (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 29 Feb 2012 09:15:09 -0500
In-Reply-To: <1330519212-7046-1-git-send-email-heiko.carstens@de.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Viresh KUMAR <viresh.kumar@st.com>

Thanks Heiko,

Il 29/02/2012 13:40, Heiko Carstens ha scritto:
> Fix this build error on s390:
>
> drivers/thermal/spear_thermal.c: In function 'thermal_get_temp':
> drivers/thermal/spear_thermal.c:49:2: error:
>    implicit declaration of function 'readl' [-Werror=implicit-function-declaration]
>
> Cc: Vincenzo Frascino <vincenzo.frascino@st.com>
> Cc: Viresh Kumar <viresh.kumar@st.com>
> Signed-off-by: Heiko Carstens <heiko.carstens@de.ibm.com>
> ---
>  drivers/thermal/Kconfig |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/drivers/thermal/Kconfig b/drivers/thermal/Kconfig
> index 2633fe0..06101a7 100644
> --- a/drivers/thermal/Kconfig
> +++ b/drivers/thermal/Kconfig
> @@ -21,7 +21,7 @@ config THERMAL_HWMON
>  
>  config SPEAR_THERMAL
>  	bool "SPEAr thermal sensor driver"
> -	depends on THERMAL
> +	depends on THERMAL && HAS_IOMEM
>  	help
>  	  Enable this to plug the SPEAr thermal sensor driver into the Linux
>  	  thermal framework
Reviewed-by: Vincenzo Frascino <vincenzo.frascino@st.com>
