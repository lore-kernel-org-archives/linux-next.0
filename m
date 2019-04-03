From: Baolin Wang <baolin.wang@linaro.org>
Subject: Re: linux-next: build failure after merge of the sound-asoc tree
Date: Wed, 3 Apr 2019 10:12:47 +0800
Message-ID: <CAMz4ku+17HAZfh-03+y=WUy1NdsL7sQHK_XyzeToBh5-RAUSQg@mail.gmail.com>
References: <20190403111108.2ff4a309@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190403111108.2ff4a309@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Yintang Ren <yintang.ren@unisoc.com>
List-Id: linux-next.vger.kernel.org

Hi,

On Wed, 3 Apr 2019 at 08:11, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the sound-asoc tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> ERROR: "sprd_platform_compr_ops" [sound/soc/sprd/sprd-pcm-dma.ko] undefined!
>
> Caused by commit
>
>   cce1396936ef ("ASoC: sprd: Add Spreadtrum audio compress offload support")
>
> I have used the sound-asoc tree from next-20190402 for today.
>

Thanks for pointing this out. I think I should fix the Makefile like this

snd-soc-sprd-platform-objs := sprd-pcm-dma.o sprd-pcm-compress.o

obj-$(CONFIG_SND_SOC_SPRD) += snd-soc-sprd-platform.o

I will send out one incremental patch to fix this issue after my
business trip. Thanks.
-- 
Baolin Wang
Best Regards
