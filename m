From: Bard Liao <bardliao@realtek.com>
Subject: RE: linux-next: build failure after merge of the sound-asoc tree
Date: Thu, 12 Mar 2015 02:50:18 +0000
Message-ID: <ABFD875FF5FB574BA706497D987D48D701059B59@RTITMBSV03.realtek.com.tw>
References: <20150310130120.38bb6c55@canb.auug.org.au>
 <20150312131132.3f321cda@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rtits2.realtek.com ([60.250.210.242]:35455 "EHLO
	rtits2.realtek.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751095AbbCLCuj convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 11 Mar 2015 22:50:39 -0400
In-Reply-To: <20150312131132.3f321cda@canb.auug.org.au>
Content-Language: zh-TW
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

> -----Original Message-----
> From: Stephen Rothwell [mailto:sfr@canb.auug.org.au]
> Sent: Thursday, March 12, 2015 10:12 AM
> To: Mark Brown; Liam Girdwood
> Cc: linux-next@vger.kernel.org; linux-kernel@vger.kernel.org; Bard Liao
> Subject: Re: linux-next: build failure after merge of the sound-asoc tree
> 
> Hi all,
> 
> On Tue, 10 Mar 2015 13:01:20 +1100 Stephen Rothwell
> <sfr@canb.auug.org.au> wrote:
> >
> > After merging the sound-asoc tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> >
> > sound/soc/codecs/rt5670.c: In function 'is_sys_clk_from_pll':
> > sound/soc/codecs/rt5670.c:519:38: error: 'struct snd_soc_dapm_widget'
> has no member named 'codec'
> >   struct snd_soc_codec *codec = source->codec;
> >                                       ^
> >

Hi

Please apply Lars-Peter's "ASoC: rt5670: Replace w->codec
snd_soc_dapm_to_codec(w->dapm)" patch
http://mailman.alsa-project.org/pipermail/alsa-devel/2015-January/086618.html

Thanks.

> > Caused by commit 485372dc24ca ("ASoC: rt5670: Check sysclk source by
> > private data")?
> 
> Still getting this.
> 
> > sound/soc/codecs/rt5670.c: In function 'rt5670_set_dai_sysclk':
> > sound/soc/codecs/rt5670.c:2272:1: error: expected expression before
> > '<<' token  <<<<<<< HEAD  ^
> > sound/soc/codecs/rt5670.c:2284:1: error: expected expression before
> > '>>' token  >>>>>>> v4.0-rc3  ^
> >
> > Oops :-(
> 
> This has been fixed.
> 
> --
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> 
> ------Please consider the environment before printing this e-mail.
