From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: linux-next: build failure after merge of the akpm tree
Date: Fri, 15 Jan 2016 15:14:01 -0800
Message-ID: <20160115151401.03fe1a39ca397079407c2ca9@linux-foundation.org>
References: <20151231232210.7ab890f1@canb.auug.org.au>
	<20160114151541.17e76d23@canb.auug.org.au>
	<20160115130527.c43357d0aef93d22380c6673@linux-foundation.org>
	<20160116100047.681e0e03@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:33287 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751076AbcAOXOD (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 15 Jan 2016 18:14:03 -0500
In-Reply-To: <20160116100047.681e0e03@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Vinod Koul <vinod.koul@linux.intel.com>, Takashi Iwai <tiwai@suse.de>, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

On Sat, 16 Jan 2016 10:00:47 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Andrew,
> > +#define SNDRV_COMPRESS_GET_CODEC_CAPS	_IOWR('C', 0x11, struct snd_compr_caps)
> >  #define SNDRV_COMPRESS_SET_PARAMS	_IOW('C', 0x12, struct snd_compr_params)
> >  #define SNDRV_COMPRESS_GET_PARAMS	_IOR('C', 0x13, struct snd_codec)
> >  #define SNDRV_COMPRESS_SET_METADATA	_IOW('C', 0x14,\
> > 
> > then it compiles OK.  So there's something special about `struct
> > snd_compr_codec_caps' which is confusing the compiler.
> 
> Its very big (hint, I think it is bigger than 1 << 13).

ah-hah.

sizeof(struct snd_compr_codec_caps) is 11144 on x86_64
allyesconfig, but x86_64 uses (1<<14), not (1<<13) - x86_64 has more
space in the ioctl payload.


So.  Sound guys: your struct snd_compr_codec_caps is too large for
powerpc ioctls.
