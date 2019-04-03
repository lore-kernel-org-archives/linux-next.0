From: Baolin Wang <baolin.wang@linaro.org>
Subject: Re: linux-next: build failure after merge of the sound-asoc tree
Date: Wed, 3 Apr 2019 12:27:53 +0800
Message-ID: <CAMz4kuLyAKwRLWu3+cfpDsLwCtJS21BN0xmL-DNxfmPYXC_tZA@mail.gmail.com>
References: <20190403111108.2ff4a309@canb.auug.org.au> <CAMz4ku+17HAZfh-03+y=WUy1NdsL7sQHK_XyzeToBh5-RAUSQg@mail.gmail.com>
 <20190403033518.GI2059@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190403033518.GI2059@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Liam Girdwood <lgirdwood@gmail.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Yintang Ren <yintang.ren@unisoc.com>
List-Id: linux-next.vger.kernel.org

On Wed, 3 Apr 2019 at 11:35, Mark Brown <broonie@kernel.org> wrote:
>
> On Wed, Apr 03, 2019 at 10:12:47AM +0800, Baolin Wang wrote:
>
> > snd-soc-sprd-platform-objs := sprd-pcm-dma.o sprd-pcm-compress.o
>
> > obj-$(CONFIG_SND_SOC_SPRD) += snd-soc-sprd-platform.o
>
> > I will send out one incremental patch to fix this issue after my
> > business trip. Thanks.
>
> We can't leave this broken in -next for that long, can you please post
> the patch now if you've already got it?

OK, but I need some time to setup my environment to send this patch
and I'll try to fix this ASAP. Thanks.

-- 
Baolin Wang
Best Regards
