From: David Brownell <david-b-yBeKhBN/0LDR7s880joybQ@public.gmane.org>
Subject: Re: [PATCH -next] gadget audio: select SND_PCM
Date: Fri, 3 Jul 2009 14:22:01 -0700
Message-ID: <200907031422.01426.david-b@pacbell.net>
References: <20090703162443.16495147.sfr@canb.auug.org.au> <20090703132657.3289cdcf.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20090703132657.3289cdcf.randy.dunlap-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Content-Disposition: inline
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Randy Dunlap <randy.dunlap-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, akpm <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, lud <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-next.vger.kernel.org

On Friday 03 July 2009, Randy Dunlap wrote:
> From: Randy Dunlap <randy.dunlap-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
> 
> Fix USB gadget audio: select SND_PCM, like many other sound
> drivers do, to fix build errors:
> 
> drivers/built-in.o: In function `f_audio_playback_work':
> audio.c:(.text+0x15a3e7): undefined reference to `snd_pcm_kernel_ioctl'
> audio.c:(.text+0x15a471): undefined reference to `snd_pcm_lib_write'
> drivers/built-in.o: In function `_snd_pcm_hw_param_set':
> audio.c:(.text+0x15aca7): undefined reference to `snd_interval_refine'
> drivers/built-in.o: In function `gaudio_setup':
> (.init.text+0x12adf): undefined reference to `_snd_pcm_hw_params_any'
> drivers/built-in.o: In function `gaudio_setup':
> (.init.text+0x12b43): undefined reference to `snd_pcm_kernel_ioctl'
> 
> Signed-off-by: Randy Dunlap <randy.dunlap-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>

Acked-by: David Brownell <dbrownell-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>


> ---
>  drivers/usb/gadget/Kconfig |    1 +
>  1 file changed, 1 insertion(+)
> 
> --- linux-next-20090703.orig/drivers/usb/gadget/Kconfig
> +++ linux-next-20090703/drivers/usb/gadget/Kconfig
> @@ -604,6 +604,7 @@ config USB_ZERO_HNPTEST
>  config USB_AUDIO
>  	tristate "Audio Gadget (EXPERIMENTAL)"
>  	depends on SND
> +	select SND_PCM
>  	help
>  	  Gadget Audio is compatible with USB Audio Class specification 1.0.
>  	  It will include at least one AudioControl interface, zero or more
> 
> 
> 
> 
> ---
> ~Randy
> LPC 2009, Sept. 23-25, Portland, Oregon
> http://linuxplumbersconf.org/2009/
> 
> 



--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
