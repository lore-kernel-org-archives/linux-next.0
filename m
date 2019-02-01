From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: build failure after merge of the driver-core tree
Date: Fri, 1 Feb 2019 15:18:22 +0100
Message-ID: <20190201141822.GA30151@kroah.com>
References: <20190201134146.0bfd5ba0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190201134146.0bfd5ba0@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Richard Gong <richard.gong@intel.com>
List-Id: linux-next.vger.kernel.org

On Fri, Feb 01, 2019 at 01:41:46PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> After merging the driver-core tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> ERROR: "__arm_smccc_hvc" [drivers/firmware/stratix10-svc.ko] undefined!
> ERROR: "__arm_smccc_smc" [drivers/firmware/stratix10-svc.ko] undefined!
> 
> Exposed by commit
> 
>   095ff29d2b88 ("firmware: intel_stratix10_service: add hardware dependency")
> 
> I have added the following partial revert for today:
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Fri, 1 Feb 2019 13:37:59 +1100
> Subject: [PATCH] firmware: intel_stratix10_service: remove COMPILE_TEST
> 
> This does not build yet ...
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/firmware/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
> index 7e5491aed5c8..cac16c4b0df3 100644
> --- a/drivers/firmware/Kconfig
> +++ b/drivers/firmware/Kconfig
> @@ -218,7 +218,7 @@ config FW_CFG_SYSFS_CMDLINE
>  
>  config INTEL_STRATIX10_SERVICE
>  	tristate "Intel Stratix10 Service Layer"
> -	depends on (ARCH_STRATIX10 && HAVE_ARM_SMCCC) || COMPILE_TEST
> +	depends on ARCH_STRATIX10 && HAVE_ARM_SMCCC
>  	default n
>  	help
>  	  Intel Stratix10 service layer runs at privileged exception level,
> -- 
> 2.20.1
> 
> -- 
> Cheers,
> Stephen Rothwell


Thanks, I've added this to my tree now.

greg k-h
