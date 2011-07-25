From: Shawn Guo <shawn.guo@freescale.com>
Subject: Re: linux-next: merge error in arch/arm/mm/Kconfig?
Date: Mon, 25 Jul 2011 12:40:27 +0800
Message-ID: <20110725044026.GB21641@S2100-06.ap.freescale.net>
References: <20110725041720.GA21641@S2100-06.ap.freescale.net>
 <20110725142348.efb4e0317938c2261498db32@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from tx2ehsobe004.messaging.microsoft.com ([65.55.88.14]:51560 "EHLO
	TX2EHSOBE008.bigfish.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750864Ab1GYEdT (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 25 Jul 2011 00:33:19 -0400
Content-Disposition: inline
In-Reply-To: <20110725142348.efb4e0317938c2261498db32@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On Mon, Jul 25, 2011 at 02:23:48PM +1000, Stephen Rothwell wrote:
> Hi Shawn,
> 
> On Mon, 25 Jul 2011 12:17:22 +0800 Shawn Guo <shawn.guo@freescale.com> wrote:
> >
> > There is a merge error (?) causing 'make ARCH=arm menuconfig' fails on
> > next-20110722.
> > 
> > ---8<-------------
> > diff --git a/arch/arm/mm/Kconfig b/arch/arm/mm/Kconfig
> > index d490c4a..2df5504 100644
> > --- a/arch/arm/mm/Kconfig
> > +++ b/arch/arm/mm/Kconfig
> > @@ -834,7 +834,7 @@ config CACHE_L2X0
> >         depends on REALVIEW_EB_ARM11MP || MACH_REALVIEW_PB11MP || MACH_REALVIEW_PB1176 || \
> >                    REALVIEW_EB_A9MP || SOC_IMX35 || SOC_IMX31 || MACH_REALVIEW_PBX || \
> >                    ARCH_NOMADIK || ARCH_OMAP4 || ARCH_EXYNOS4 || ARCH_TEGRA || \
> > -                  ARCH_U8500 || ARCH_VEXPRESS_CA9X4 || ARCH_SHMOBILE ||
> > +                  ARCH_U8500 || ARCH_VEXPRESS_CA9X4 || ARCH_SHMOBILE || \
> >                    ARCH_PRIMA2 || ARCH_ZYNQ || ARCH_CNS3XXX
> >         default y
> >         select OUTER_CACHE
> 
> Yeah, I reported this on Friday and it will be fixed in today's linux-next.
> 
Sorry for the noise, Stephen.  I should have searched the list before
posting.

-- 
Regards,
Shawn
