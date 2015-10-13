From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: next-20151013 build: 1 failures 50 warnings (next-20151013)
Date: Tue, 13 Oct 2015 14:52:42 +0200
Message-ID: <10774670.W40zvvZu4L@wuerfel>
References: <E1ZlxDc-0000ea-U4@optimist> <20151013125026.GG14956@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.131]:61625 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752602AbbJMMwy (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 13 Oct 2015 08:52:54 -0400
In-Reply-To: <20151013125026.GG14956@sirena.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org
Cc: Mark Brown <broonie@kernel.org>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, Hauke Mehrtens <hauke@hauke-m.de>, Seiji Aguchi <seiji.aguchi@hds.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Mike Waychison <mikew@google.com>, Matt Fleming <matt.fleming@intel.com>, linux-mips@linux-mips.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On Tuesday 13 October 2015 13:50:26 Mark Brown wrote:
> On Tue, Oct 13, 2015 at 11:54:09AM +0100, Build bot for Mark Brown wrote:
> 
> Today's linux-next fails to build an ARM allmodconfig due to:
> 
> >       arm-allmodconfig
> > ../drivers/firmware/broadcom/bcm47xx_nvram.c:110:30: error: macro "DIV_ROUND_UP" requires 2 arguments, but only 1 given
> > ../drivers/firmware/broadcom/bcm47xx_nvram.c:110:4: error: 'DIV_ROUND_UP' undeclared (first use in this function)
> 
> triggered by f6e734a8c16229 (MIPS: BCM47xx: Move NVRAM driver to the
> drivers/firmware/).  Presumably this works due to an implicit inclusion
> on MIPS.
> 
> I've CCed a lot of people listed in the changelog of the patch, though
> the list there appears somewhat random - apologies if this is irrelevant
> to you.

I've submitted a patch yesterday, see https://lkml.org/lkml/2015/10/12/303

	ARnd
