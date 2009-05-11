From: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
Subject: Re: [PATCH -next] soc_camera: depends on I2C
Date: Mon, 11 May 2009 19:53:50 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.0905111953300.5399@axis700.grange>
References: <20090511161442.3e9d9cb9.sfr@canb.auug.org.au> <4A0853FE.6060709@oracle.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1756794AbZEKRxz@vger.kernel.org>
In-Reply-To: <4A0853FE.6060709@oracle.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Linux Media Mailing List <linux-media@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@infradead.org>
List-Id: linux-next.vger.kernel.org

On Mon, 11 May 2009, Randy Dunlap wrote:

> From: Randy Dunlap <randy.dunlap@oracle.com>
> 
> soc_camera uses i2c_*() functions and has build errors when CONFIG_I2C=n:
> 
> ERROR: "i2c_new_device" [drivers/media/video/soc_camera.ko] undefined!
> ERROR: "i2c_get_adapter" [drivers/media/video/soc_camera.ko] undefined!
> ERROR: "i2c_put_adapter" [drivers/media/video/soc_camera.ko] undefined!
> ERROR: "i2c_unregister_device" [drivers/media/video/soc_camera.ko] undefined!
> 
> Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>

Thanks, applied.

Guennadi

> ---
>  drivers/media/video/Kconfig |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> --- linux-next-20090511.orig/drivers/media/video/Kconfig
> +++ linux-next-20090511/drivers/media/video/Kconfig
> @@ -694,7 +694,7 @@ config VIDEO_CAFE_CCIC
>  
>  config SOC_CAMERA
>  	tristate "SoC camera support"
> -	depends on VIDEO_V4L2 && HAS_DMA
> +	depends on VIDEO_V4L2 && HAS_DMA && I2C
>  	select VIDEOBUF_GEN
>  	help
>  	  SoC Camera is a common API to several cameras, not connecting
> 
> 
> -- 
> ~Randy
> LPC 2009, Sept. 23-25, Portland, Oregon
> http://linuxplumbersconf.org/2009/
> 

---
Guennadi Liakhovetski, Ph.D.
Freelance Open-Source Software Developer
http://www.open-technology.de/
