From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: linux-next: "amba: Remove AMBA level regulator support" commit.
Date: Fri, 13 Apr 2012 11:32:07 +0100
Message-ID: <20120413103207.GL24211@n2100.arm.linux.org.uk>
References: <20120413012230.GA30438@windriver.com> <CAAQ0ZWReL=+bm9UOnt2=Dfy0zeWbJe3=y3pPzUKRzm2y277kFQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:44554 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932961Ab2DMKcY (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 13 Apr 2012 06:32:24 -0400
Content-Disposition: inline
In-Reply-To: <CAAQ0ZWReL=+bm9UOnt2=Dfy0zeWbJe3=y3pPzUKRzm2y277kFQ@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Shawn Guo <shawn.guo@linaro.org>
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, broonie@opensource.wolfsonmicro.com, linus.walleij@linaro.org, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On Fri, Apr 13, 2012 at 10:01:52AM +0800, Shawn Guo wrote:
> On 13 April 2012 09:22, Paul Gortmaker <paul.gortmaker@windriver.com>=
 wrote:
> > Hi Mark,
> >
> > The commit in linux-next:
> >
> > -----------------
> > commit b2bc9e0ee349db84035d8141e85babc7986594d7
> > Author: Mark Brown <broonie@sirena.org.uk>
> > Date: =A0 Mon Apr 2 12:30:35 2012 +0100
> >
> > =A0 =A0ARM: 7366/1: amba: Remove AMBA level regulator support
> > -----------------
> >
> > is pointed at by git bisect for the u8500_defconfig build failure:
> >
> > drivers/dma/ste_dma40.c:2708:3: error: implicit declaration of func=
tion
> > 'regulator_disable' [-Werror=3Dimplicit-function-declaration]
> > drivers/dma/ste_dma40.c:2747:3: error: implicit declaration of func=
tion
> > 'regulator_enable' [-Werror=3Dimplicit-function-declaration]
> > drivers/dma/ste_dma40.c:3260:3: error: implicit declaration of func=
tion
> > 'regulator_get' [-Werror=3Dimplicit-function-declaration]
> > drivers/dma/ste_dma40.c:3271:4: error: implicit declaration of func=
tion
> > 'regulator_put' [-Werror=3Dimplicit-function-declaration]
> >
> That's because Mark's patch removes "#include
> <linux/regulator/consumer.h>" included indirectly by
> drivers/dma/ste_dma40.c from linux/amba/bus.h.  The ste_dma40.c shoul=
d
> really directly includes consumer.h.

Okay, I'll drop this patch because it's causing regressions, so it can'=
t
be pushed as a 'fix' during -rc.
