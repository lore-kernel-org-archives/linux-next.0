From: Takashi Iwai <tiwai@suse.de>
Subject: Re: linux-next: sound build failure
Date: Wed, 21 May 2008 08:26:50 +0200
Message-ID: <20080521062650.GB9699@wotan.suse.de>
References: <20080521153212.f36796e2.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:60875 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759513AbYEUG0w (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 21 May 2008 02:26:52 -0400
Content-Disposition: inline
In-Reply-To: <20080521153212.f36796e2.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

On Wed, May 21, 2008 at 03:32:12PM +1000, Stephen Rothwell wrote:
> Hi Takashi,
> 
> Today's linux-next build (sparc64 defconfig) failed like this:
> 
> ERROR: "snd_ctl_make_virtual_master" [sound/pci/ac97/snd-ac97-codec.ko] undefined!
> ERROR: "snd_ctl_add_slave" [sound/pci/ac97/snd-ac97-codec.ko] undefined!
> 
> A "select SND_VMASTER" appears to have been lost from "config
> SND_AC97_CODEC" in commit 6a5751b42420dce9267d7d915eed8f8673d16fdd
> ("sound: Convert to menuconfig").
> 
> I applied the patch below.

Thanks, applied and pushed again.

Takashi

> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> http://www.canb.auug.org.au/~sfr/
> 
> >From b88eff22395ffdf10f37cd1c6f1b6adcd37417f6 Mon Sep 17 00:00:00 2001
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Wed, 21 May 2008 15:28:59 +1000
> Subject: [PATCH] sound: restore SND_VMASTER select to SND_AC97_CODEC
> 
> Otherwise the following error occurs:
> 
> ERROR: "snd_ctl_make_virtual_master" [sound/pci/ac97/snd-ac97-codec.ko] undefined!
> ERROR: "snd_ctl_add_slave" [sound/pci/ac97/snd-ac97-codec.ko] undefined!
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  sound/drivers/Kconfig |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/sound/drivers/Kconfig b/sound/drivers/Kconfig
> index 4bf44fb..255fd18 100644
> --- a/sound/drivers/Kconfig
> +++ b/sound/drivers/Kconfig
> @@ -21,6 +21,7 @@ config SND_AC97_CODEC
>  	tristate
>  	select SND_PCM
>  	select AC97_BUS
> +	select SND_VMASTER
>  
>  menuconfig SND_DRIVERS
>  	bool "Generic sound devices"
> -- 
> 1.5.5.1

-- 
--
Takashi Iwai <tiwai@suse.de>		ALSA Developer - www.alsa-project.org

