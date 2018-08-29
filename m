From: Baolin Wang <baolin.wang@linaro.org>
Subject: Re: linux-next: build failure after merge of the spi tree
Date: Wed, 29 Aug 2018 09:29:38 +0800
Message-ID: <CAMz4kuJ8+ZOTE_B5aHSUjVATO0_3jRNnpZWav655T4OEo2b_UA@mail.gmail.com>
References: <20180829103349.5cd15637@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180829103349.5cd15637@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mark Brown <broonie@kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Lanqing Liu <lanqing.liu@spreadtrum.com>
List-Id: linux-next.vger.kernel.org

Hi Mark,

On 29 August 2018 at 08:33, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Mark,
>
> After merging the spi tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
>
> In file included from include/linux/clk.h:16,
>                  from drivers/spi/spi-sprd.c:4:
> drivers/spi/spi-sprd.c: In function 'sprd_spi_init_hw':
> drivers/spi/spi-sprd.c:462:29: error: 'struct spi_transfer' has no member named 'word_delay'
>   word_delay = clamp_t(u16, t->word_delay, SPRD_SPI_MIN_DELAY_CYCLE,
>                              ^~
>
> (and many more)
>
> Caused by commit
>
>   e7d973a31c24 ("spi: sprd: Add SPI driver for Spreadtrum SC9860")
>
> I have used the spi tree from next-20180828 for today.

You missed one patch (spi: Introduce one new field to set word delay),
could you apply this patch into your next branch? Thanks.

https://patchwork.kernel.org/patch/10567387/

-- 
Baolin Wang
Best Regards
