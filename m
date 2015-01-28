From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: Re: linux-next: build failure after merge of the sound-asoc tree
Date: Wed, 28 Jan 2015 09:09:35 +0000
Message-ID: <20150128090935.GH14516@opensource.wolfsonmicro.com>
References: <20150128130047.2311c637@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150128130047.2311c637@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: broonie@kernel.org
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Liam Girdwood <lgirdwood@gmail.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>
List-Id: linux-next.vger.kernel.org

On Wed, Jan 28, 2015 at 01:00:47PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the sound-asoc tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
> 
> sound/soc/codecs/arizona.c: In function 'arizona_out_ev':
> sound/soc/codecs/arizona.c:738:57: error: 'struct snd_soc_dapm_widget' has no member named 'codec'
>   struct arizona_priv *priv = snd_soc_codec_get_drvdata(w->codec);
>                                                          ^
> 
> Caused by commit 054e1b489227 ("ASoC: arizona: Add delay for output
> disable") interacting with commit 96da4e5b2e1d ("ASoC: Remove codec
> field from snd_soc_dapm_widget").  It needed to be fixed up in merge
> commit 7659e0ab1afa ("Merge remote-tracking branches
> 'asoc/topic/ad193x', 'asoc/topic/alc5632', 'asoc/topic/arizona' and
> 'asoc/topic/atmel' into asoc-next").
> 
> I have used the sound-asoc tree from next-20150127 for today.
> -- 

Very sorry guys my fault, not sure how that slipped through. Mark
do you want an incremental fix or shall I respin the two patches
in question?

Thanks,
Charles
