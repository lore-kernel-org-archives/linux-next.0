From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the akpm tree
Date: Sat, 16 Jan 2016 10:00:47 +1100
Message-ID: <20160116100047.681e0e03@canb.auug.org.au>
References: <20151231232210.7ab890f1@canb.auug.org.au>
	<20160114151541.17e76d23@canb.auug.org.au>
	<20160115130527.c43357d0aef93d22380c6673@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:37603 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750717AbcAOXAv (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 15 Jan 2016 18:00:51 -0500
In-Reply-To: <20160115130527.c43357d0aef93d22380c6673@linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Vinod Koul <vinod.koul@linux.intel.com>, Takashi Iwai <tiwai@suse.de>, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Hi Andrew,

On Fri, 15 Jan 2016 13:05:27 -0800 Andrew Morton <akpm@linux-foundation.org> wrote:
>
> On Thu, 14 Jan 2016 15:15:41 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> 
> > On Thu, 31 Dec 2015 23:22:10 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:  
> > >
> > > After merging the akpm tree, today's linux-next build (powerpc
> > > allyesconfig) failed like this:
> > > 
> > > sound/core/compress_offload.c: In function 'snd_compr_ioctl':
> > > /home/sfr/next/next/sound/core/compress_offload.c:804:2: error: case label does not reduce to an integer constant
> > >   case _IOC_NR(SNDRV_COMPRESS_GET_CODEC_CAPS):
> > >   ^
> > > 
> > > I have no idea what caused that and have just left it broken for now.  
> > 
> > I am still getting this.  Something in mmotm is causing or exposing this.  
> 
> I'm getting this as well.  If I do
> 
> --- a/include/uapi/sound/compress_offload.h~a
> +++ a/include/uapi/sound/compress_offload.h
> @@ -163,8 +163,7 @@ struct snd_compr_metadata {
>   */
>  #define SNDRV_COMPRESS_IOCTL_VERSION	_IOR('C', 0x00, int)
>  #define SNDRV_COMPRESS_GET_CAPS		_IOWR('C', 0x10, struct snd_compr_caps)
> -#define SNDRV_COMPRESS_GET_CODEC_CAPS	_IOWR('C', 0x11,\
> -						struct snd_compr_codec_caps)
> +#define SNDRV_COMPRESS_GET_CODEC_CAPS	_IOWR('C', 0x11, struct snd_compr_caps)
>  #define SNDRV_COMPRESS_SET_PARAMS	_IOW('C', 0x12, struct snd_compr_params)
>  #define SNDRV_COMPRESS_GET_PARAMS	_IOR('C', 0x13, struct snd_codec)
>  #define SNDRV_COMPRESS_SET_METADATA	_IOW('C', 0x14,\
> 
> then it compiles OK.  So there's something special about `struct
> snd_compr_codec_caps' which is confusing the compiler.

Its very big (hint, I think it is bigger than 1 << 13).

> Looking at the cpp output:
> 
>  case ((((((2U|4U) << (((0 +8)+8)+13)) | ((('C')) << (0 +8)) | (((0x10)) << 0) | (((((sizeof(struct snd_compr_caps) == sizeof(struct snd_compr_caps[1]) && sizeof(struct snd_compr_caps) < (1 << 13)) ? sizeof(struct snd_compr_caps) : __invalid_size_argument_for_IOC))) << ((0 +8)+8)))) >> 0) & ((1 << 8)-1)):
>   retval = snd_compr_get_caps(stream, arg);
>   break;
> 
> ^^ this is SNDRV_COMPRESS_GET_CAPS and it works OK
> 
>  case ((((((2U|4U) << (((0 +8)+8)+13)) | ((('C')) << (0 +8)) | (((0x11)) << 0) | (((((sizeof(struct snd_compr_codec_caps) == sizeof(struct snd_compr_codec_caps[1]) && sizeof(struct snd_compr_codec_caps) < (1 << 13)) ? sizeof(struct snd_compr_codec_caps) : __invalid_size_argument_for_IOC))) << ((0 +8)+8)))) >> 0) & ((1 << 8)-1)):
>   retval = snd_compr_get_codec_caps(stream, arg);
> 
> ^^ this is SNDRV_COMPRESS_GET_CODEC_CAPS and it fails
> 
> And they are identical apart from 0x10 vs 0x11 and the struct name.
> 
> It happens in vanilla linux-next as well, without the -mm patch pile.

Interesting ... what config.  I get this in my powerpc allyesconfig
builds but only after I have added your patches.  So I guess maybe some
kconfig has changed due to your patches that enable this driver to
build.

> Confused.

Me as well :-)

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
