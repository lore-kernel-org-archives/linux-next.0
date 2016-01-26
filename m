From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the akpm tree
Date: Wed, 27 Jan 2016 07:51:30 +1100
Message-ID: <20160127075130.1afbfc07@canb.auug.org.au>
References: <20160114151541.17e76d23@canb.auug.org.au>
	<20160115130527.c43357d0aef93d22380c6673@linux-foundation.org>
	<20160116100047.681e0e03@canb.auug.org.au>
	<20160115151401.03fe1a39ca397079407c2ca9@linux-foundation.org>
	<s5h4meductq.wl-tiwai@suse.de>
	<s5hmvs0uytw.wl-tiwai@suse.de>
	<20160121073859.3a6c22a3@canb.auug.org.au>
	<20160122112442.75c07aac@canb.auug.org.au>
	<20160122134045.438cd9d9@canb.auug.org.au>
	<s5h60yiatwt.wl-tiwai@suse.de>
	<20160125114150.GK6588@sirena.org.uk>
	<s5hmvrtajoy.wl-tiwai@suse.de>
	<s5hio2hai24.wl-tiwai@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:38024 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751193AbcAZUvc (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 26 Jan 2016 15:51:32 -0500
In-Reply-To: <s5hio2hai24.wl-tiwai@suse.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Mark Brown <broonie@kernel.org>, Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Vinod Koul <vinod.koul@intel.com>, Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Michael Ellerman <mpe@ellerman.id.au>

Hi Takashi,

On Mon, 25 Jan 2016 14:45:55 +0100 Takashi Iwai <tiwai@suse.de> wrote:
>
> From: Takashi Iwai <tiwai@suse.de>
> Subject: [PATCH v2] ALSA: compress: Disable GET_CODEC_CAPS ioctl for some
>  architectures
> 
> Some architectures like PowerPC can handle the maximum struct size in
> an ioctl only up to 13 bits, and struct snd_compr_codec_caps used by
> SNDRV_COMPRESS_GET_CODEC_CAPS ioctl overflows this limit.  This
> problem was revealed recently by a powerpc change, as it's now treated
> as a fatal build error.
> 
> This patch is a workaround for that: for architectures with less than
> 14 bit ioctl struct size, get rid of the handling of the relevant
> ioctl.  We should provide an alternative equivalent ioctl code later,
> but for now just paper over it.  Luckily, the compress API hasn't been
> used on such architectures, so the impact must be effectively zero.
> 
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  sound/core/compress_offload.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
> index 18b8dc45bb8f..0609e618107a 100644
> --- a/sound/core/compress_offload.c
> +++ b/sound/core/compress_offload.c
> @@ -46,6 +46,13 @@
>  #include <sound/compress_offload.h>
>  #include <sound/compress_driver.h>
>  
> +/* FIXME: struct snd_compr_codec_caps overflows the ioctl bit size for some
> + *        architectures, so we need to disable the relevant ioctls.
> + */
> +#if _IOC_SIZEBITS < 14
> +#define COMPR_CODEC_CAPS_OVERFLOW
> +#endif
> +
>  /* TODO:
>   * - add substream support for multiple devices in case of
>   *	SND_DYNAMIC_MINORS is not used
> @@ -440,6 +447,7 @@ out:
>  	return retval;
>  }
>  
> +#ifndef COMPR_CODEC_CAPS_OVERFLOW
>  static int
>  snd_compr_get_codec_caps(struct snd_compr_stream *stream, unsigned long arg)
>  {
> @@ -463,6 +471,7 @@ out:
>  	kfree(caps);
>  	return retval;
>  }
> +#endif /* !COMPR_CODEC_CAPS_OVERFLOW */
>  
>  /* revisit this with snd_pcm_preallocate_xxx */
>  static int snd_compr_allocate_buffer(struct snd_compr_stream *stream,
> @@ -801,9 +810,11 @@ static long snd_compr_ioctl(struct file *f, unsigned int cmd, unsigned long arg)
>  	case _IOC_NR(SNDRV_COMPRESS_GET_CAPS):
>  		retval = snd_compr_get_caps(stream, arg);
>  		break;
> +#ifndef COMPR_CODEC_CAPS_OVERFLOW
>  	case _IOC_NR(SNDRV_COMPRESS_GET_CODEC_CAPS):
>  		retval = snd_compr_get_codec_caps(stream, arg);
>  		break;
> +#endif
>  	case _IOC_NR(SNDRV_COMPRESS_SET_PARAMS):
>  		retval = snd_compr_set_params(stream, arg);
>  		break;
> -- 
> 2.7.0

I have replaced my other patch in my fixes tree until someone gets this
patch to Linus.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
