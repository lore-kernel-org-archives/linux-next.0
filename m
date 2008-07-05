From: Dmitry Baryshkov <dbaryshkov@gmail.com>
Subject: Re: [PATCH] fix build error of driver/mfd/tc6393xb.c
Date: Sat, 5 Jul 2008 12:31:22 +0400
Message-ID: <20080705083122.GA7026@doriath.ww600.siemens.net>
References: <s5hiqvlc2ut.wl%tiwai@suse.de> <20080704142208.GB4576@doriath.ww600.siemens.net> <s5hwsk1k6yj.wl%tiwai@suse.de> <200807040954.34838.david-b@pacbell.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from fg-out-1718.google.com ([72.14.220.155]:47627 "EHLO
	fg-out-1718.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754049AbYGEIbd (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 5 Jul 2008 04:31:33 -0400
Received: by fg-out-1718.google.com with SMTP id 19so560266fgg.17
        for <linux-next@vger.kernel.org>; Sat, 05 Jul 2008 01:31:29 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <200807040954.34838.david-b@pacbell.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Brownell <david-b@pacbell.net>
Cc: Takashi Iwai <tiwai@suse.de>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Fri, Jul 04, 2008 at 09:54:34AM -0700, David Brownell wrote:
> On Friday 04 July 2008, Takashi Iwai wrote:
> >=20
> > > Please submit a patch where HAVE_GPIO_LIB selects GENERIC_GPIO.
> >=20
> > Hmm... just checking again, I found GENERIC_GPIO isn't defined in
> > drivers/gpio/Kconfig but in each arch Kconfig. =A0So we can't selec=
t it
> > unconditionally.
> >=20
> > I'm not sure whether it's a better fix at this moment.
>=20
> Which platform is it which is trying to declare that it has
> an implementation (HAVE_GPIO_LIB) of an interface that it
> doesn't support (GENERIC_GPIO unset) ??

the powerpc with PPC_MPC52xx=3Dy, PPC_MPC5200_GPIO=3Dy

--=20
With best wishes
Dmitry
