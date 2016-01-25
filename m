From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: Re: linux-next: build failure after merge of the akpm tree
Date: Mon, 25 Jan 2016 19:32:54 +0530
Message-ID: <20160125140254.GA952@sudip-pc>
References: <20160115151401.03fe1a39ca397079407c2ca9@linux-foundation.org>
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
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pa0-f54.google.com ([209.85.220.54]:36268 "EHLO
	mail-pa0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932175AbcAYODF (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 25 Jan 2016 09:03:05 -0500
Content-Disposition: inline
In-Reply-To: <s5hio2hai24.wl-tiwai@suse.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Mark Brown <broonie@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Vinod Koul <vinod.koul@intel.com>, Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

On Mon, Jan 25, 2016 at 02:45:55PM +0100, Takashi Iwai wrote:
> On Mon, 25 Jan 2016 14:10:37 +0100,
> Takashi Iwai wrote:
> > 
> > On Mon, 25 Jan 2016 12:41:50 +0100,
> > Mark Brown wrote:
> > > 
> > 
> > Signed-off-by: Takashi Iwai <tiwai@suse.de>
> > ---
> >  sound/core/compress_offload.c | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> > 
> > diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
> > index 18b8dc45bb8f..36b0083fd9f4 100644
> > --- a/sound/core/compress_offload.c
> > +++ b/sound/core/compress_offload.c
> > @@ -46,6 +46,13 @@
> >  #include <sound/compress_offload.h>
> >  #include <sound/compress_driver.h>
> >  
> > +/* FIXME: struct snd_compr_codec_caps overflows the ioctl bit size for some
> > + *        architectures, so we need to disable the relevant ioctls.
> > + */
> > +#if _IOC_SIZEBITS < 13
> 
> Argh, a typo here.  I forgot to refresh the patch, sorry.
> 
> Below is the revised one.

powerpc allmodconfig builds properly now.

Acked-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>

regards
sudip
