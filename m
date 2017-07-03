From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the sound-asoc tree
Date: Mon, 3 Jul 2017 13:21:01 +1000
Message-ID: <20170703132101.72121ab0@canb.auug.org.au>
References: <20170629115400.3f52c9aa@canb.auug.org.au>
        <ABFD875FF5FB574BA706497D987D48D70267BA04@RTITMBSV02.realtek.com.tw>
        <20170630115135.2696f717@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:41265 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752152AbdGCDVE (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 2 Jul 2017 23:21:04 -0400
In-Reply-To: <20170630115135.2696f717@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Bard Liao <bardliao@realtek.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi all,

On Fri, 30 Jun 2017 11:51:35 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> On Thu, 29 Jun 2017 02:01:16 +0000 Bard Liao <bardliao@realtek.com> wrote:
> >  
> > > -----Original Message-----
> > > From: Stephen Rothwell [mailto:sfr@canb.auug.org.au]
> > > Sent: Thursday, June 29, 2017 9:54 AM
> > > To: Mark Brown; Liam Girdwood
> > > Cc: Linux-Next Mailing List; Linux Kernel Mailing List; Bard Liao
> > > Subject: linux-next: build failure after merge of the sound-asoc tree
> > > 
> > > Hi all,
> > > 
> > > After merging the sound-asoc tree, today's linux-next build (x86_64
> > > allmodconfig) failed like this:
> > > 
> > > sound/soc/codecs/rt5670.c: In function 'rt5670_set_codec_sysclk':
> > > sound/soc/codecs/rt5670.c:2448:57: error: 'codec' undeclared (first use in this
> > > function)
> > >   struct rt5670_priv *rt5670 = snd_soc_codec_get_drvdata(codec);
> > >                                                          ^
> > > sound/soc/codecs/rt5670.c:2448:57: note: each undeclared identifier is
> > > reported only once for each function it appears in
> > > sound/soc/codecs/rt5670.c: At top level:
> > > sound/soc/codecs/rt5670.c:2775:16: error: initialization from incompatible
> > > pointer type [-Werror=incompatible-pointer-types]
> > >   .set_sysclk = rt5670_set_codec_sysclk,
> > >                 ^
> > > sound/soc/codecs/rt5670.c:2775:16: note: (near initialization for
> > > 'soc_codec_dev_rt5670.set_sysclk')
> > > cc1: some warnings being treated as errors
> > > 
> > > Caused by commit
> > > 
> > >   6c28ce3c425e ("ASoC: rt5670: move set_sysclk to codec level")
> > > 
> > > I have used the sound-asoc tree from next-20170628 for today.    
> > 
> > Sorry about that. I just sent a patch to fix it. Please check the attached.  
> 
> I have applied your patch (attached) for today.
> 
> Mark, Liam, please apply.
> 
> Tested-by: Stephen Rothwell <sfr@canb.auug.org.au>

Ping?

-- 
Cheers,
Stephen Rothwell
