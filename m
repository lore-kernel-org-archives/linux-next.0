From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: linux-next: build failure after merge of the sound-asoc tree
Date: Tue, 8 Nov 2016 11:18:29 +0800
Message-ID: <CAGb2v64S_YzHDOeRfHKRTrti8jZThuxfexRApjDAqzmJYR_N7Q@mail.gmail.com>
References: <20161108134723.3b4fc5d5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161108134723.3b4fc5d5@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, linux-next@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>, Chen-Yu Tsai <wens@csie.org>
List-Id: linux-next.vger.kernel.org

Hi,

On Tue, Nov 8, 2016 at 10:47 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> After merging the sound-asoc tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
>
> sound/soc/sunxi/sun4i-codec.c:1188:2: error: unknown field 'has_reset' specified in initializer
>   .has_reset = true,
>   ^
> sound/soc/sunxi/sun4i-codec.c:1188:15: warning: excess elements in struct initializer
>   .has_reset = true,
>                ^
> sound/soc/sunxi/sun4i-codec.c:1188:15: note: (near initialization for 'sun6i_a31_codec_quirks')
>
> Caused by commit
>
>   8d9e4c9e993f ("ASoC: sun4i-codec: Add support for A31 playback through headphone output")
>
> I have used the sound-asoc tree from next-20161028 for today.

sound-asoc is missing patch

    ASoC: sun4i-codec: Add support for optional reset control to quirks
    http://www.spinics.net/lists/alsa-devel/msg56289.html

which commit 8d9e4c9e993f ("ASoC: sun4i-codec: Add support for A31 playback
through headphone output") depends on. This was part of the same series that
I posted:

    http://www.spinics.net/lists/alsa-devel/msg56283.html

A new version of the remaining patches was posted yesterday:

    http://www.spinics.net/lists/alsa-devel/msg56443.html

The build failure should be resolved once Mark merges the remaining patches,
though some reordering might be needed to maintain bisectability.


Regards
ChenYu
