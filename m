From: David Brownell <david-b@pacbell.net>
Subject: Re: [PATCH] fix build error of driver/mfd/tc6393xb.c
Date: Fri, 4 Jul 2008 09:54:34 -0700
Message-ID: <200807040954.34838.david-b@pacbell.net>
References: <s5hiqvlc2ut.wl%tiwai@suse.de> <20080704142208.GB4576@doriath.ww600.siemens.net> <s5hwsk1k6yj.wl%tiwai@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp118.sbc.mail.sp1.yahoo.com ([69.147.64.91]:31447 "HELO
	smtp118.sbc.mail.sp1.yahoo.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1760111AbYGDQyg (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 4 Jul 2008 12:54:36 -0400
In-Reply-To: <s5hwsk1k6yj.wl%tiwai@suse.de>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Dmitry Baryshkov <dbaryshkov@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Friday 04 July 2008, Takashi Iwai wrote:
>=20
> > Please submit a patch where HAVE_GPIO_LIB selects GENERIC_GPIO.
>=20
> Hmm... just checking again, I found GENERIC_GPIO isn't defined in
> drivers/gpio/Kconfig but in each arch Kconfig. =A0So we can't select =
it
> unconditionally.
>=20
> I'm not sure whether it's a better fix at this moment.

Which platform is it which is trying to declare that it has
an implementation (HAVE_GPIO_LIB) of an interface that it
doesn't support (GENERIC_GPIO unset) ??
