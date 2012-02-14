From: Russell King <rmk@arm.linux.org.uk>
Subject: Re: Breakage from ARM when building x86
Date: Tue, 14 Feb 2012 16:53:05 +0000
Message-ID: <20120214165305.GA6362@flint.arm.linux.org.uk>
References: <20120214164453.003d9777@pyramind.ukuu.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:40506 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756301Ab2BNQxV (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 14 Feb 2012 11:53:21 -0500
Content-Disposition: inline
In-Reply-To: <20120214164453.003d9777@pyramind.ukuu.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>, Grant Likely <grant.likely@secretlab.ca>
Cc: linux-next@vger.kernel.org

On Tue, Feb 14, 2012 at 04:44:53PM +0000, Alan Cox wrote:
> Either this needs the headers fixing or should be protected by an ARM
> config, not sure which

At a guess, this is from linux-next ?

> drivers/mfd/twl-core.c: In function =E2=80=98twl_probe=E2=80=99:
> drivers/mfd/twl-core.c:1218:2: error: implicit declaration of functio=
n
> =E2=80=98irq_alloc_descs=E2=80=99 [-Werror=3Dimplicit-function-declar=
ation]
> drivers/mfd/twl-core.c:1226:2: error: implicit declaration of functio=
n
> =E2=80=98irq_domain_add_legacy=E2=80=99 [-Werror=3Dimplicit-function-=
declaration]
> drivers/mfd/twl-core.c:1227:11: error: =E2=80=98irq_domain_simple_ops=
=E2=80=99 undeclared
> (first use in this function) drivers/mfd/twl-core.c:1227:11: note: ea=
ch
> undeclared identifier is reported only once for each function it appe=
ars
> in cc1: some warnings being treated as errors

This has nothing to do with me ;)  You're not the first to report it to=
day.
I'm told by OMAP people that TWL gets used on x86 as well so it can't b=
e
restricted to just ARM.

This is probably due to the irq domain stuff coming out of Grant's tree=
=2E

So no, really not anything to do with ARM.

--=20
Russell King
 Linux kernel    2.6 ARM Linux   - http://www.arm.linux.org.uk/
 maintainer of:
