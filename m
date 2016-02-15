From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: arm qemu test failures due to 'driver-core: platform: probe
 of-devices only using list of compatibles'
Date: Mon, 15 Feb 2016 10:04:15 +0000
Message-ID: <20160215100415.GD10826@n2100.arm.linux.org.uk>
References: <20160214165010.GA3189@roeck-us.net>
 <20160214195501.GA12289@pengutronix.de>
 <20160214200755.GB10826@n2100.arm.linux.org.uk>
 <20160215081750.GD12289@pengutronix.de>
 <20160215085818.GC10826@n2100.arm.linux.org.uk>
 <20160215091406.GE12289@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from pandora.arm.linux.org.uk ([78.32.30.218]:52703 "EHLO
	pandora.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750942AbcBOKEY (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 15 Feb 2016 05:04:24 -0500
Content-Disposition: inline
In-Reply-To: <20160215091406.GE12289@pengutronix.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>

On Mon, Feb 15, 2016 at 10:14:06AM +0100, Uwe Kleine-K=F6nig wrote:
> Hello Russell,
>=20
> On Mon, Feb 15, 2016 at 08:58:18AM +0000, Russell King - ARM Linux wr=
ote:
> > On Mon, Feb 15, 2016 at 09:17:50AM +0100, Uwe Kleine-K=F6nig wrote:
> > > On Sun, Feb 14, 2016 at 08:07:55PM +0000, Russell King - ARM Linu=
x wrote:
> > > > On Sun, Feb 14, 2016 at 08:55:01PM +0100, Uwe Kleine-K=F6nig wr=
ote:
> > > > > So the unexpected abnormality here is that even though this d=
evice is
> > > > > instantiated by dt, the driver doesn't provide any compatible=
s.
> > > > > Either my expectation is wrong, then 67d02a1bbb33455 should b=
e reverted
> > > >=20
> > > > Your expectation is wrong.  AMBA primecell devices have hardwar=
e IDs
> > > > and are matched to their drivers by those IDs.  Just like PCI.
> > >=20
> > > pci devices don't appear in dt, do they? I don't see the connecti=
on
> > > between amba devices and platform devices, see my other mail in t=
his
> > > thread for some more details.
> >=20
> > They both have hardware IDs, and they are both matched via those ha=
rdware
> > IDs.
>=20
> I changed platform_match which is about matching by dt compatible, ac=
pi
> and/or device name. I don't see how this can affect an amba device gi=
ven
> they match to a driver by a hardware id.
>=20
> > Your change has introduced a regression and is therefore wrong.
>=20
> I'd like to understand though why and how my commit is wrong to be ab=
le
> to fix it instead of getting it reverted.

I don't have the commit, and I haven't seen the patch so I can't
comment further, sorry.

--=20
RMK's Patch system: http://www.arm.linux.org.uk/developer/patches/
=46TTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
