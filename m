From: Pawel Moll <pawel.moll@arm.com>
Subject: Re: linux-next: manual merge of the clk tree with the arm-soc tree
Date: Tue, 30 Oct 2012 10:39:14 +0000
Message-ID: <1351593554.2831.8.camel@hornet>
References: <20121030150627.ac1f6a3f75231ea49edf7b98@canb.auug.org.au>
	 <20121030101140.18780.69840@nucleus>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from service87.mimecast.com ([91.220.42.44]:36626 "EHLO
	service87.mimecast.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758201Ab2J3KjV convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 30 Oct 2012 06:39:21 -0400
In-Reply-To: <20121030101140.18780.69840@nucleus>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mike Turquette <mturquette@ti.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Tue, 2012-10-30 at 10:11 +0000, Mike Turquette wrote:
> > diff --cc arch/arm/include/asm/hardware/sp810.h
> > index 2cdcf44,afd7e91..0000000
> > --- a/arch/arm/include/asm/hardware/sp810.h
> > +++ b/arch/arm/include/asm/hardware/sp810.h
> > @@@ -50,6 -50,14 +50,8 @@@
> >   #define SCPCELLID2            0xFF8
> >   #define SCPCELLID3            0xFFC
> >  =20
> >  -#define SCCTRL_TIMEREN0SEL_REFCLK     (0 << 15)
> >  -#define SCCTRL_TIMEREN0SEL_TIMCLK     (1 << 15)
> >  -
> >  -#define SCCTRL_TIMEREN1SEL_REFCLK     (0 << 17)
> >  -#define SCCTRL_TIMEREN1SEL_TIMCLK     (1 << 17)
> >  -
> > + #define SCCTRL_TIMERENnSEL_SHIFT(n)   (15 + ((n) * 2))
> > +=20
> >   static inline void sysctl_soft_reset(void __iomem *base)
> >   {
> >         /* switch to slow mode */
>=20
> Pawel,
>=20
> Does this look OK for you?

Yes, it's correct.

Thanks!

Pawe=C5=82
