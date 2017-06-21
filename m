From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Subject: Re: linux-next: build failure after merge of the spi-nor tree
Date: Thu, 22 Jun 2017 00:37:11 +0200
Message-ID: <bd8f3821-11ce-9607-d393-5190f5ddf767@wedev4u.fr>
References: <20170621121911.28b506b7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170621121911.28b506b7@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, Marek Vasut <marek.vasut@gmail.com>
List-Id: linux-next.vger.kernel.org

Hi Stephen,

Le 21/06/2017 à 04:19, Stephen Rothwell a écrit :
> Hi Cyrille,
> 
> After merging the spi-nor tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> drivers/mtd/spi-nor/aspeed-smc.c: In function 'aspeed_smc_chip_set_segment':
> drivers/mtd/spi-nor/aspeed-smc.c:554:14: error: 'SZ_128M' undeclared (first use in this function)
>       size == SZ_128M) {
>               ^
> 
> Caused by commit
> 
>   bb3a588d2151 ("mtd: spi-nor: aspeed: configure chip window on AHB bus")
> 
> Forgot to include linux/sizes.h.

I've squashed the fixup into the faulty patch in the spi-nor/next branch
of l2-mtd, so it should be OK now.

Thank you for your report and sorry for the noise!

Best regards,

Cyrille

> 
> I have used the spi-nor tree from next-20170620 for today.
> 
