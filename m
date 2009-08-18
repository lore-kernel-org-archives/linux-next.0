From: Samuel Ortiz <sameo@linux.intel.com>
Subject: Re: [PATCH -next] mfd: fix mc13783 build error
Date: Wed, 19 Aug 2009 01:46:29 +0200
Message-ID: <20090818234628.GC3378@sortiz.org>
References: <20090818184215.fdf1c7ae.sfr@canb.auug.org.au> <20090818152555.793773ad.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1752380AbZHRXoY@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20090818152555.793773ad.randy.dunlap@oracle.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, akpm <akpm@linux-foundation.org>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi Randy,

On Tue, Aug 18, 2009 at 03:25:55PM -0700, Randy Dunlap wrote:
> From: Randy Dunlap <randy.dunlap@oracle.com>
> 
> Fix build errors due to missing Kconfig dependency:
Thanks, should be fixed now.

Cheers,
Samuel.


> mc13783-core.c:(.text+0x11bbaf): undefined reference to `spi_sync'
> mc13783-core.c:(.init.text+0xb6b3): undefined reference to `spi_register_driver'
> mc13783-core.c:(.devinit.text+0x1fd8b): undefined reference to `spi_setup'
> drivers/built-in.o:(.data+0x157c0): undefined reference to `spi_bus_type'
> 
> Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
> ---
>  drivers/mfd/Kconfig |    1 +
>  1 file changed, 1 insertion(+)
> 
> --- linux-next-20090818.orig/drivers/mfd/Kconfig
> +++ linux-next-20090818/drivers/mfd/Kconfig
> @@ -240,6 +240,7 @@ config MFD_PCF50633
>  
>  config MFD_MC13783
>  	tristate "Support Freescale MC13783"
> +	depends on SPI_MASTER
>  	select MFD_CORE
>  	help
>  	  Support for the Freescale (Atlas) MC13783 PMIC and audio CODEC.
> 
> 
> 
> ---
> ~Randy
> LPC 2009, Sept. 23-25, Portland, Oregon
> http://linuxplumbersconf.org/2009/

-- 
Intel Open Source Technology Centre
http://oss.intel.com/
