From: Lee Jones <lee.jones@linaro.org>
Subject: Re: linux-next: build failure after merge of the mfd tree
Date: Thu, 15 Oct 2015 10:17:52 +0100
Message-ID: <20151015091752.GA31804@x1>
References: <20151015132602.7816b658@canb.auug.org.au>
 <7853704.H00KElTCBt@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wi0-f179.google.com ([209.85.212.179]:36600 "EHLO
	mail-wi0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750939AbbJOJR4 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 15 Oct 2015 05:17:56 -0400
Received: by wicgb1 with SMTP id gb1so263437408wic.1
        for <linux-next@vger.kernel.org>; Thu, 15 Oct 2015 02:17:55 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <7853704.H00KElTCBt@wuerfel>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Christoph Hellwig <hch@lst.de>

On Thu, 15 Oct 2015, Arnd Bergmann wrote:

> On Thursday 15 October 2015 13:26:02 Stephen Rothwell wrote:
> > After merging the mfd tree, today's linux-next build (x86_64 allmod=
config)
> > failed like this:
> >=20
> > drivers/mfd/intel-lpss.c:29:47: fatal error: asm-generic/io-64-nona=
tomic-lo-hi.h: No such file or directory
> >  #include <asm-generic/io-64-nonatomic-lo-hi.h>
> >                                                ^
> >=20
> > Caused by commit
> >=20
> >   6a1d82fbc8e8 ("mfd: intel-lpss: Use writeq() helper")
> >=20
> > interacting with commit
> >=20
> >   f626fe17485b ("move io-64-nonatomic*.h out of asm-generic")
> >=20
> > from the asm-generic tree.
> >=20
> > I have added the following merge fix patch and can carry it as nece=
ssary.
> >=20
> > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > Date: Thu, 15 Oct 2015 13:23:20 +1100
> > Subject: [PATCH] mfd: fix for "move io-64-nonatomic*.h out of asm-g=
eneric"
> >=20
> > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
>=20
> The patch looks good, should we do something to prevent that from
> becoming a problem when Linus pulls our branches?
>=20
> This commit is at the bottom of my asm-generic git tree, so Lee could=
 merge
> that one commit into his tree and fix up the merge correctly.
>=20
> However, I also now see that drivers/net/ethernet/hisilicon/hns/hns_d=
saf_xgmac.c
> has the same problem, so maybe it's better to add a temporary file
> with the old name containing "#include <linux/io-64-nonatomic-lo-hi.h=
>",
> which I will remove in the following merge window or as a follow-up.
>=20
> Yet another way would be for me to wait until Linus has pulled both
> mfd and netdev been merged, and I'll let him know of the conflict
> in my pull request.

I'll remain flexible.  Whatever you think is the best solution we'll
go with and I'll facilitate.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
