From: David Brownell <david-b@pacbell.net>
Subject: Re: [PATCH] fix build error of driver/mfd/tc6393xb.c
Date: Mon, 7 Jul 2008 09:19:05 -0700
Message-ID: <200807070919.05305.david-b@pacbell.net>
References: <s5hiqvlc2ut.wl%tiwai@suse.de> <200807051013.10078.david-b@pacbell.net> <s5hr6a5vfpv.wl%tiwai@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp118.sbc.mail.sp1.yahoo.com ([69.147.64.91]:44870 "HELO
	smtp118.sbc.mail.sp1.yahoo.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1752677AbYGGQTM (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 7 Jul 2008 12:19:12 -0400
In-Reply-To: <s5hr6a5vfpv.wl%tiwai@suse.de>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Dmitry Baryshkov <dbaryshkov@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Monday 07 July 2008, Takashi Iwai wrote:
>=20
> > The most natural fix is to have the Kconfig for PPC_MPC52xx
> > select both GENERIC_GPIO and HAVE_GPIO_LIB.
>=20
> Yes. =A0I, however, still feel uneasy by the fact that the combinatio=
n
> GENERIC_GPIO=3Dn and HAVE_GPIO_LIB=3Dy doesn't work. =A0We should eit=
her fix
> it to work or disallow the combination.

As in, HAVE_GPIO_LIB depends on GENERIC_GPIO?  Fine with me;
but I'm not sure that would work. Won't Kconfig gleefully let
the "select" succeed but not select what it depends on?

We already "disallow" that combination ... but we lack any
automated way to enforce that.
