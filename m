From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: [PATCH] Staging: VME: PIO2: Add GPIOLIB dependancy
Date: Mon, 12 Dec 2011 10:34:29 -0800
Message-ID: <4EE64935.2000608@xenotime.net>
References: <4EE638EA.6010909@xenotime.net> <20111212170301.26724.40502.stgit@ES-BJ21R4J>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20111212170301.26724.40502.stgit@ES-BJ21R4J>
Sender: linux-kernel-owner@vger.kernel.org
To: Martyn Welch <martyn.welch@ge.com>
Cc: gregkh@suse.de, devel@driverdev.osuosl.org, sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On 12/12/2011 09:04 AM, Martyn Welch wrote:
> The PIO2 driver errors when GPIOLIB, on which it depends, is not enabled.
> 
> Add dependancy when selecting the PIO2.
> 
> Reported-by: Randy Dunlap <rdunlap@xenotime.net>
> Signed-off-by: Martyn Welch <martyn.welch@ge.com>

Acked-by: Randy Dunlap <rdunlap@xenotime.net>

Thanks.

> ---
> 
> Sorry, missed the email on the 6th.
> 
>  drivers/staging/vme/devices/Kconfig |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> 
> diff --git a/drivers/staging/vme/devices/Kconfig b/drivers/staging/vme/devices/Kconfig
> index 8f5d286..55ec30c 100644
> --- a/drivers/staging/vme/devices/Kconfig
> +++ b/drivers/staging/vme/devices/Kconfig
> @@ -9,6 +9,7 @@ config VME_USER
>  
>  config VME_PIO2
>  	tristate "GE PIO2 VME"
> +	depends on GPIOLIB
>  	help
>  	  Say Y here to include support for the GE PIO2. The PIO2 is a 6U VME
>  	  slave card, implementing 32 solid-state relay switched IO lines, in
> 
> 
> --
> Martyn Welch (Principal Software Engineer)   |   Registered in England and
> GE Intelligent Platforms                     |   Wales (3828642) at 100
> T +44(0)127322748                            |   Barbirolli Square, Manchester,
> E martyn.welch@ge.com                        |   M2 3AB  VAT:GB 927559189


-- 
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
