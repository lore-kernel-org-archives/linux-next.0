From: David Brownell <david-b@pacbell.net>
Subject: Re: [PATCH] fix build error of driver/mfd/tc6393xb.c
Date: Fri, 4 Jul 2008 09:52:10 -0700
Message-ID: <200807040952.10401.david-b@pacbell.net>
References: <s5hiqvlc2ut.wl%tiwai@suse.de> <20080704132234.GA4576@doriath.ww600.siemens.net> <s5hd4ltlpgl.wl%tiwai@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp115.sbc.mail.sp1.yahoo.com ([69.147.64.88]:45811 "HELO
	smtp115.sbc.mail.sp1.yahoo.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1759891AbYGDQwM (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 4 Jul 2008 12:52:12 -0400
In-Reply-To: <s5hd4ltlpgl.wl%tiwai@suse.de>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Dmitry Baryshkov <dbaryshkov@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Friday 04 July 2008, Takashi Iwai wrote:
> Then HAVE_GPIO_LIB selects GENERIC_GPIO. =A0Right now, it's a missing
> dependency.

Right.


> > Also linux/gpio.h don't have anything in common with HAVE_GPIO_LIB.
>=20
> That's another side of the problem.

Not a problem at all.  One is the interface.  Another is one
of several valid implementations ... the only currently
providing an infrastructure allowing providers like tc6393xb
to plug in as easily as SOC-native providers.

- Dave
