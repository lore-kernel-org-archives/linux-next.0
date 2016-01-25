From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: Re: linux-next: build failure after merge of the akpm tree
Date: Mon, 25 Jan 2016 16:48:06 +0530
Message-ID: <20160125111806.GA21907@sudip-pc>
References: <20160116100047.681e0e03@canb.auug.org.au>
 <20160115151401.03fe1a39ca397079407c2ca9@linux-foundation.org>
 <s5h4meductq.wl-tiwai@suse.de>
 <s5hmvs0uytw.wl-tiwai@suse.de>
 <20160121073859.3a6c22a3@canb.auug.org.au>
 <20160122112442.75c07aac@canb.auug.org.au>
 <20160122134045.438cd9d9@canb.auug.org.au>
 <s5h60yiatwt.wl-tiwai@suse.de>
 <20160125104555.GA16749@sudip-pc>
 <s5hsi1lapk5.wl-tiwai@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pf0-f182.google.com ([209.85.192.182]:36476 "EHLO
	mail-pf0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756057AbcAYLSZ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 25 Jan 2016 06:18:25 -0500
Content-Disposition: inline
In-Reply-To: <s5hsi1lapk5.wl-tiwai@suse.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Mark Brown <broonie@kernel.org>, Vinod Koul <vinod.koul@intel.com>, Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

On Mon, Jan 25, 2016 at 12:03:54PM +0100, Takashi Iwai wrote:
> On Mon, 25 Jan 2016 11:45:56 +0100,
> Sudip Mukherjee wrote:
> > 
> > On Mon, Jan 25, 2016 at 10:29:54AM +0100, Takashi Iwai wrote:
> > > On Fri, 22 Jan 2016 03:40:45 +0100,
> > > Stephen Rothwell wrote:
> > > > 
> > > > Hi all,
> > > > 
<snip>
> > > > 
> > > > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > > > Date: Fri, 22 Jan 2016 13:24:57 +1100
> > > > Subject: [PATCH] next: suppress the building of all the sound codecs on PPC
> > > >  for now
> > > > 
> > > > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > > > ---
> > > >  sound/soc/codecs/Kconfig | 1 +
> > > >  1 file changed, 1 insertion(+)
> > > > 
> > > > diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
> > > > index 50693c867e71..ee5f36b9c787 100644
> > > > --- a/sound/soc/codecs/Kconfig
> > > > +++ b/sound/soc/codecs/Kconfig
> > > > @@ -13,6 +13,7 @@ menu "CODEC drivers"
> > > >  config SND_SOC_ALL_CODECS
> > > >  	tristate "Build all ASoC CODEC drivers"
> > > >  	depends on COMPILE_TEST
> > > > +	depends on !PPC
> > > >  	select SND_SOC_88PM860X if MFD_88PM860X
> > > >  	select SND_SOC_L3
> > > >  	select SND_SOC_AB8500_CODEC if ABX500_CORE
> > > 
> > > Suppressing this whole is an overreaction, IMO.  It should suffice
> > > just to disable compile-testing Intel driver.
> > > How about the patch below?
> > > 
> > > 
> > > thanks,
> > > 
> > > Takashi
> > > 
> > > -- 8< --
> > > From: Takashi Iwai <tiwai@suse.de>
> > > Subject: [PATCH] ASoC: intel: suppress compile-test with PowerPC
> > > 
> > > Since some ioctl in compress offload API is broken for PPC (the struct
> > > size overflows), now we get actually the build error.
> > > 
> > > Until we get the proper solution (e.g. alternative ioctl), let's
> > > disable the build of Intel ASoC driver that is the only driver who
> > > enables SND_SOC_COMPRESS (and eventually SND_COMPRESS_OFFLOAD) in the
> > > mainline tree.
> > 
> > Sorry, but this does not fix the build failure.
> > I can still see SND_COMPRESS_OFFLOAD=m in .config and the build fails.
> 
> Who sets this config?  SND_COMPRESS_OFFLOAD has no prompt, so this
> should be default off.

I think when we are doing allmodconfig SND_SOC_COMPRESS will be selected
which in turn will select SND_COMPRESS_OFFLOAD as SND_SOC_COMPRESS
depends only on SND_SOC.

And alpha is not affected. It builds fine.

regards
sudip
