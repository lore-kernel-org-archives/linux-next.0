From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: Re: linux-next: build failure after merge of the mfd tree
Date: Fri, 16 Sep 2011 09:16:38 +0200
Message-ID: <20110916071638.GJ11297@pengutronix.de>
References: <20110916135523.01ec57f699192230272e99e3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:41520 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753154Ab1IPHQm (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 16 Sep 2011 03:16:42 -0400
Content-Disposition: inline
In-Reply-To: <20110916135523.01ec57f699192230272e99e3@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Samuel Ortiz <sameo@linux.intel.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, David Jander <david@protonic.nl>

Hello Stephen,

On Fri, Sep 16, 2011 at 01:55:23PM +1000, Stephen Rothwell wrote:
> After merging the mfd tree, today's linux-next build (x86_64 allmodco=
nfig)
> failed like this:
>=20
> drivers/leds/leds-mc13783.c: In function 'mc13783_leds_prepare':
> drivers/leds/leds-mc13783.c:193:11: error: dereferencing pointer to i=
ncomplete type
> drivers/leds/leds-mc13783.c:196:11: error: dereferencing pointer to i=
ncomplete type
> drivers/leds/leds-mc13783.c:203:14: error: dereferencing pointer to i=
ncomplete type
> drivers/leds/leds-mc13783.c:206:11: error: dereferencing pointer to i=
ncomplete type
> drivers/leds/leds-mc13783.c:213:14: error: dereferencing pointer to i=
ncomplete type
> drivers/leds/leds-mc13783.c:216:11: error: dereferencing pointer to i=
ncomplete type
> drivers/leds/leds-mc13783.c:223:14: error: dereferencing pointer to i=
ncomplete type
> drivers/leds/leds-mc13783.c:226:11: error: dereferencing pointer to i=
ncomplete type
> drivers/leds/leds-mc13783.c:233:14: error: dereferencing pointer to i=
ncomplete type
> drivers/leds/leds-mc13783.c:236:11: error: dereferencing pointer to i=
ncomplete type
> drivers/leds/leds-mc13783.c:244:11: error: dereferencing pointer to i=
ncomplete type
> drivers/leds/leds-mc13783.c:246:11: error: dereferencing pointer to i=
ncomplete type
> drivers/leds/leds-mc13783.c:248:11: error: dereferencing pointer to i=
ncomplete type
> drivers/leds/leds-mc13783.c:250:11: error: dereferencing pointer to i=
ncomplete type
> drivers/leds/leds-mc13783.c:253:15: error: dereferencing pointer to i=
ncomplete type
> drivers/leds/leds-mc13783.c:255:15: error: dereferencing pointer to i=
ncomplete type
> drivers/leds/leds-mc13783.c: In function 'mc13783_led_probe':
> drivers/leds/leds-mc13783.c:278:11: error: dereferencing pointer to i=
ncomplete type
> drivers/leds/leds-mc13783.c:278:34: error: dereferencing pointer to i=
ncomplete type
> drivers/leds/leds-mc13783.c:279:54: error: dereferencing pointer to i=
ncomplete type
> drivers/leds/leds-mc13783.c:283:36: error: dereferencing pointer to i=
ncomplete type
> drivers/leds/leds-mc13783.c:295:23: error: dereferencing pointer to i=
ncomplete type
> drivers/leds/leds-mc13783.c:297:19: error: dereferencing pointer to i=
ncomplete type
> drivers/leds/leds-mc13783.c:299:14: error: dereferencing pointer to i=
ncomplete type
> drivers/leds/leds-mc13783.c:299:47: error: dereferencing pointer to i=
ncomplete type
> drivers/leds/leds-mc13783.c:300:50: error: dereferencing pointer to i=
ncomplete type
> drivers/leds/leds-mc13783.c:305:31: error: dereferencing pointer to i=
ncomplete type
> drivers/leds/leds-mc13783.c:307:13: error: dereferencing pointer to i=
ncomplete type
> drivers/leds/leds-mc13783.c:312:27: error: dereferencing pointer to i=
ncomplete type
> drivers/leds/leds-mc13783.c:313:31: error: dereferencing pointer to i=
ncomplete type
> drivers/leds/leds-mc13783.c:314:42: error: dereferencing pointer to i=
ncomplete type
> drivers/leds/leds-mc13783.c:317:24: error: dereferencing pointer to i=
ncomplete type
> drivers/leds/leds-mc13783.c:329:43: error: dereferencing pointer to i=
ncomplete type
> drivers/leds/leds-mc13783.c: In function 'mc13783_led_remove':
> drivers/leds/leds-mc13783.c:359:23: error: dereferencing pointer to i=
ncomplete type
>=20
> Presumably caused by commit 747c98a3660d ("leds: Convert mc13783 driv=
er
> to mc13xxx MFD").
>=20
> I have used the mfd tree from next-20110915 for today.
I'd look into the issue, but I don't have 747c98a3660d and I don't know
where to get it from. IMHO it would be great if you could push your nex=
t
tree somewhere.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig        =
    |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
