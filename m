From: Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: linux-next: build failure after merge of the mmc-fixes tree
Date: Wed, 27 Feb 2019 10:43:15 +0100
Message-ID: <CAPDyKFoXY2wx+HoVEJuPGEJnmUYYK+sCEGEDWhAKJ9bV5zytkg@mail.gmail.com>
References: <20190226082200.4f7aa469@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190226082200.4f7aa469@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Takeshi Saito <takeshi.saito.xv@renesas.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, Simon Horman <horms+renesas@verge.net.au>
List-Id: linux-next.vger.kernel.org

On Mon, 25 Feb 2019 at 22:22, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi Ulf,
>
> After merging the mmc-fixes tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> drivers/mmc/host/tmio_mmc_core.c: In function 'tmio_mmc_start_data':
> drivers/mmc/host/tmio_mmc_core.c:706:34: error: 'SZ_64K' undeclared (first use in this function); did you mean 'EM_68K'?
>   if (host->mmc->max_blk_count >= SZ_64K)
>                                   ^~~~~~
>                                   EM_68K
> drivers/mmc/host/tmio_mmc_core.c:706:34: note: each undeclared identifier is reported only once for each function it appears in
>
> Caused by commit
>
>   063f8fee9927 ("mmc: tmio: fix access width of Block Count Register")
>
> I have reverted that commit for today.

Thanks for letting me know and sorry for the inconvenience! The
offending patch is now amended and should be fixed.

Kind regards
Uffe
