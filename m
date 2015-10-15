From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: next-20151015 build: 3 failures 46 warnings (next-20151015)
Date: Thu, 15 Oct 2015 15:29:34 +0200
Message-ID: <6421942.GNUzHZNjcs@wuerfel>
References: <E1Zmgkk-0005iq-39@optimist> <20151015115933.GD14956@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.10]:54368 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753150AbbJON36 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 15 Oct 2015 09:29:58 -0400
In-Reply-To: <20151015115933.GD14956@sirena.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linaro-kernel@lists.linaro.org
Cc: Mark Brown <broonie@kernel.org>, Christoph Hellwig <hch@lst.de>, Darren Hart <dvhart@linux.intel.com>, Hitoshi Mitake <mitake.hitoshi@lab.ntt.co.jp>, "David S. Miller" <davem@davemloft.net>, huangdaode <huangdaode@hisilicon.com>, linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org

On Thursday 15 October 2015 12:59:33 Mark Brown wrote:
> On Thu, Oct 15, 2015 at 12:31:22PM +0100, Build bot for Mark Brown wrote:
> 
> Today's linux-next fails to build both arm and arm64 allmodconfig with:
> 
> >       arm64-allmodconfig
> > ../drivers/net/ethernet/hisilicon/hns/hns_dsaf_xgmac.c:10:47: fatal error: asm-generic/io-64-nonatomic-hi-lo.h: No such file or directory
> 
> >       arm-allmodconfig
> > ../drivers/net/ethernet/hisilicon/hns/hns_dsaf_xgmac.c:10:47: fatal error: asm-generic/io-64-nonatomic-hi-lo.h: No such file or directory
> 
> This was triggered by f626fe17485b6dc (move io-64-nonatomic*.h out of
> asm-generic) which moved these helpers out of asm-generic (which should
> never be directly referenced outside of arch code anyway so arches can
> provide their own implementations as needed) and into linux/.  Since the
> HiSilicon driver has been added in -next it wasn't updated as part of
> the same commit.
> 

I've added a workaround in my asm-generic branch now, by adding back
a header in the old place that we can remove in 4.5 after we change over
this one and another one in mtd that Stephen has caught in linux-next.

	Arnd
